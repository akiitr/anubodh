---
title: ESD Checks
description: Explanation of Electrostatic Discharge (ESD) checks in VLSI.
date: 2025-07-24
tags: [ASIC, Physical Verification, Reliability]
aliases: [ESD, Electrostatic Discharge]
---

# ESD Checks

## Simple Explanation (Gist)
ESD (Electrostatic Discharge) checks in VLSI ensure that the chip's input/output (I/O) pins and internal circuitry are protected from damage caused by sudden electrostatic discharges during manufacturing, handling, or normal operation.

## Detailed Breakdown

*   **Motivation**: Electrostatic discharge is the sudden flow of electricity between two electrically charged objects caused by contact, an electrical short, or dielectric breakdown. In the context of VLSI, ESD events can generate very high voltages and currents that can permanently damage sensitive transistor gates, junctions, or interconnects within the chip. ESD checks are crucial to ensure the long-term reliability and robustness of the IC.

*   **Sources of ESD**:
    *   **Human Body Model (HBM)**: Discharge from a charged human body.
    *   **Machine Model (MM)**: Discharge from a charged machine or tool.
    *   **Charged Device Model (CDM)**: Discharge from the device itself, which has become charged.

*   **ESD Protection Structures**: To mitigate ESD damage, specialized protection circuits are integrated at the I/O pads and sometimes within the core logic. These structures typically include:
    *   **Diodes**: Forward-biased diodes to shunt current to ground or power rails.
    *   **Transistors (e.g., SCRs, GG-MOS)**: Large transistors designed to turn on and provide a low-resistance path for ESD current.
    *   **Resistors**: Used to limit current or provide isolation.

*   **Types of ESD Checks**:
    1.  **Pad-to-Pad (P2P) Checks**: Verify that all I/O pads have proper ESD protection paths to each other and to the power/ground rails. This ensures that any discharge entering one pad can be safely shunted away without damaging other pads or internal circuitry.
    2.  **Core-to-Pad (C2P) Checks**: Ensure that the internal core circuitry is adequately protected from ESD events occurring at the I/O pads. This involves verifying the integrity of the protection paths from the pads to the core.
    3.  **Power-to-Power (P2P) Checks (for power rails)**: Verify that the power and ground distribution networks are robust enough to handle ESD events and that there are no isolated power domains that could be damaged.
    4.  **Well/Substrate Connection Checks**: Ensure that all wells and substrates are properly connected to their respective power or ground rails to provide a discharge path.
    5.  **Antenna Effect Checks**: While primarily a manufacturing issue, the [[Antenna Effect]] can also make a circuit more susceptible to ESD damage during fabrication. ESD checks often include verifying that antenna rules are met.

*   **ESD Design Rules**: Foundries provide specific ESD design rules that must be adhered to. These rules dictate the size, placement, and type of ESD protection devices, as well as the routing of power and ground connections for ESD paths.

*   **Verification Flow**: ESD checks are typically performed during the [[Physical Verification]] stage using dedicated EDA tools. These tools analyze the layout and netlist to identify potential ESD vulnerabilities and report violations. The process often involves:
    *   **Layout Extraction**: Extracting the physical connectivity from the layout.
    *   **Rule Deck Application**: Applying the foundry's ESD rule deck.
    *   **Path Tracing**: Tracing current paths to ensure proper shunting.
    *   **Reporting**: Generating reports of any violations that need to be fixed by the design team.

## Further Reading

*   [Electrostatic Discharge on Wikipedia](https://en.wikipedia.org/wiki/Electrostatic_discharge)
*   [ESD Protection Design for Integrated Circuits](https://www.amazon.com/Protection-Design-Integrated-Circuits-Technology/dp/0470095467)
*   [VLSI ESD Protection Design](https://www.synopsys.com/glossary/what-is-esd-protection.html)