---
title: Power Rails
description: Power Rails in VLSI Power Delivery Network
date: 2025-07-24
tags:
  - VLSI
  - Power Delivery Network
  - Power Integrity
aliases:
  - Power Rails
---

# Power Rails in VLSI Power Delivery Network

## Simple Explanation (Gist)
Power rails are the lowest level of the [[Power Grid]] in VLSI, consisting of metal lines that run horizontally within the standard cell rows, providing direct power (Vdd) and ground (Vss) connections to the individual transistors and gates.

## Detailed Breakdown

*   **Motivation**: While [[Power Mesh]] and [[Power Rings]] handle global and intermediate power distribution, power rails are essential for delivering stable and clean power directly to the millions of standard cells that make up the logic. They ensure that each cell receives the required voltage with minimal IR drop and noise.

*   **Concept**: Power rails are typically implemented on the lowest metal layers (e.g., Metal1, Metal2) and run parallel to the standard cell rows. Each standard cell is designed to connect directly to these adjacent Vdd and Vss rails. This localized power distribution minimizes the distance current has to travel from the power source to the active devices.

*   **Key Characteristics**: 
    *   **Localized Distribution**: Provide power and ground directly to the standard cells within a row.
    *   **Fixed Pitch**: The spacing and width of power rails are often standardized within a technology library to ensure compatibility with standard cells.
    *   **Connection to Higher Layers**: Power rails are connected to the higher-level [[Power Mesh]] and [[Power Rings]] through vias, forming a complete hierarchical power delivery network.

    ```mermaid
    graph TD
        A[Power Mesh] --> B[Vias];
        B --> C[Power Rails (Vdd and Vss)];
        C --> D[Standard Cell 1];
        C --> E[Standard Cell 2];
        C --> F[Standard Cell N];
    ```

*   **Role in the Power Delivery Network (PDN)**: 
    *   Power rails are the final stage of the PDN, ensuring that the voltage supplied to the active devices is as close as possible to the nominal supply voltage.
    *   They are crucial for managing local [[IR Drop]] and ensuring that individual cells operate within their specified voltage ranges.

*   **Design Considerations**: 
    *   **Width and Spacing**: The width of power rails is determined by the current density requirements of the cells they supply and the acceptable IR drop. Spacing is dictated by design rules and cell height.
    *   **Via Connections**: Sufficient and robust via connections to the higher-level power grid are essential to minimize resistance and ensure current flow.
    *   **Electromigration**: Power rails must be designed to withstand the current densities without suffering from [[Electromigration]] over the chip's lifetime.
    *   **Decoupling Capacitors**: Local [[Decaps|decoupling capacitors]] are often placed along the power rails to provide instantaneous current and suppress noise.

## Further Reading

*   [Power Integrity Analysis and Management for Integrated Circuits](https://www.amazon.com/Power-Integrity-Analysis-Management-Integrated/dp/0132398202)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Power Grid Design in VLSI](https://www.vlsi-expert.com/2018/01/power-grid-design-in-vlsi.html)