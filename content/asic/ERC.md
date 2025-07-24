---
title: Electrical Rule Check (ERC)
description: A crucial automated verification process in circuit design that ensures electrical connections and characteristics adhere to predefined rules.
date: 2025-07-24
tags: ["VLSI", "Physical Verification", "Electrical Check", "ASIC"]
---

# Electrical Rule Check (ERC)

## 1. Simple Explanation (Gist)

[[ERC|Electrical Rule Check (ERC)]] is a crucial automated [[Verification|verification]] process in [[Circuit Design|circuit design]], especially in [[VLSI Design|VLSI]] and [[PCB|PCB design]], that ensures the electrical connections and characteristics of a circuit adhere to predefined rules and specifications, preventing functional and reliability issues.

## 2. Detailed Breakdown

### Purpose and Definition

[[ERC|ERC]] is a methodology used to check the robustness of a design against various electronic [[Design Rules|design rules]] at both schematic and [[Layout]] levels. It verifies the electrical behavior of the design, unlike [[DRC|Design Rule Check (DRC)]] which focuses on physical [[Layout]] constraints. The primary goal is to identify and rectify potential electrical issues early in the development cycle, before manufacturing.

### Key Aspects Checked

[[ERC|ERC]] tools analyze the circuit's electrical characteristics and connectivity. This includes:

*   **Connectivity Analysis:** Ensuring proper connections between components and identifying missing connections or unintended shorts.
*   **Voltage and Current Verification:** Checking for acceptable voltage levels and current capacities to prevent issues like [[Electromigration|metal migration]] due to excessive current.
*   **[[Signal Integrity|Signal Integrity Checks]]:** Verifying parameters like impedance and [[Timing|timing]] to ensure signals remain strong and data is transmitted reliably.
*   **[[Power Delivery Network (PDN)|Power Distribution Network (PDN)]] Integrity:** Testing power and ground connections to ensure stable [[Power Delivery Network (PDN)|PDNs]], preventing [[IR Drop|voltage drops]] and [[Noise|noise]].

### Common Violations Detected

[[ERC|ERC]] helps in spotting and fixing common electrical design errors, such as:

*   **Short Circuits:** Unintended connections between nodes that should be separate.
*   **Open Circuits:** Missing connections where signals are supposed to flow.
*   **Floating Nodes/Gates:** Unconnected pins or parts of the circuit that are not properly tied to a defined electrical potential.
*   **Incorrect Pin Assignments:** Errors in how components are connected.
*   **Power and Ground Issues:** Inadequate or incorrect connections to power or ground networks.
*   **Wrong [[Transistor|Transistor]] Connections:** Such as source and drain connected together.

### Importance and Benefits

Implementing [[ERC|ERC]] offers significant advantages:

*   **Early Error Detection:** Catches electrical errors during the design phase, which is significantly cheaper and faster to fix than post-fabrication.
*   **[[Cost Target|Cost]] Savings:** Minimizes the risk of manufacturing faulty chips and avoids costly re-spins.
*   **Improved Reliability and Functionality:** Ensures the design is electrically sound, enhancing the reliability and performance of the final product.
*   **Enhanced Design Efficiency:** Automates checks, allowing designers to focus on optimization and creativity.
*   **Compliance with Standards:** Helps ensure designs adhere to industry standards and regulations.

### Distinction from Other Checks

*   **[[DRC|DRC (Design Rule Check)]]:** Focuses on physical [[Layout]] constraints (e.g., minimum width, spacing, enclosure) to ensure manufacturability.
*   **[[LVS|LVS (Layout Versus Schematic)]]:** Verifies the consistency between an [[Integrated Circuits|integrated circuit's]] physical [[Layout]] and its logical schematic, ensuring the [[Layout]] accurately reflects the intended circuit connectivity. [[ERC|ERC]], on the other hand, specifically addresses electrical errors and reliability aspects that [[LVS|LVS]] might not catch if the [[Netlist|netlist]] itself has an electrical issue.

## 3. Conclusion

[[ERC|Electrical Rule Check (ERC)]] is an indispensable step in modern [[Circuit Design|circuit design]], acting as an automated guardian of electrical integrity. By systematically checking for adherence to electrical rules, [[ERC|ERC]] proactively identifies and mitigates critical issues like shorts, opens, and power anomalies. This early detection capability not only streamlines the design process and reduces development costs but also significantly enhances the reliability and functionality of the final electronic product.

## Further Reading

*   **VLSI Physical Design: From Graph Partitioning to Timing Closure** by Andrew B. Kahng, Jens Lienig, Igor L. Markov, and Jin Hu
*   **CMOS VLSI Design: A Circuits and Systems Perspective** by Neil Weste & David Harris
*   [VLSI Web - Electrical Rule Check (ERC)](https://vlsiweb.com/electrical-rule-check-erc/)
*   [Cadence - Electrical Rule Check (ERC)](https://www.cadence.com/en_US/home/tools/digital-design-and-signoff/verification/electrical-rule-check.html)
*   [ChipEdge - What is ERC?](https://chipedge.com/what-is-erc/)