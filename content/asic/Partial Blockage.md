---
title: Partial Blockage
description: Explanation of Partial Blockage in VLSI physical design.
date: 2025-07-24
tags: [ASIC, Physical Design, Placement]
aliases: [Partial Blockage]
---

# Partial Blockage

## Simple Explanation (Gist)
A partial blockage is a defined area in VLSI physical design where standard cells are allowed to be placed, but with a reduced density or specific restrictions, typically to manage local congestion or provide space for future routing.

## Detailed Breakdown

*   **Concept**: In [[Physical Design]], especially during the [[Floorplanning & Power Planning|floorplanning]] and [[Placement]] stages, designers need fine-grained control over cell placement. While [[Hard Blockage|hard blockages]] completely prohibit cell placement and [[Soft Blockage|soft blockages]] discourage it, partial blockages allow for a controlled reduction in cell density within a specified region.

*   **Purpose and Use Cases**:
    1.  **Congestion Management**: The primary use of partial blockages is to alleviate localized routing congestion. By reducing the number of standard cells in a particular area, more routing resources become available, making it easier for the router to complete connections.
    2.  **Future Routing Space**: To reserve some space for anticipated complex routing, such as for critical signals, clock nets, or power/ground straps, without completely preventing cell placement.
    3.  **Power Grid Integration**: To ensure sufficient space for the [[Power Grid|power grid]] or power straps to pass through dense areas without causing placement conflicts.
    4.  **ECO Space**: To provide some flexibility for future [[ECO|ECOs]] by ensuring there's a bit of breathing room for potential cell insertions or re-routing.
    5.  **Thermal Management**: In some cases, to slightly reduce cell density in areas prone to high heat generation.

*   **Characteristics**:
    *   **Density Control**: Partial blockages are defined with a specific density percentage (e.g., 50%, 70%). This means that only that percentage of the area within the blockage can be occupied by standard cells.
    *   **Placement Allowed**: Unlike hard blockages, cells *can* be placed within a partial blockage, but their total area within that region is limited.
    *   **User-Defined**: Defined by the designer using commands in physical design tools, specifying their coordinates, dimensions, and density percentage.

*   **Implementation**: Partial blockages are typically defined as rectangular or polygonal regions in the design database with an associated density value. Physical design tools (like Cadence Innovus, Synopsys ICC2) respect these blockages during their placement algorithms, distributing cells to meet the specified density.

*   **Trade-offs**: While useful for managing congestion, partial blockages:
    *   **Increase Area**: By reducing density in one area, cells might be pushed to other areas, potentially increasing the overall chip area.
    *   **Can Impact Timing**: Spreading out cells can increase wire lengths, which might negatively impact timing on some paths.
    *   **Complexity**: Requires careful planning to ensure the desired effect without creating new problems.

*   **Comparison with other Blockages**:
    *   **[[Hard Blockage|Hard Blockage]]**: No cells allowed.
    *   **[[Soft Blockage|Soft Blockage]]**: Discourages cell placement, but allows it if necessary (no strict density limit).
    *   **Partial Blockage**: Allows cell placement up to a specified density limit.

## Further Reading

*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387713424)
*   [Types of Blockages in Physical Design](https://www.vlsi-expert.com/2018/01/types-of-blockages-in-physical-design.html)