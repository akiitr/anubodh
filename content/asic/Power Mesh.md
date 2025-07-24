---
title: Power Mesh
description: Power Mesh in VLSI Power Delivery Network
date: 2025-07-24
tags:
  - VLSI
  - Power Delivery Network
  - Power Integrity
aliases:
  - Power Mesh
---

# Power Mesh in VLSI Power Delivery Network

## Simple Explanation (Gist)
A power mesh is a key component of the [[Power Grid]] in VLSI, consisting of a dense, orthogonal network of metal wires (straps) on multiple layers that distribute power (Vdd) and ground (Vss) uniformly across the chip's active area.

## Detailed Breakdown

*   **Motivation**: As chip designs become increasingly complex with higher transistor counts and faster switching speeds, ensuring a stable and low-impedance power supply across the entire die is critical. The power mesh is designed to minimize [[IR Drop]] (voltage drop) and reduce noise, which are crucial for reliable circuit operation.

*   **Concept**: The power mesh is typically formed by running horizontal and vertical metal straps on different metal layers, creating a grid-like structure. These straps are interconnected by vias, forming a robust, redundant network. This mesh structure provides multiple paths for current flow, reducing current density in any single wire and improving overall power delivery.

*   **Key Characteristics**: 
    *   **Orthogonal Structure**: Typically, power and ground straps run perpendicular to each other on adjacent metal layers (e.g., Vdd on horizontal M6, Vss on vertical M7, or vice-versa).
    *   **Multi-Layer Distribution**: The mesh extends across several metal layers, from higher, thicker layers (for global distribution) down to lower layers (for local distribution to standard cells).
    *   **Redundancy**: The grid provides redundant paths for current, making it more resilient to localized resistance variations or electromigration issues.
    *   **Low Resistance**: The use of wide metal straps and multiple layers helps to achieve a low-resistance power delivery network.

*   **Role in the Power Delivery Network (PDN)**: 
    *   The power mesh is usually connected to the [[Power Rings]] (which are typically around the periphery of the core or macros) and then extends inwards to cover the entire active area of the chip.
    *   Individual standard cells connect to the lowest level of the power distribution, often through [[Power Rails]] that run within the cell rows, which in turn are connected to the power mesh.

    ```mermaid
    graph TD
        A[Power Rings] --> B[Power Mesh (Higher Metal Layers)];
        B --> C[Power Rails (Lower Metal Layers)];
        C --> D[Standard Cells / Logic];
        B -- Vias --> C;
    ```

*   **Design Considerations**: 
    *   **Strap Width and Spacing**: Determined by current density requirements, IR drop targets, and design rules.
    *   **Via Density**: Sufficient vias are needed to ensure good connectivity between layers and minimize resistance.
    *   **Metal Layer Selection**: Higher metal layers are generally preferred for the main mesh due to their lower resistance and larger pitch.
    *   **IR Drop Analysis**: After the power mesh is designed, [[IR Drop Analysis]] (both static and dynamic) is performed to verify that voltage drops are within acceptable limits.
    *   **[[Electromigration]] Analysis**: Checks are performed to ensure that current densities in the metal straps do not exceed limits, preventing long-term reliability issues.

## Further Reading

*   [Power Integrity Analysis and Management for Integrated Circuits](https://www.amazon.com/Power-Integrity-Analysis-Management-Integrated/dp/0132398202)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Power Grid Design in VLSI](https://www.vlsi-expert.com/2018/01/power-grid-design-in-vlsi.html)