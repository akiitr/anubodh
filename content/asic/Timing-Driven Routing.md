---
title: Timing-Driven Routing
description: Explanation of Timing-Driven Routing in ASIC Physical Design.
date: 2025-07-24
tags: [ASIC, Physical Design, Routing, Timing]
aliases: [TDR]
---

# Timing-Driven Routing

## Simple Explanation (Gist)
Timing-driven routing is a specialized [[Routing]] technique in ASIC physical design that prioritizes meeting the timing requirements of critical paths. Instead of just connecting wires, it intelligently routes nets to minimize delays and ensure the chip operates at its target frequency.

## Detailed Breakdown

*   **Purpose**: In modern high-speed ASIC designs, interconnect delays (delays through wires) can contribute significantly, often more than cell delays, to the total path delay. Traditional routing might optimize for area or routability, but timing-driven routing explicitly considers and optimizes for timing performance. Its goal is to ensure that all critical paths meet their [[Setup|setup]] and [[Hold Time|hold]] time requirements.

*   **How it Works**: Timing-driven routers are integrated with [[STA|Static Timing Analysis]] engines. They operate by:
    1.  **Identifying Critical Paths**: The router receives information about the most critical timing paths from the STA engine. These are the paths with the smallest positive slack or negative slack (timing violations).
    2.  **Delay Minimization**: For critical nets, the router attempts to minimize their resistance-capacitance (RC) delays by:
        *   **Shortest Path**: Prioritizing shorter routes.
        *   **Wider Wires**: Using wider metal lines to reduce resistance.
        *   **Optimal Layer Usage**: Utilizing lower-resistance, lower-capacitance metal layers (typically upper layers) for critical nets.
        *   **Minimizing Vias**: Reducing the number of vias, as each via adds resistance and capacitance.
    3.  **Crosstalk Avoidance**: Actively avoiding or minimizing [[Crosstalk in VLSI|crosstalk]] on critical nets, as crosstalk can significantly impact timing (e.g., [[Crosstalk Delay]] or [[Noise|glitch]]).
    4.  **Shielding**: Inserting grounded or VDD shield lines around critical nets to reduce coupling capacitance and improve [[Signal Integrity]].
    5.  **Buffer Insertion**: Strategically inserting buffers or inverters along long critical nets to break them into smaller segments, reduce delay, and improve signal integrity.
    6.  **Detouring**: For non-critical paths, the router might intentionally detour nets or use less optimal layers to free up routing resources for critical paths.

*   **Inputs**: The key inputs to a timing-driven router include:
    *   The placed design (from the [[Placement]] stage).
    *   The [[Gate-Level Netlist]].
    *   [[SDC|Timing constraints]] (from the SDC file).
    *   [[Timing Library|Timing libraries]] for cells.
    *   [[Technology File]] (design rules, layer properties).
    *   Timing analysis reports (critical path information).

*   **Benefits**:
    *   **Improved Timing Closure**: Significantly increases the likelihood of meeting timing requirements, especially for high-frequency designs.
    *   **Reduced Iterations**: By considering timing during routing, it reduces the need for costly and time-consuming post-routing timing ECOs or re-spins.
    *   **Better Performance**: Helps achieve the maximum possible operating frequency for the chip.

*   **Challenges**:
    *   **Increased Runtime**: Timing-driven routing is computationally more intensive than pure routability-driven routing.
    *   **Potential for Congestion**: Aggressive timing optimization can sometimes lead to localized routing congestion if not managed carefully.
    *   **Area Overhead**: Wider wires or inserted buffers can increase the overall chip area.

*   **Tools**: All modern physical design tools (e.g., Cadence Innovus, Synopsys IC Compiler II) incorporate sophisticated timing-driven routing capabilities.

## Further Reading

*   [Physical Design Essentials: An ASIC Design Implementation Perspective](https://www.amazon.com/Physical-Design-Essentials-Implementation-Perspective/dp/0387719257)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Closure/dp/0071462546)