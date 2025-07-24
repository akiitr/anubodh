---
title: SDC Checks
description: Explanation of SDC Checks in ASIC Physical Design.
date: 2025-07-24
tags: [ASIC, Physical Design, SDC, Verification]
aliases: [SDC Validation]
---

# SDC Checks

## Simple Explanation (Gist)
SDC (Synopsys Design Constraints) checks are a crucial part of ASIC design flow that verify the correctness, completeness, and consistency of the timing constraints provided in the [[SDC|SDC]] file, ensuring that the design is properly constrained for [[STA|Static Timing Analysis]] and synthesis.

## Detailed Breakdown

*   **Purpose**: The primary goal of SDC checks is to catch errors in the timing constraints early in the design flow. Incorrect or incomplete SDC can lead to:
    *   **Optimizations based on wrong assumptions**: Synthesis and physical design tools might optimize the design incorrectly, leading to functional failures or poor performance.
    *   **False timing violations**: Reporting violations that are not real, leading to unnecessary design iterations.
    *   **Missed timing violations**: Failing to report real violations, resulting in silicon failures.
    *   **Long runtimes**: Tools might struggle to converge if constraints are ambiguous or conflicting.

*   **When Performed**: SDC checks are performed at various stages of the ASIC design flow, including:
    *   After [[RTL Design|RTL coding]] (for initial sanity checks).
    *   After [[Synthesis]] (to verify constraints are correctly applied to the gate-level netlist).
    *   Throughout [[Physical Design]] (especially before [[STA|Static Timing Analysis]] and [[Sign Off|sign-off]]).

*   **Common SDC Checks**:
    1.  **Syntax and Semantic Checks**: Verifying that the SDC commands are correctly written and that the objects (clocks, ports, pins) referenced in the SDC file exist in the design.
    2.  **Clock Definition Checks**: Ensuring all clocks are properly defined, including their periods, waveforms, and relationships. Checks for:
        *   Missing clock definitions.
        *   Multiple clock definitions on the same source.
        *   Unconstrained clock domains.
        *   Correctly defined generated clocks.
    3.  **Input/Output Delay Checks**: Verifying that input and output delays are properly constrained relative to their respective clocks. Checks for:
        *   Missing input/output delays.
        *   Incorrect reference pins for delays.
    4.  **Timing Exception Checks**: Validating the correctness of timing exceptions like [[False Paths in STA|false paths]] and [[Multicycle Paths|multicycle paths]]. Checks for:
        *   Over-constraining (e.g., false path on a real path).
        *   Under-constraining (e.g., missing false path for an asynchronous interface).
        *   Conflicting exceptions.
    5.  **Unconstrained Path Checks**: Identifying any timing paths in the design that are not covered by any clock or timing exception. These paths are not analyzed by STA tools and can lead to functional issues.
    6.  **Constraint Consistency Checks**: Ensuring that different constraints do not conflict with each other (e.g., a port defined as both input and output).
    7.  **Clock Group Checks**: Verifying that clock groups are correctly defined for exclusive or asynchronous clocks.
    8.  **Case Analysis Checks**: If `set_case_analysis` commands are used, ensuring they are correctly applied and do not create unreachable logic.

*   **Tools**: EDA tools like Synopsys PrimeTime, Cadence Tempus, and other synthesis and STA tools have built-in SDC checking capabilities (e.g., `check_timing` command in PrimeTime).

## Further Reading

*   [Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)](https://www.amazon.com/Constraining-Designs-Synthesis-Timing-Analysis/dp/1461404990)
*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387719257)