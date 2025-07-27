---
title: LVS (Layout Versus Schematic)
description: Explanation of LVS (Layout Versus Schematic) in VLSI physical verification.
date: 2025-07-24
tags: [ASIC, Physical Verification]
aliases: [LVS, Layout Versus Schematic]
---

# LVS (Layout Versus Schematic)

## Simple Explanation (Gist)
LVS (Layout Versus Schematic) is a crucial [[Physical Verification|physical verification]] step in VLSI that formally checks if the physical layout of an integrated circuit (IC) exactly matches its corresponding schematic or netlist, ensuring that the fabricated chip will function as intended electrically.

## Detailed Breakdown

*   **Motivation**: After the physical layout of an IC is generated (from [[Placement]] and [[Routing]]), it's essential to verify that this layout accurately represents the intended circuit design. Manual layout is prone to errors, and even automated tools can introduce discrepancies. LVS provides a rigorous, exhaustive check to catch these errors before fabrication, which is extremely costly.

*   **Concept**: LVS tools take two primary inputs:
    1.  **Layout View**: Typically derived from the [[GDSII or OASIS|GDSII]] database, which contains the geometric shapes representing transistors, resistors, capacitors, and interconnects.
    2.  **Schematic/Netlist View**: The golden reference, usually a SPICE netlist or a gate-level netlist, which describes the intended connectivity and components of the circuit.

    The LVS tool then performs the following steps:
    1.  **Extraction**: It extracts a netlist from the physical layout. This involves identifying transistors (based on diffusion, poly, and well layers), their terminals (source, drain, gate), and the connections between them (interconnects).
    2.  **Comparison**: It compares the extracted layout netlist with the reference schematic/netlist. This comparison involves:
        *   **Component Matching**: Verifying that all transistors, resistors, capacitors, and other devices in the layout have a corresponding device in the schematic, and vice-versa.
        *   **Connectivity Matching**: Ensuring that the connections (nets) between these components are identical in both the layout and the schematic. This is the most critical part of LVS.
        *   **Parameter Matching**: Checking that the sizes (e.g., width and length of transistors) and types of components match between the two views.

*   **Common LVS Discrepancies (Errors)**:
    *   **Missing Devices**: A transistor or resistor present in the schematic but not in the layout, or vice-versa.
    *   **Extra Devices**: A device in the layout that is not in the schematic.
    *   **Shorts**: Two or more nets that should be separate are connected in the layout.
    *   **Opens**: A net that should be connected is broken or incomplete in the layout.
    *   **Parameter Mismatches**: A transistor with incorrect width/length, or a resistor/capacitor with an incorrect value compared to the schematic.
    *   **Pin Mismatches**: Incorrectly connected or missing pins on cells or blocks.

*   **Importance**: LVS is a mandatory signoff step before tape-out. A clean LVS report (no errors) provides high confidence that the physical layout is electrically correct and will behave as designed. Failing LVS means the chip will likely not function correctly, leading to costly re-spins.

*   **Tools**: Major EDA vendors provide LVS tools (e.g., Siemens Calibre LVS, Synopsys IC Validator LVS, Cadence Pegasus LVS).

*   **Integration in Design Flow**: LVS is typically performed after the final routing and metal fill stages of physical design, and often iteratively during the design process to catch errors early.

## Further Reading

*   [Layout Versus Schematic on Wikipedia](https://en.wikipedia.org/wiki/Layout_Versus_Schematic)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [What is LVS in VLSI?](https://www.vlsi-expert.com/2018/01/what-is-lvs-in-vlsi.html)