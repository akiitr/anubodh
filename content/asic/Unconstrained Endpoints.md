---
title: Unconstrained Endpoints
description: Explanation of Unconstrained Endpoints in Static Timing Analysis (STA).
date: 2025-07-24
tags: [ASIC, STA, Timing]
aliases: [Unconstrained Paths]
---

# Unconstrained Endpoints

## Simple Explanation (Gist)
Unconstrained endpoints are pins or ports in an ASIC design that are not covered by any timing constraint (like a clock definition or an input/output delay). This means the [[STA|Static Timing Analysis]] tool cannot properly analyze their timing, leading to potential functional failures or performance issues in silicon.

## Detailed Breakdown

*   **Purpose**: In [[STA|Static Timing Analysis]], every timing path must have a defined start point and end point, and these points must be constrained (e.g., by a clock, an input delay, or an output delay) for the tool to perform accurate timing checks. Unconstrained endpoints represent a gap in the timing analysis, meaning the tool cannot guarantee the timing correctness of paths leading to or from these points.

*   **What Constitutes an Unconstrained Endpoint?**:
    *   **Output ports** that do not have an `set_output_delay` constraint or are not part of a clocked path.
    *   **Input ports** that do not have an `set_input_delay` constraint or are not part of a clocked path.
    *   **Data pins of sequential elements (flip-flops/latches)** that are not clocked or are part of a clock domain that is not properly defined.
    *   **Combinational logic outputs** that are not connected to a constrained sequential element or output port.

*   **Why it's a Problem**:
    *   **Missed Timing Violations**: The most critical issue. If an endpoint is unconstrained, the STA tool will not perform timing checks on paths ending at that point. This means actual timing violations could exist in the silicon but would not be detected during verification.
    *   **Functional Failures**: Unchecked timing paths can lead to signals arriving too late or too early, causing incorrect data capture or propagation, and ultimately functional errors.
    *   **Unpredictable Performance**: The chip might not operate at the desired frequency or might exhibit intermittent failures.
    *   **Incomplete Sign-off**: A design with unconstrained endpoints cannot be confidently signed off for manufacturing, as its timing correctness is not fully verified.
    *   **Longer Debugging**: If a silicon bug is traced back to an unconstrained path, debugging becomes much harder as there was no prior timing analysis for that path.

*   **Causes of Unconstrained Endpoints**:
    *   **Missing [[SDC|SDC]] Constraints**: The most common cause is simply forgetting to define `set_input_delay`, `set_output_delay`, or `create_clock` for relevant ports or clock domains.
    *   **Incorrect SDC Constraints**: Errors in SDC syntax or logic that prevent the tool from correctly interpreting the constraints.
    *   **Unintended Asynchronous Paths**: Paths that are genuinely asynchronous but have not been explicitly declared as [[False Paths in STA|false paths]] or handled with proper [[Synchronizers|synchronization]].
    *   **Design Errors**: Logic that is truly floating or not connected as intended.

*   **Detection**:
    *   **[[STA|Static Timing Analysis]] Tools**: All major STA tools (e.g., PrimeTime, Tempus) have commands (e.g., `check_timing`, `report_timing -unconstrained`) to identify and report unconstrained paths and endpoints. These reports are crucial during timing closure.
    *   **Linting Tools**: Some advanced linting tools can identify potential unconstrained paths at the RTL stage.

*   **Fixing Unconstrained Endpoints**:
    *   **Add Missing Constraints**: The primary solution is to add appropriate `set_input_delay`, `set_output_delay`, or `create_clock` commands to the [[SDC|SDC]] file.
    *   **Declare Exceptions**: For truly asynchronous paths, declare them as [[False Paths in STA|false paths]] using `set_false_path`.
    *   **Synchronize Signals**: For signals crossing clock domains, ensure proper [[Synchronizers|synchronization]] is in place and that the synchronized path is constrained.
    *   **Correct Design Errors**: If the unconstrained endpoint is due to a design flaw, the RTL or netlist must be corrected.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs-J-Bhasker/dp/0387719257)
*   [Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)](https://www.amazon.com/Constraining-Designs-Synthesis-Timing-Analysis/dp/1461404990)