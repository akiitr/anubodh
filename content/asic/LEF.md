---
title: LEF (Library Exchange Format)
description: Explanation of LEF (Library Exchange Format) in VLSI physical design.
date: 2025-07-24
tags: [ASIC, Physical Design, File Formats]
aliases: [LEF, Library Exchange Format]
---

# LEF (Library Exchange Format)

## Simple Explanation (Gist)
LEF (Library Exchange Format) is an ASCII format file used in VLSI physical design to describe the abstract physical characteristics of standard cells, macros, and other library elements, including their pin locations, dimensions, and routing layers, without revealing their internal transistor-level details.

## Detailed Breakdown

*   **Motivation**: During the [[Physical Design]] flow, tools like [[Floorplanning & Power Planning|floorplanners]], [[Placement|placers]], and [[Routing|routers]] need information about the physical properties of the cells and macros they are manipulating. However, they don't need (and often shouldn't have) access to the detailed transistor-level layout (which is typically in [[GDSII or OASIS|GDSII]]). LEF provides this necessary abstract physical information.

*   **Concept**: LEF acts as an interface between the cell library provider (e.g., foundry, IP vendor) and the physical design tools. It contains enough information for the tools to correctly place and route connections to the cells, while protecting the proprietary internal design of the cells.

*   **Key Information Contained in a LEF File**:
    1.  **Layer Definitions**: Describes the physical properties of each metal and via layer, including:
        *   Layer names (e.g., `METAL1`, `VIA12`).
        *   Direction (horizontal or vertical for routing).
        *   Minimum width, spacing rules.
        *   Resistance and capacitance per unit length/area (for parasitic extraction).
    2.  **Via Definitions**: Describes the physical dimensions and connectivity of vias (connections between different metal layers).
    3.  **Macro/Cell Definitions**: For each standard cell or macro, it defines:
        *   **Dimensions**: The overall width and height of the cell/macro.
        *   **Origin**: The reference point for placement.
        *   **Site**: Information about the standard cell row (e.g., height, pitch).
        *   **Pins**: For each pin:
            *   Name (e.g., `A`, `B`, `Z`).
            *   Direction (input, output, inout, power, ground).
            *   Location (coordinates within the cell boundary).
            *   Layer on which the pin is accessible.
            *   Port geometry (shape and size of the pin).
        *   **Obstructions (Obs)**: Areas within the cell that are blocked for routing on specific layers. This prevents routers from placing wires over sensitive internal cell structures.
        *   **Antenna Information**: Rules related to the [[Antenna Effect]].
        *   **Symmetry**: Information about cell symmetry for optimal placement.

*   **Relationship with Other File Formats**:
    *   **[[DEF|DEF (Design Exchange Format)]]**: LEF provides the library definitions, while DEF uses these definitions to describe the actual placement and routing of instances of these cells in a specific design.
    *   **[[Timing Library|Liberty (.lib/.db)]]**: LEF provides physical information, while Liberty files provide timing and power characteristics of the cells.
    *   **[[GDSII or OASIS|GDSII]]**: The final, detailed physical layout database. LEF is an abstract representation derived from the GDSII of the cells.

*   **Role in the Design Flow**:
    *   **[[Floorplanning & Power Planning|Floorplanning]]**: Tools use LEF to understand macro dimensions and pin locations for optimal placement.
    *   **[[Placement]]**: Placers use LEF to determine cell sizes, pin access, and blockage information for efficient and legal placement.
    *   **[[Routing]]**: Routers use LEF to understand layer properties, via definitions, and pin locations to connect cells correctly.
    *   **[[Physical Verification]]**: LEF information is used during DRC and LVS checks to ensure consistency with the library definitions.

## Further Reading

*   [LEF/DEF on Wikipedia](https://en.wikipedia.org/wiki/LEF/DEF)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [LEF File Format Explained](https://www.vlsi-expert.com/2018/01/lef-file-format-explained.html)