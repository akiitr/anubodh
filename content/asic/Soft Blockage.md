---
title: Soft Blockage
description: Explanation of Soft Blockage in ASIC Physical Design.
date: 2025-07-24
tags: [ASIC, Physical Design, Floorplanning]
aliases: [Soft Keepout]
---

# Soft Blockage

## Simple Explanation (Gist)
Soft blockage is a type of [[Placement Blockages|placement blockage]] used in ASIC physical design to discourage, but not entirely prevent, the placement of standard cells in a specific area. It guides the placement tool to keep an area clear if possible, but allows cells to be placed there if necessary to resolve congestion or timing issues.

## Detailed Breakdown

*   **Purpose**: Soft blockages are primarily used to:
    *   **Guide Placement**: Influence the placement tool to keep certain areas relatively clear, often for future routing channels, power grid structures, or to reduce congestion in specific regions.
    *   **Optimize Routing**: Create preferred routing corridors by making areas less attractive for cell placement.
    *   **Improve Timing**: In some cases, allowing cells to spill into a soft blockage area might be necessary to meet critical timing paths, making it a flexible constraint.

*   **Characteristics**:
    *   **Non-Strict**: Unlike [[Hard Blockage|hard blockages]], soft blockages do not absolutely forbid cell placement. The placement tool will try to avoid placing cells in a soft blockage area, but it will violate the blockage if it cannot find a legal placement elsewhere or if placing a cell there significantly improves design metrics (e.g., timing, routability).
    *   **Flexibility**: Provides more flexibility to the placement tool compared to hard blockages, allowing it to make trade-offs.
    *   **Area**: Defined as a rectangular or polygonal region on the layout.

*   **Common Use Cases**:
    *   **Routing Channels**: To reserve space for critical global or detailed routing tracks, especially for high-fanout nets or clock lines.
    *   **Power Grid Expansion**: To leave room for future power straps or rings if the initial power plan is not fully finalized.
    *   **Congestion Control**: To alleviate localized congestion by encouraging cells to spread out from a dense area.
    *   **Noise Isolation**: To create a buffer zone around sensitive analog blocks or IP to minimize digital noise interference.
    *   **Future ECO Space**: To reserve some empty space for potential future [[ECO|Engineering Change Orders]].

*   **Implementation**: Soft blockages are typically defined using commands in physical design tools (e.g., `create_placement_blockage -type soft` in Synopsys IC Compiler II or Cadence Innovus).

*   **Comparison with Other Blockages**:
    *   **[[Hard Blockage|Hard Blockage]]**: Absolutely prohibits any standard cell placement within the defined area. Used for fixed IP blocks, pre-placed macros, or areas reserved for specific physical structures.
    *   **[[Partial Blockage]]**: Allows only a certain percentage of cell density within the defined area. Offers a middle ground between hard and soft blockages.

*   **Impact on Design**: While flexible, excessive or poorly placed soft blockages can lead to:
    *   **Increased Area**: If the tool struggles to place cells outside the soft blockage, it might spread them out, increasing the overall chip area.
    *   **Increased Congestion**: If cells are forced into other areas, it might create new congestion hotspots.
    *   **Timing Degradation**: If cells are pushed further away from critical paths.

## Further Reading

*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387719257)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Closure/dp/0071462546)