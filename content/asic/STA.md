---
title: STA
description: Explanation of Static Timing Analysis (STA) in ASIC design.
date: 2025-07-24
tags: [ASIC, STA, Timing]
aliases: [Static Timing Analysis]
---

# STA (Static Timing Analysis)

## Simple Explanation (Gist)
Static Timing Analysis (STA) is a method used in ASIC design to verify that all timing paths in a digital circuit meet their performance requirements without actually simulating the circuit with test vectors. It mathematically calculates the delays of all possible paths and checks them against specified timing constraints.

## Detailed Breakdown

*   **Purpose**: The primary goal of STA is to ensure that the design will operate correctly at the desired clock frequency and that all data arrives at its destination within the allocated time. It is a crucial [[Sign Off|sign-off]] step before chip manufacturing.

*   **Why "Static"?**: Unlike [[Simulation|dynamic timing simulation]], STA does not require input test vectors. Instead, it analyzes the design's timing characteristics by considering all possible paths from a start point (e.g., clock source, input port) to an end point (e.g., flip-flop data input, output port) and calculates their delays under various operating conditions.

*   **Key Inputs to STA**:
    1.  **[[Netlist]]**: The gate-level netlist (or RTL for early analysis) of the design, describing the connectivity of logic gates and sequential elements.
    2.  **[[Timing Library]]**: Characterization data for all standard cells and macros used in the design. This includes information about cell delays (e.g., input pin to output pin delay), setup/hold times, and output transition times.
    3.  **[[SDC|Synopsys Design Constraints (SDC)]]**: A file containing all timing constraints, such as clock definitions (period, waveform), input/output delays, and timing exceptions (e.g., [[False Paths in STA|false paths]], [[Multicycle Paths|multicycle paths]]).
    4.  **[[SPEF|Parasitic Files]]**: Extracted parasitic resistance (R) and capacitance (C) values of the interconnects (wires) from the physical layout. These are crucial for accurate delay calculation.
    5.  **Operating Conditions (PVT Corners)**: Specifies the process, voltage, and temperature variations under which the timing analysis should be performed (e.g., typical, worst-case, best-case).

*   **How STA Works (Basic Steps)**:
    1.  **Path Identification**: The STA tool identifies all possible timing paths in the design (e.g., register-to-register, input-to-register, register-to-output, input-to-output).
    2.  **Delay Calculation**: For each path, the tool calculates the total delay by summing up the delays of the logic cells and the interconnects along the path. This calculation considers the drive strength of the cells, the load they are driving, and the transition times of the signals.
    3.  **Timing Check**: The calculated path delay is then compared against the timing constraints specified in the SDC file (e.g., clock period, setup/hold times). If the calculated delay violates a constraint, a timing violation is reported.

*   **Key Concepts in STA**:
    *   **[[Setup|Setup Time]]** and **[[Hold Time]]**: Fundamental timing requirements for sequential elements.
    *   **[[Clock Skew]]**: The difference in arrival times of the clock signal at different sequential elements.
    *   **[[Clock Latency]]**: The total delay from the clock source to the clock pin of a sequential element.
    *   **[[Timing Paths]]**: The various types of paths analyzed (e.g., data path, clock path, launch path, capture path).
    *   **[[Timing Exceptions]]**: Constraints that modify the default timing analysis rules.
    *   **[[OCV|On-Chip Variation (OCV)]]**: Accounts for variations in cell delays and interconnects across the chip.
    *   **[[Signal Integrity]]**: Analysis of noise (e.g., [[Crosstalk Delay|crosstalk]]) and its impact on timing.

*   **Benefits**:
    *   **Exhaustive Analysis**: Checks all possible timing paths, ensuring no critical path is missed.
    *   **Accuracy**: Provides highly accurate timing predictions when provided with accurate parasitic and library data.
    *   **Speed**: Much faster than dynamic simulation for comprehensive timing verification.
    *   **Early Feedback**: Can be run at various stages of the design flow (e.g., after synthesis, after placement) to provide early feedback on timing closure.

*   **Tools**: Leading STA tools include Synopsys PrimeTime, Cadence Tempus, and Siemens Tessent Shell with STA capabilities.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs-J-Bhasker/dp/0387719257)
*   [Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)](https://www.amazon.com/Constraining-Designs-Synthesis-Timing-Analysis/dp/1461404990)