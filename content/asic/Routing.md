---
title: Routing
description: Explanation of Routing in ASIC Physical Design.
date: 2025-07-24
tags: [ASIC, Physical Design, Routing]
aliases: [Route, Detailed Routing, Global Routing]
---

# Routing

## Simple Explanation (Gist)
Routing is the physical design step where all the connections (nets) between different components (standard cells, macros) on an ASIC are made by drawing metal wires on various layers, adhering to design rules and optimizing for timing, power, and area.

## Detailed Breakdown

*   **Purpose**: To connect all the pins of the placed standard cells and macros according to the netlist, ensuring electrical connectivity and meeting performance, power, and area targets.

*   **Input**: The primary inputs to the routing stage are the placed design (from the [[Placement]] stage), the [[Gate-Level Netlist]], [[SDC|timing constraints]], and the [[Technology File]] (which defines metal layers, design rules, etc.).

*   **Output**: A fully routed GDSII database (or DEF file) that includes all the metal interconnects, vias, and associated physical information.

*   **Phases of Routing**:
    1.  **[[Global Routing]]**:
        *   **Concept**: In this initial phase, the router determines the general path for each net, dividing the chip into a coarse grid of routing regions. It assigns nets to specific regions without specifying exact tracks or layers.
        *   **Goal**: To minimize total wire length, balance congestion across the chip, and provide a high-level routing plan that is routable.
        *   **Output**: A global routing plan that indicates which routing channels each net will pass through.

    2.  **[[Detailed Routing]]**:
        *   **Concept**: This phase takes the global routing plan and converts it into exact geometric shapes (metal traces and vias) on specific layers. It places each wire on a specific track and layer, ensuring all [[Design Rule Check (DRC)|DRC]] rules are met.
        *   **Goal**: To complete all connections, resolve all design rule violations (DRVs), and optimize for timing, signal integrity, and manufacturing yield.
        *   **Output**: A complete, DRC-clean physical layout of all interconnects.

*   **Key Considerations and Optimizations**:
    *   **[[Design Rule Check (DRC)|Design Rules]]**: Strict adherence to rules like minimum width, spacing, via enclosure, and antenna rules is critical to ensure manufacturability.
    *   **[[Timing-Driven Routing]]**: Routers prioritize critical timing paths to ensure setup and hold requirements are met. This involves minimizing resistance-capacitance (RC) delays on critical nets.
    *   **[[Signal Integrity]] (SI)**:
        *   **[[Crosstalk in VLSI|Crosstalk]]**: Minimizing coupling between adjacent wires to prevent signal integrity issues.
        *   **[[Antenna Effect in VLSI|Antenna Effect]]**: Preventing charge build-up on long metal lines during fabrication.
    *   **Power Routing**: Ensuring robust power and ground connections (power rails, power mesh) to minimize [[IR Drop]] and [[Electromigration]].
    *   **Congestion**: Avoiding areas where too many wires are trying to pass through a limited space, which can lead to unroutability or increased area.
    *   **Manufacturing Yield**: Optimizing for factors like [[Metal Fill]] and via density to improve manufacturing yield.

*   **Tools**: Specialized EDA tools are used for routing, often integrated within larger physical design suites (e.g., Cadence Innovus, Synopsys IC Compiler II).

## Further Reading

*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387719257)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Closure/dp/0071462546)