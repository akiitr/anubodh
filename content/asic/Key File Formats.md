---
title: Key File Formats
description: Key File Formats in VLSI ASIC Design
date: 2025-07-24
tags:
  - VLSI
  - File Formats
  - Design Flow
aliases:
  - Key File Formats
---

# Key File Formats in VLSI ASIC Design

## Simple Explanation (Gist)
Key file formats in VLSI ASIC design are standardized data structures used to represent and exchange design information between different Electronic Design Automation (EDA) tools and across various stages of the chip design and manufacturing flow.

## Detailed Breakdown

*   **Purpose**: Due to the complexity of modern IC design and the diverse set of EDA tools used, standardized file formats are essential for ensuring interoperability, data integrity, and efficient data exchange throughout the design process.

*   **Common File Formats**: 
    *   **[[Verilog]] / [[SystemVerilog]] / [[VHDL]] (`.v`, `.sv`, `.vhd`)**: These are [[HDL|Hardware Description Language]] files used to describe the design's functionality and structure at the [[RTL Design|Register Transfer Level]] or [[Gate-Level Netlist|gate level]].
    *   **[[SDC|Synopsys Design Constraints (SDC)]] (`.sdc`)**: Specifies timing, power, and area constraints for the design, guiding synthesis and physical design tools to meet performance targets.
    *   **Liberty [[Timing Library]] (`.lib`, `.db`)**: Contains characterization data for standard cells and IP blocks, including timing (delays, setup/hold times), power (leakage, dynamic), and noise information. `.db` is a compiled binary version of `.lib`.
    *   **[[LEF|Library Exchange Format (LEF)]] (`.lef`)**: Provides an abstract physical view of standard cells and macros, including pin locations, dimensions, and routing blockages, without revealing internal transistor-level details.
    *   **[[DEF|Design Exchange Format (DEF)]] (`.def`)**: Describes the physical layout of the design, including component placement, pin locations, and routing information. It represents the netlist's physical implementation.
    *   **[[SPEF|Standard Parasitic Exchange Format (SPEF)]] (`.spef`)**: Contains extracted parasitic resistance (R) and capacitance (C) values for interconnects, crucial for accurate timing and power analysis after physical layout.
    *   **[[GDSII or OASIS]] (`.gds`, `.gdsii`, `.oas`)**: The final layout database format used for manufacturing. It contains all the geometric information (shapes, layers) required to fabricate the chip.
    *   **[[UPF|Unified Power Format (UPF)]] / [[CPF|Common Power Format (CPF)]] (`.upf`, `.cpf`)**: Specifies the low-power design intent, including power domains, voltage levels, power gating strategies, and retention requirements.
    *   **Technology File (`.tf`)**: Contains foundry-specific process information, such as design rules, layer definitions, and electrical parameters.
    *   **[[Activity Vectors]] / Value Change Dump (VCD) / SAIF (`.vcd`, `.saif`)**: Files containing switching activity information (which signals toggle and how often), used for accurate dynamic power analysis.

*   **Importance**: These file formats are the backbone of the VLSI design ecosystem, enabling seamless data flow and collaboration between different design teams and with foundries. Understanding these formats is crucial for anyone involved in ASIC design.

## Further Reading

*   [VLSI Design Flow: A Practical Approach](https://www.amazon.com/VLSI-Design-Flow-Practical-Approach/dp/1461405731)
*   [EDA Standards on Accellera](https://www.accellera.org/standards)
*   [OpenAccess Coalition](https://www.si2.org/openaccess/)