---
title: Timing Paths
description: Explanation of Timing Paths in Static Timing Analysis (STA).
date: 2025-07-24
tags: [ASIC, STA, Timing]
aliases: [Timing Path]
---

# Timing Paths

## Simple Explanation (Gist)
Timing paths are sequences of logic elements (gates and interconnects) through which a signal propagates in a digital circuit. In [[STA|Static Timing Analysis]], these paths are analyzed to ensure that signals arrive at their destinations within the required time, preventing timing violations.

## Detailed Breakdown

*   **Purpose**: Identifying and analyzing timing paths is fundamental to [[STA|Static Timing Analysis]]. Every possible path through which a signal can travel from a start point to an end point must be analyzed to ensure the design meets its performance specifications.

*   **Start Points and End Points**: A timing path always begins at a start point and ends at an end point.
    *   **Start Points**: Can be:
        *   **Clock Pins of Sequential Elements**: The clock input pin of a flip-flop or latch (e.g., `CK` pin of a D-flip-flop).
        *   **Primary Inputs**: Input ports of the chip.
    *   **End Points**: Can be:
        *   **Data Pins of Sequential Elements**: The data input pin of a flip-flop or latch (e.g., `D` pin of a D-flip-flop).
        *   **Primary Outputs**: Output ports of the chip.

*   **Types of Timing Paths**:
    1.  **Register-to-Register (reg2reg) Path**: The most common type of path, starting at the clock pin of a launching flip-flop and ending at the data pin of a capturing flip-flop. This path includes the clock-to-Q delay of the launching flip-flop, the delay through the combinational logic between the flip-flops, and the interconnect delays.
        ```mermaid
        graph LR
            CLK --> FF1_CK;
            FF1_CK --> FF1_Q;
            FF1_Q --> Combinational_Logic;
            Combinational_Logic --> FF2_D;
            FF2_D --> FF2_CK;
        ```
    2.  **Input-to-Register (in2reg) Path**: Starts at a primary input port and ends at the data pin of a capturing flip-flop. This path includes the external input delay and the delay through the combinational logic to the flip-flop.
    3.  **Register-to-Output (reg2out) Path**: Starts at the clock pin of a launching flip-flop and ends at a primary output port. This path includes the clock-to-Q delay of the flip-flop, the delay through the combinational logic, and the external output delay.
    4.  **Input-to-Output (in2out) Path**: Starts at a primary input port and ends at a primary output port, passing only through combinational logic. This is a purely combinational path.

*   **Path Delay Calculation**: The total delay of a timing path is the sum of:
    *   **Cell Delays**: Delays through the logic gates and sequential elements along the path.
    *   **Interconnect Delays**: Delays through the wires (nets) connecting the cells. These are derived from [[SPEF|parasitic extraction]] and depend on resistance and capacitance of the interconnects.

*   **Launch and Capture Paths**: For register-to-register paths, the timing check involves comparing the data arrival time at the capturing flip-flop with the data required time. This depends on the clock arrival times at both the launching and capturing flip-flops.
    *   **Launch Path**: The path from the clock source to the clock pin of the launching flip-flop.
    *   **Capture Path**: The path from the clock source to the clock pin of the capturing flip-flop.

*   **Critical Path**: The timing path with the worst slack (i.e., the path that is closest to violating its timing constraint, or already violating it). Identifying and optimizing the critical path is a primary goal of timing closure.

*   **Timing Exceptions**: Designers can specify [[Timing Exceptions]] (e.g., [[False Paths in STA|false paths]], [[Multicycle Paths|multicycle paths]]) to instruct the STA tool to ignore certain paths or apply different timing rules to them.

*   **Debugging Timing Paths**: When a timing violation occurs, designers use STA tools to generate detailed timing reports for the violating path. These reports show the delay contributions of each cell and net, helping to pinpoint the source of the delay and guide optimization efforts.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs-J-Bhasker/dp/0387719257)
*   [Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)](https://www.amazon.com/Constraining-Designs-Synthesis-Timing-Analysis/dp/1461404990)