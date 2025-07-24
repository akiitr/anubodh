---
title: Global Routing
description: Global Routing in VLSI Physical Design
date: 2025-07-24
tags:
  - VLSI
  - Physical Design
  - Routing
aliases:
  - Global Routing
---

# Global Routing in VLSI Physical Design

## Simple Explanation (Gist)
Global routing is the initial phase of the routing stage in VLSI physical design, where the routing tool determines the approximate paths (channels or regions) for all interconnections (nets) across the chip, without specifying the exact metal layers or tracks.

## Detailed Breakdown

*   **Purpose**: The main goal of global routing is to find a coarse route for each net that minimizes total wire length, reduces routing congestion, and helps meet timing constraints. It acts as a high-level planning step before detailed routing.

*   **Inputs**: Global routing typically takes the following as inputs:
    *   The placed [[Gate-Level Netlist]] (after [[Placement]]).
    *   Technology information (number of metal layers, preferred routing directions).
    *   Timing constraints (from [[SDC|SDC]] or derived from [[STA|STA]] analysis).

*   **Process**: 
    1.  **Grid Partitioning**: The entire chip area is divided into a grid of global routing cells (GRCs) or bins.
    2.  **Net Decomposition**: Complex nets (multi-pin nets) are often decomposed into a series of two-pin connections (segments).
    3.  **Path Finding**: For each net, the global router finds a path through the GRCs, considering factors like wire length, congestion, and timing criticality. This path is not exact but indicates which routing channels or regions the net will traverse.
    4.  **Capacity Estimation**: The router estimates the routing resources (e.g., number of available tracks) within each GRC and tries to distribute the nets to avoid exceeding these capacities, thus preventing routing congestion.
    5.  **Timing-Driven Routing**: For critical nets, the global router may prioritize shorter paths or paths with fewer vias to minimize delay.

*   **Outputs**: The output of global routing is a global routing plan, which specifies:
    *   The sequence of GRCs that each net will pass through.
    *   The estimated wire length and number of vias for each net.
    *   A preliminary assessment of routing congestion across the chip.

*   **Importance**: 
    *   **Routability**: A good global routing solution is crucial for ensuring the design is routable in the subsequent [[Detailed Routing]] stage. If global routing indicates high congestion in certain areas, it might necessitate re-running [[Placement]] or even [[Floorplanning & Power Planning|floorplanning]].
    *   **Timing Closure**: By providing estimated wire lengths and routing paths, global routing helps in more accurate parasitic extraction and subsequent timing analysis, aiding in early timing closure.
    *   **Design Iterations**: It helps identify potential routing issues early in the physical design flow, reducing costly iterations later.

*   **Relationship with Detailed Routing**: Global routing provides the framework, and detailed routing then fills in the exact metal tracks and vias within the channels defined by global routing.

## Further Reading

*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Engineering/dp/0471721426)
*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387366423)