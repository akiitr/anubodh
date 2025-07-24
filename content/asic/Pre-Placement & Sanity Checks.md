---
title: Pre-Placement & Sanity Checks
description: Pre-Placement & Sanity Checks in VLSI Physical Design
date: 2025-07-24
tags:
  - VLSI
  - Physical Design
  - Verification
aliases:
  - Pre-Placement Checks
  - Sanity Checks
---

# Pre-Placement & Sanity Checks in VLSI Physical Design

## Simple Explanation (Gist)
Pre-placement and sanity checks are a set of crucial verification steps performed before the main [[Placement]] stage in [[Physical Design]]. They ensure that the input [[Netlist]] and constraints are correct, complete, and consistent, preventing costly issues and iterations later in the design flow.

## Detailed Breakdown

*   **Motivation**: The physical design flow is highly iterative and computationally intensive. Errors or inconsistencies in the input data can lead to significant delays, poor quality of results, or even functional failures. Pre-placement and sanity checks act as a gate, catching fundamental issues early, thus saving time and resources.

*   **Key Checks Performed**: 
    1.  **[[Netlist Input]] Verification**: 
        *   **Netlist Integrity**: Checks for syntax errors, missing instances, or unconnected pins in the [[Gate-Level Netlist]].
        *   **Library Mapping**: Ensures all cells in the netlist are correctly mapped to available cells in the [[Standard Cell Library]] (.lib and .lef files).
        *   **Black Box Check**: Identifies any black boxes (unresolved modules) in the netlist that need to be resolved.
    2.  **[[SDC|Synopsys Design Constraints (SDC)]] Validation**: 
        *   **Syntax and Completeness**: Checks for correct SDC syntax and ensures all clocks, inputs, outputs, and exceptions are properly constrained.
        *   **Consistency**: Verifies that constraints are not conflicting or over-constraining the design.
        *   **Clock Definition**: Ensures all clocks are properly defined, including their periods, waveforms, and relationships.
        *   **[[Timing Exceptions]]**: Validates [[False Paths]] and [[Multicycle Paths]] to ensure they are correctly applied.
    3.  **[[Sanity Checks]] (Logical and Physical)**: 
        *   **[[Floating Nets and Pins in VLSI|Floating Nets and Pins]]**: Identifies nets or pins that are not connected, which can indicate design errors.
        *   **[[Multi-driven Nets]]**: Flags nets that are driven by more than one source, which can lead to contention and functional issues.
        *   **[[Combinational Loops|Combinational Loops]]**: Detects unintended feedback loops in combinational logic, which can cause oscillations or unpredictable behavior.
        *   **[[Library Consistency]]**: Verifies that the .lib and .lef files are consistent with each other and with the technology file.
        *   **[[DRV Fixing in VLSI|Design Rule Violation (DRV)]] Check**: Checks for basic design rule violations that might exist even before placement, such as minimum width/spacing violations in pre-placed macros.
        *   **Power and Ground Connectivity**: Ensures that all cells have proper power and ground connections.
    4.  **[[DFT Insertion]] Verification**: 
        *   If [[DFT|Design for Test]] structures (e.g., [[Scan Chains]]) have been inserted, checks their integrity and connectivity.
    5.  **Area and Utilization Check**: 
        *   Estimates the total area required by the design and compares it against the available area defined in the [[Floorplanning & Power Planning]] stage. Checks [[Core Utilization in VLSI|core utilization]] targets.

*   **Tools**: These checks are typically performed by the physical design implementation tools themselves (e.g., Synopsys IC Compiler II, Cadence Innovus) or by dedicated signoff tools like Synopsys PrimeTime or Cadence Tempus for SDC validation.

*   **Benefits**: 
    *   **Early Error Detection**: Catches critical issues at an early stage, where they are much easier and less costly to fix.
    *   **Reduced Iterations**: Prevents time-consuming iterations between physical design and earlier stages (synthesis, RTL).
    *   **Improved Quality of Results**: Ensures a clean starting point for placement, leading to better PPA results.
    *   **Predictability**: Enhances the predictability of the physical design flow.

## Further Reading

*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387333817)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [ASIC Physical Design Flow](https://www.vlsi-expert.com/2018/01/asic-physical-design-flow.html)