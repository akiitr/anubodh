---
title: UPF
description: Explanation of Unified Power Format (UPF) in ASIC design.
date: 2025-07-24
tags: [ASIC, Low Power, File Format]
aliases: [Unified Power Format, IEEE 1801]
---
---

# UPF (Unified Power Format)

## Simple Explanation (Gist)
UPF (Unified Power Format) is an industry-standard language used in ASIC design to specify and manage complex low-power design intent. It describes power domains, power-saving techniques (like [[Power Gating|power gating]] and [[Multi-voltage Design|multi-voltage design]]), and the behavior of power management cells, enabling automated power-aware design and verification flows.

## Detailed Breakdown

*   **Purpose**: As power consumption became a critical design constraint, especially for mobile and battery-powered devices, designers needed a standardized way to communicate power intent across different EDA tools and design stages. UPF (IEEE 1801 standard) addresses this by providing a textual format to describe:
    *   **Power Domains**: Regions of the chip that can operate at different voltages or be powered on/off independently.
    *   **Power Management Strategies**: How power-saving techniques are implemented.
    *   **Power Management Cells**: The behavior of special cells like [[Isolation Cells]], [[Level Shifters]], and [[Retention Cells]].

*   **Key Concepts in UPF**:
    1.  **Power Domains**: A logical grouping of design elements (e.g., modules, instances, nets) that share a common power supply and can be controlled together. Each power domain has a primary power supply and can have multiple power states (e.g., ON, OFF, RETENTION).
    2.  **Power Supplies**: Definition of voltage rails (e.g., VDD, VSS) and their characteristics.
    3.  **Power States**: Defines the different operational states of a power domain (e.g., active, sleep, deep sleep) and the voltage levels associated with each state.
    4.  **Power Switches**: Specifies the insertion and control of power gating cells (power switches) that turn power domains on or off.
    5.  **Isolation Cells**: Defines the insertion of isolation cells at the boundaries of power domains to prevent unknown (X) states from propagating from a powered-down domain to an active domain.
    6.  **[[Level Shifters]]**: Specifies the insertion of level shifters at the boundaries of power domains operating at different voltage levels to ensure correct signal integrity.
    7.  **[[Retention Cells]]**: Defines the insertion and control of retention cells to save and restore the state of sequential elements during power-down modes.
    8.  **Power Gating Sequencing**: Describes the sequence of events (e.g., power-down, power-up) for power-gated domains.

*   **Integration in Design Flow**: UPF is used throughout the ASIC design flow:
    *   **Architectural/RTL Design**: Power intent is captured early in the design cycle.
    *   **[[Synthesis]]**: Synthesis tools use UPF to insert power management cells (isolation, level shifters, retention) and optimize the design for power.
    *   **[[Physical Design]]**: Physical design tools use UPF to create power grids, place power switches, and ensure correct physical implementation of power domains.
    *   **[[Functional Verification]]**: Power-aware simulation and formal verification tools use UPF to verify the functional correctness of the design under various power states.
    *   **[[STA|Static Timing Analysis]]**: Power-aware STA tools use UPF to analyze timing under different voltage levels and power states.
    *   **[[Power Signoff]]**: Power analysis tools use UPF to perform accurate power estimation and power integrity checks.

*   **Benefits**:
    *   **Automation**: Enables automated insertion and verification of complex low-power features.
    *   **Reduced Errors**: Minimizes manual errors associated with implementing power management.
    *   **Improved Productivity**: Accelerates the design and verification of low-power chips.
    *   **Tool Interoperability**: Provides a standard format for communicating power intent across different EDA tools from various vendors.

*   **Alternatives**: CPF (Common Power Format) is another standard for power intent, primarily driven by Cadence. However, UPF (IEEE 1801) has gained wider industry adoption.

## Further Reading

*   [Low Power Design Techniques](https://www.synopsys.com/glossary/low-power-design.html)
*   [Unified Power Format (UPF) Tutorial](https://www.design-reuse.com/articles/20070/unified-power-format-upf-tutorial.html)