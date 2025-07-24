---
title: Power Grid
description: Power Grid in VLSI Power Delivery Network
date: 2025-07-24
tags:
  - VLSI
  - Power Delivery Network
  - Power Integrity
aliases:
  - Power Grid
  - Power Grid Synthesis
  - PGS
---

# Power Grid in VLSI Power Delivery Network

## Simple Explanation (Gist)
A power grid in VLSI is a dense, multi-layered mesh of metal interconnects (wires) that distributes power (Vdd) and ground (Vss) across the entire chip, ensuring stable and reliable voltage supply to all active circuits.

## Detailed Breakdown

*   **Motivation**: As chip designs become more complex and operate at higher frequencies with lower supply voltages, delivering stable power to millions or billions of transistors becomes a significant challenge. A robust power grid is essential to minimize [[IR Drop]] (voltage drop), reduce noise, and prevent electromigration issues.

*   **Concept**: The power grid is typically designed as a hierarchical network, starting from the package pins and extending down to the individual standard cells. It consists of horizontal and vertical metal lines (straps) on multiple metal layers, forming a grid-like structure. Vias connect these straps between different layers.

*   **Components of a Power Grid**: 
    1.  **[[Power Rings]]**: Thick metal rings typically placed around the periphery of the core logic and around large [[Macro Placement|macros]] (e.g., memories, IP blocks). They serve as the primary distribution backbone.
    2.  **[[Power Straps]]**: Horizontal and vertical metal lines that extend from the power rings into the core logic area, forming the grid. These are typically on higher metal layers (e.g., M6, M7, M8) for lower resistance.
    3.  **[[Power Rails]]**: The lowest level of power distribution, typically running horizontally within the standard cell rows on lower metal layers (e.g., M1, M2). Standard cells connect directly to these rails.
    4.  **Vias**: Vertical connections between different metal layers, allowing power and ground to be distributed throughout the 3D structure of the chip.
    5.  **[[Decaps|Decoupling Capacitors (Decaps)]]**: Integrated into the power grid to provide local charge reservoirs, mitigating instantaneous voltage drops (dynamic IR drop) caused by sudden current demands from switching logic.

    ```mermaid
    graph TD
        A[Package Pins] --> B[Power Rings];
        B --> C[Power Straps (Higher Metal Layers)];
        C --> D[Power Rails (Lower Metal Layers)];
        D --> E[Standard Cells / Logic];
        C -- Vias --> D;
        B -- Vias --> C;
    ```

*   **Design Objectives**: 
    *   **Minimize IR Drop**: Ensure that the voltage drop across the power grid is within acceptable limits, preventing functional failures and performance degradation.
    *   **Reduce Noise**: Provide a low-impedance path for power and ground, minimizing ground bounce and power supply noise.
    *   **Prevent [[Electromigration]]**: Design the metal lines with sufficient width and current density limits to prevent electromigration, which can lead to open circuits over time.
    *   **Ensure Manufacturability**: Adhere to design rules and ensure the grid is robust for fabrication.

*   **Power Grid Synthesis (PGS)**: The process of designing and implementing the power grid. This is typically done during the [[Floorplanning & Power Planning]] stage and involves specialized EDA tools.

*   **Analysis**: After the power grid is designed, [[IR Drop Analysis]] (static and dynamic) and [[Electromigration]] analysis are performed to verify its integrity.

## Further Reading

*   [Power Integrity Analysis and Management for Integrated Circuits](https://www.amazon.com/Power-Integrity-Analysis-Management-Integrated/dp/0132398202)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Power Grid Design in VLSI](https://www.vlsi-expert.com/2018/01/power-grid-design-in-vlsi.html)