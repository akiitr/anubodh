
---
title: Technology File
description: Explanation of Technology File in ASIC design.
date: 2025-07-24
tags: [ASIC, Foundry, Physical Design]
aliases: [Tech File]
---

# Technology File

## Simple Explanation (Gist)
A technology file is a crucial database provided by the semiconductor [[Foundry]] that contains all the physical and electrical rules, parameters, and characteristics of a specific manufacturing process. It defines how the chip layers are built and how components behave.

## Detailed Breakdown

*   **Purpose**: The technology file serves as the central repository of information about a particular semiconductor manufacturing process. It is used by all EDA tools throughout the ASIC design flow, from [[Synthesis]] to [[Physical Verification]], to ensure that the design adheres to the foundry's capabilities and rules.

*   **What it Contains**: A technology file is a complex database that includes a vast amount of information, typically covering:
    1.  **Layer Definitions**: Defines all the physical layers used in the manufacturing process (e.g., polysilicon, diffusion, metal layers, vias), their names, types, and properties.
    2.  **[[Design Rule Check (DRC)|Design Rules]]**: Specifies the geometric constraints for each layer and between layers. These rules dictate minimum widths, spacing, enclosure rules, via sizes, etc., to ensure manufacturability and yield.
    3.  **Electrical Parameters**: Contains electrical characteristics of materials, such as resistivity of metals, sheet resistance of diffusion layers, and capacitance per unit area/length for various layers.
    4.  **Device Models**: Includes parameters for transistors (e.g., threshold voltages, mobility) and other devices (resistors, capacitors) that are used in circuit simulation.
    5.  **Interconnect Parameters**: Provides information for parasitic extraction, such as resistance per unit length and capacitance per unit area/length for different metal layers, and coupling capacitance models.
    6.  **Process Information**: Details about the manufacturing process steps, such as lithography, etching, and deposition.
    7.  **Via Definitions**: Specifies the types of vias, their dimensions, and how they connect different metal layers.

*   **Format**: Technology files are typically proprietary formats specific to each EDA vendor (e.g., Synopsys, Cadence, Siemens EDA) but are derived from the foundry's process design kit (PDK).

*   **Role in the Design Flow**:
    *   **[[Synthesis]]**: While not directly used for logical synthesis, the technology file indirectly influences synthesis by defining the characteristics of the [[Standard Cell Library]] that synthesis tools use.
    *   **[[Physical Design]]**: Crucial for [[Floorplanning & Power Planning|floorplanning]], [[Placement]], and [[Routing]]. Physical design tools use the design rules to ensure that the layout is manufacturable.
    *   **[[STA|Static Timing Analysis]]**: The electrical parameters and interconnect models are used to accurately calculate signal delays and ensure timing closure.
    *   **[[Power Signoff|Power Analysis]]**: Electrical parameters are used for accurate power consumption and [[IR Drop]] analysis.
    *   **[[Physical Verification]]**: DRC tools use the design rules from the technology file to verify the layout against manufacturing constraints.

*   **Importance**: The technology file is the bridge between the design house and the foundry. It ensures that the design is implemented correctly according to the specific manufacturing process, leading to functional and high-yielding silicon.

## Further Reading

*   [CMOS VLSI Design: A Circuits and Systems Perspective](https://www.amazon.com/CMOS-VLSI-Design-Circuits-Perspective/dp/0321547748)
*   [The Essential Guide to Semiconductors](https://www.amazon.com/Essential-Guide-Semiconductors-Jim-Turley/dp/013046404X)
