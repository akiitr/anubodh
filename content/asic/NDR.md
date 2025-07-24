---
title: NDR
description: Non-Default Rules (NDR) in VLSI Physical Design
date: 2025-07-24
tags:
  - VLSI
  - Physical Design
  - Routing
aliases:
  - NDR
  - Non-Default Rules
---

# Non-Default Rules (NDR) in VLSI Physical Design

## Simple Explanation (Gist)
Non-Default Rules (NDR) are special routing rules applied to specific critical nets in VLSI physical design, allowing them to deviate from standard routing rules to meet stringent timing, signal integrity, or reliability requirements.

## Detailed Breakdown

*   **Motivation**: While most nets in a design can be routed using standard design rules (e.g., minimum width, spacing), certain critical nets require special treatment to ensure the chip functions correctly and reliably. These critical nets often include:
    *   **Clock Nets**: To minimize [[Clock Skew]] and [[Clock Uncerainity |jitter]], and ensure robust clock signal propagation.
    *   **High-Speed Data Paths**: To meet stringent timing requirements and maintain [[Signal Integrity]].
    *   **Power/Ground Nets**: To handle high current densities and minimize [[IR Drop]].
    *   **Analog Signals**: To reduce noise coupling and maintain signal quality.

*   **Concept**: NDRs allow designers to specify custom routing parameters for these critical nets. These parameters can include:
    *   **Wider Wires**: Increasing wire width reduces resistance, which helps with IR drop and signal delay, and also improves [[Electromigration]] reliability.
    *   **Larger Spacing**: Increasing spacing between wires reduces [[Crosstalk]] and improves signal integrity.
    *   **Double Via/Redundant Via**: Adding extra vias to reduce resistance and improve reliability.
    *   **Specific Metal Layers**: Restricting routing to certain metal layers for better performance or noise isolation.
    *   **Shielding**: Adding ground or power lines adjacent to sensitive signals to reduce noise coupling.

*   **Implementation**: 
    *   **Specification**: NDRs are typically specified in the [[SDC|Synopsys Design Constraints (SDC)]] or a technology file, linking specific nets or net classes to the desired routing rules.
    *   **Physical Design Tools**: [[Routing]] tools (both [[Global Routing]] and [[Detailed Routing]]) must be able to recognize and apply these non-default rules during the routing process. They prioritize these rules for the specified nets.

*   **Advantages**: 
    *   **Improved Performance**: Helps meet timing targets for critical paths.
    *   **Enhanced Signal Integrity**: Reduces noise, crosstalk, and other signal degradation issues.
    *   **Increased Reliability**: Improves resistance to electromigration and other reliability concerns.
    *   **Better Power Delivery**: Ensures robust power and ground distribution.

*   **Challenges**: 
    *   **Area Overhead**: Wider wires and larger spacing consume more routing area, potentially leading to increased chip size or routing congestion.
    *   **Routing Complexity**: Applying NDRs adds complexity to the routing process, requiring more sophisticated algorithms and potentially longer runtimes.
    *   **Design Rule Compliance**: Ensuring that NDRs do not inadvertently create new [[DRC|Design Rule Check]] violations.
    *   **Verification**: Requires thorough verification to ensure that the NDRs are correctly applied and that they achieve the desired improvements without introducing new issues.

## Further Reading

*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Engineering/dp/0471721426)
*   [CMOS VLSI Design: A Circuits and Systems Perspective](https://www.amazon.com/CMOS-VLSI-Design-Circuits-Perspective/dp/0321547748)
*   [Non-Default Rules in Physical Design](https://www.vlsi-expert.com/2018/01/non-default-rules-in-physical-design.html)