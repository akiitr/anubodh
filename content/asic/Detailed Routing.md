---
title: Detailed Routing
description: Explanation of Detailed Routing in VLSI Physical Design.
date: 2025-07-24
tags: [ASIC, Physical Design, Routing]
aliases: [Detailed Route]
---

# Detailed Routing

## Simple Explanation (Gist)
Detailed routing is the final stage of the [[Routing]] process in VLSI physical design, where the exact geometric paths (metal traces and vias) for all interconnections are determined, ensuring all design rules are met and the chip is manufacturable.

## Detailed Breakdown

*   **Purpose**: Detailed routing takes the coarse routing plan from [[Global Routing]] and converts it into a precise physical layout. Its primary goal is to connect all pins of the placed standard cells and macros while strictly adhering to all [[Design Rule Check (DRC)|design rules]] and optimizing for timing, signal integrity, and manufacturability.

*   **Inputs**: The main inputs to detailed routing are:
    *   The placed design (from the [[Placement]] stage).
    *   The global routing plan (from [[Global Routing]]).
    *   The [[Gate-Level Netlist]].
    *   [[Timing Library|Timing libraries]] and [[LEF|LEF]] files.
    *   [[SDC|SDC]] (Synopsys Design Constraints).
    *   The [[Technology File]] (which defines metal layers, design rules, etc.).

*   **How it Works**: 
    *   **Channel-Based Routing**: The chip area is typically divided into routing channels or grids. The detailed router works within these channels, assigning each wire to a specific track and layer.
    *   **Design Rule Adherence**: The router meticulously checks and ensures that every wire and via placement adheres to all [[Design Rule Check (DRC)|DRC]] rules (e.g., minimum width, spacing, via enclosure, antenna rules).
    *   **Timing Optimization**: For critical nets, the detailed router continues to optimize for timing by selecting optimal wire widths, spacing, and via structures to minimize RC delays.
    *   **Signal Integrity (SI) Management**: It actively manages [[Crosstalk]] by ensuring sufficient spacing between sensitive nets or by inserting shielding wires. It also addresses [[Antenna Effect]] issues.
    *   **Via Optimization**: Minimizes the number of vias where possible to reduce resistance and improve yield, or adds redundant vias for reliability.
    *   **Metal Fill**: Inserts non-functional metal shapes in sparse areas to meet [[Density Checks]] requirements for Chemical Mechanical Planarization (CMP).

*   **Outputs**: The output of detailed routing is a complete, DRC-clean physical layout of all interconnects, typically in [[DEF|DEF]] format (for further physical verification) and ultimately in [[GDSII or OASIS]] format (for manufacturing).

*   **Key Considerations and Challenges**: 
    *   **DRC Closure**: Achieving a 100% DRC-clean layout is paramount. Any remaining violations will lead to manufacturing defects.
    *   **Timing Closure**: Ensuring that all timing paths meet their requirements after detailed routing, as actual parasitic delays are now known.
    *   **Routability**: While global routing plans for routability, detailed routing must successfully connect all nets without creating unroutable situations.
    *   **Computational Complexity**: Detailed routing is a highly complex and computationally intensive task, especially for large designs with many layers and tight design rules.
    *   **Yield**: The quality of detailed routing directly impacts the manufacturing yield of the chip.

*   **Tools**: Specialized EDA tools are used for detailed routing, often integrated within larger physical design suites (e.g., Cadence Innovus, Synopsys IC Compiler II).

## Further Reading

*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387366423)
*   [Detailed Routing in VLSI](https://www.vlsi-expert.com/2018/01/detailed-routing-in-vlsi.html)