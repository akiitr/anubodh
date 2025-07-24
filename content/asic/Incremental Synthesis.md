---
title: Incremental Synthesis
description: Incremental Synthesis in VLSI ASIC Design
date: 2025-07-24
tags:
  - VLSI
  - Synthesis
  - Design Flow
aliases:
  - Incremental Synthesis
---

# Incremental Synthesis in VLSI ASIC Design

## Simple Explanation (Gist)
Incremental synthesis is a technique used in VLSI design to re-synthesize only the modified parts of a design, rather than the entire design, significantly reducing synthesis time during design iterations.

## Detailed Breakdown

*   **Motivation**: In complex ASIC designs, even small changes to the RTL (Register Transfer Level) code can trigger a full re-synthesis of the entire design, which can take hours or even days. This significantly slows down the design iteration cycle. Incremental synthesis addresses this by intelligently identifying and re-processing only the affected logic.

*   **How it Works**: 
    1.  **Reference Design**: A fully synthesized design (netlist) is used as a reference.
    2.  **Change Identification**: When changes are made to the RTL, the synthesis tool compares the modified RTL with the reference design to identify the specific logic cones or modules that have been altered.
    3.  **Localized Re-synthesis**: Instead of re-synthesizing the entire design, the tool re-synthesizes only the identified changed portions. The unchanged parts of the design are preserved.
    4.  **Integration**: The newly synthesized logic is then integrated back into the existing netlist, ensuring connectivity and resolving any interface issues.

*   **Advantages**: 
    *   **Reduced Synthesis Time**: The most significant benefit is the drastic reduction in synthesis runtime, enabling faster design iterations and bug fixes.
    *   **Faster ECOs**: It is particularly useful for implementing [[ECO|Engineering Change Orders (ECOs)]] late in the design cycle, as it allows for quick modifications without disrupting the entire flow.
    *   **Preservation of Physical Layout**: By minimizing changes to the netlist, incremental synthesis helps preserve the physical layout, reducing the need for extensive re-placement and re-routing in subsequent physical design stages.

*   **Challenges**: 
    *   **Tool Support**: Effective incremental synthesis relies heavily on sophisticated EDA tools that can accurately identify changes and efficiently integrate new logic.
    *   **Quality of Results (QoR)**: While fast, incremental synthesis might sometimes lead to slightly sub-optimal QoR (timing, area, power) compared to a full re-synthesis, especially if the changes are extensive or impact critical paths.
    *   **Boundary Management**: Managing the boundaries between modified and unmodified logic, and ensuring proper timing closure across these boundaries, can be complex.
    *   **Flow Integration**: Requires careful integration into the overall design flow to ensure consistency and avoid unintended side effects.

*   **Use Cases**: Incremental synthesis is commonly used during:
    *   RTL bug fixes.
    *   Minor feature additions.
    *   Timing closure iterations.
    *   Post-synthesis ECOs.

## Further Reading

*   [Advanced ASIC Chip Synthesis: Using Synopsys® Design Compiler™ and PrimeTime®](https://www.amazon.com/Advanced-ASIC-Chip-Synthesis-Compiler/dp/0387257027)
*   [VLSI Design and Test](https://www.amazon.com/VLSI-Design-Test-S-K-Kataria/dp/818527403X)