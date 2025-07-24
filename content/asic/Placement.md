---
title: Placement
description: Placement in VLSI Physical Design
date: 2025-07-24
tags:
  - VLSI
  - Physical Design
  - P&R
aliases:
  - Placement
---

# Placement in VLSI Physical Design

## Simple Explanation (Gist)
Placement is a critical step in [[Physical Design]] where the standard cells and macros from the [[Gate-Level Netlist]] are arranged onto the chip's layout area. The goal is to optimize for [[PPA|Power, Performance, and Area]] by minimizing wire lengths, reducing congestion, and meeting timing requirements.

## Detailed Breakdown

*   **Motivation**: After [[Floorplanning & Power Planning]], the overall chip area and major block locations are defined. Placement then determines the exact coordinates for millions of individual standard cells (e.g., gates, flip-flops) and pre-designed macros (e.g., memories, IP blocks). A good placement is fundamental for achieving timing closure, minimizing power consumption, and ensuring routability.

*   **Objectives**: 
    1.  **Timing Closure**: The primary objective is to place cells such that all timing paths meet their setup and hold requirements. This involves minimizing the distance between sequentially connected cells to reduce interconnect delays.
    2.  **Routability**: Ensure that there is enough space and clear paths for the routing tool to connect all the cells without creating excessive congestion.
    3.  **Power Optimization**: Place cells to minimize dynamic power (by reducing switching activity and capacitance) and static power (by using appropriate cell types and minimizing leakage).
    4.  **Area Minimization**: Achieve the smallest possible chip area while meeting other constraints.
    5.  **Signal Integrity**: Minimize [[Crosstalk]] and other signal integrity issues by controlling wire lengths and adjacencies.

*   **Types of Placement**: 
    *   **Global Placement**: An initial, coarse placement where cells are assigned to general regions of the chip, often allowing some overlap. The focus is on optimizing overall wire length and congestion.
    *   **Detailed Placement**: Refines the global placement by moving cells to legal, non-overlapping positions on the placement grid, adhering to design rules.
    *   **Legalization**: The final step that ensures all cells are placed on valid sites and do not overlap.

*   **Key Considerations/Techniques**: 
    1.  **[[Standard Cell Placement]]**: Placing the individual logic gates and flip-flops.
    2.  **[[Placement Optimization]]**: 
        *   **[[Timing-driven Placement]]**: Prioritizes the placement of cells on critical timing paths to minimize their delays.
        *   **[[Power-driven Placement]]**: Considers power consumption during placement, often by grouping cells with high switching activity or placing low-power cells strategically.
        *   **[[Congestion-driven Placement]]**: Attempts to spread out cells in dense areas to alleviate routing congestion.
    3.  **[[Congestion Analysis]]**: Tools analyze the placement to identify areas where routing resources might be insufficient, indicating potential congestion problems.
    4.  **[[Cell Density]]**: Managing the density of cells across the chip to ensure uniform routability and manufacturability.
    5.  **[[High-Fanout Net Synthesis (HFNS)]]**: Special handling for nets with a very large number of loads (e.g., clocks, resets) to ensure their delays are manageable.
    6.  **[[Scan Chain Reordering]]**: Optimizing the order of flip-flops in [[Scan Chains]] to minimize their routing length and impact on overall chip area.
    7.  **[[Physical-Only Cells]]**: Insertion of cells like [[Tap Cells]], [[Endcap Cells]], [[Decaps]], and [[Tie Cells]] to meet design rules and improve reliability.

*   **Inputs**: 
    *   [[Gate-Level Netlist]]
    *   [[Timing Library]] (.lib) and [[LEF|Library Exchange Format]] (.lef) files
    *   [[SDC|Synopsys Design Constraints]] (.sdc)
    *   [[DEF|Design Exchange Format]] (.def) from floorplanning

*   **Outputs**: 
    *   Updated .def file with cell coordinates
    *   Timing reports
    *   Congestion maps

## Further Reading

*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387333817)
*   [CMOS VLSI Design: A Circuits and Systems Perspective](https://www.amazon.com/CMOS-VLSI-Design-Circuits-Perspective/dp/0321547748)