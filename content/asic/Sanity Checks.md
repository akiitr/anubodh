---
title: Sanity Checks
description: Explanation of Sanity Checks in ASIC Physical Design.
date: 2025-07-24
tags: [ASIC, Physical Design, Verification]
aliases: [Pre-Placement Checks]
---

# Sanity Checks

## Simple Explanation (Gist)
Sanity checks in ASIC physical design are a set of preliminary verification steps performed early in the flow, typically before or during [[Pre-Placement & Sanity Checks|pre-placement]], to catch fundamental design issues that could cause major problems later on.

## Detailed Breakdown

*   **Purpose**: The primary goal of sanity checks is to ensure the design is structurally sound and ready for physical implementation. They act as a quick filter to identify common errors that, if left unaddressed, would lead to significant delays, iterations, or even functional failures.

*   **When Performed**: These checks are usually performed after the [[Gate-Level Netlist]] is generated and before or during the initial stages of [[Floorplanning & Power Planning|floorplanning]] and [[Placement]].

*   **Common Sanity Checks**:
    1.  **[[Floating Nets and Pins in VLSI|Floating Nets and Pins]]**: Checks for any unconnected input or output pins, or nets that are not driven by any source or connected to any load. These can lead to unpredictable behavior.
    2.  **[[Multi-driven Nets]]**: Identifies nets that are driven by more than one source. This creates contention and can lead to incorrect logic values or excessive current.
    3.  **[[Combinational Loops|Combinational Loops]]**: Detects feedback paths in combinational logic. These loops can cause oscillations or unstable behavior and are generally not allowed in synchronous digital designs.
    4.  **[[Library Consistency]]**: Verifies that all cells used in the netlist are present in the technology libraries (e.g., [[Timing Library]], [[LEF|LEF]], [[DEF|DEF]]) and that their definitions are consistent.
    5.  **[[SDC Checks]]**: Ensures that the [[SDC|Synopsys Design Constraints (SDC)]] file is syntactically correct, complete, and logically consistent. This includes checking for unconstrained paths, conflicting constraints, and correct clock definitions.
    6.  **[[DRV Fixing in VLSI|DRV (Design Rule Violation) Fixing]]**: While detailed DRC is done later, some basic DRVs related to cell placement or connectivity might be checked and fixed at this stage.
    7.  **Black Box Checks**: If the design contains black boxes (unimplemented blocks), checks ensure they are correctly defined and instantiated.
    8.  **Hierarchical Consistency**: Verifies that the top-level netlist correctly instantiates and connects all sub-modules.

*   **Benefits**:
    *   **Early Bug Detection**: Catches critical issues early in the design cycle, where they are much easier and less costly to fix.
    *   **Reduced Iterations**: Prevents time-consuming iterations between physical design and synthesis/RTL design.
    *   **Improved Design Quality**: Ensures a robust and stable starting point for the physical implementation flow.
    *   **Faster Turnaround Time**: By minimizing downstream issues, overall design time is reduced.

*   **Tools**: Most physical design tools (e.g., Synopsys IC Compiler II, Cadence Innovus) have built-in sanity check functionalities. Dedicated linting tools can also perform some of these checks at the RTL level.

## Further Reading

*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387719257)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Closure/dp/0071462546)