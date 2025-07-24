---
title: Fault Models in VLSI
description: An explanation of fault models in VLSI, covering their purpose, common types (stuck-at, bridging, delay), and fault assumptions.
date: 2025-07-24
tags: ["VLSI", "Test", "DFT", "Verification", "ASIC"]
---

# Fault Models in VLSI

## 1. Simple Explanation (Gist)

[[Fault Models|Fault models]] in [[VLSI Design|VLSI]] (Very Large Scale Integration) are simplified, abstract representations of physical defects that can occur in [[Integrated Circuits|integrated circuits]], used to predict how these defects will affect the circuit's behavior and to develop effective testing strategies.

## 2. Detailed Breakdown

### Why Fault Models are Needed

Physical defects in [[VLSI Design|VLSI]] [[Chip Design|chips]], such as shorts, opens, or manufacturing variations, are numerous and complex. It's impractical to test for every possible physical defect directly. [[Fault Models|Fault models]] abstract these physical defects into logical representations, significantly reducing the number of [[Fault Models|faults]] to consider and making test generation and fault [[Simulation|simulation]] feasible.

### Common Fault Models

*   **[[Stuck-at Faults|Stuck-at Fault Model]]:** This is the most fundamental and widely used [[Fault Models|fault model]]. It assumes that a signal line or [[Logic Gates|gate]] output is permanently "stuck" at a logic 0 ([[Stuck-at Faults|Stuck-at-0]] or SA0) or a logic 1 ([[Stuck-at Faults|Stuck-at-1]] or SA1), regardless of the circuit's inputs.
    *   **Example:** If a wire is [[Stuck-at Faults|stuck-at-0]], it will always carry a logic '0', even if the circuit tries to drive a '1' onto it.
    *   **Significance:** Its simplicity makes it easy to model and implement, allowing for efficient testing strategies.
*   **[[Bridging Faults|Bridging Fault Model]]:** This [[Fault Models|model]] represents a short circuit between two or more signal lines that should not be connected. These can occur due to manufacturing defects like metal debris.
    *   **Types:**
        *   **Wired-AND Bridging:** If two bridged nets have different values, the resulting value becomes a permanent logic 0 (like an AND operation).
        *   **Wired-OR Bridging:** If two bridged nets have the same value, the resulting value remains unchanged (like an OR operation).
    *   **Significance:** [[Bridging Faults|Bridging faults]] can create unexpected logic behavior and are often more challenging to detect than [[Stuck-at Faults|stuck-at faults]].
*   **[[Transition Faults|Delay Fault Model]]:** This [[Fault Models|model]] addresses defects that affect the [[Timing|timing]] performance of a circuit, causing signals to propagate slower or faster than intended. These [[Fault Models|faults]] may only manifest under specific operating conditions.
    *   **Types:**
        *   **[[Transition Faults|Transition Fault]]:** Assumes a large [[Delay|delay]] defect concentrated at one logical node, causing a signal [[Transition|transition]] (slow-to-rise or slow-to-fall) to be delayed past the [[Clock Period|clock period]].
        *   **[[Path Delay Fault|Path Delay Fault]]:** Considers the cumulative [[Delay|delay]] along an entire [[Timing Paths|path]] in the circuit. A circuit is faulty if the [[Delay|delay]] of any [[Timing Paths|path]] exceeds the specified [[Timing Threshold|timing threshold]].
    *   **Significance:** Crucial for high-speed [[Digital Systems|digital systems]] where [[Timing|timing]] is critical.
*   **[[Transistor|Transistor]] Stuck-On/Open [[Fault Models|Faults]]:** These [[Fault Models|models]] focus on [[Fault Models|faults]] within individual [[Transistor|transistors]], the basic building blocks of [[VLSI Design|VLSI]] circuits.
    *   **Stuck-On Fault:** A [[Transistor|transistor]] is permanently stuck in the conducting (on) state, regardless of its gate voltage.
    *   **Stuck-Open Fault:** A [[Transistor|transistor]] is permanently stuck in the non-conducting (off) state, acting like an open circuit.
    *   **Significance:** These [[Fault Models|faults]] directly affect the [[Transistor|transistor's]] ability to switch, impacting the circuit's logic behavior.

### Fault Assumptions

*   **Single Fault Assumption:** Assumes that only one [[Fault Models|fault]] occurs in a circuit at a time. This simplifies testing but may not cover all real-world scenarios.
*   **Multiple Fault Assumption:** Considers that multiple [[Fault Models|faults]] might occur simultaneously in a circuit.

### Fault Collapsing

Techniques like equivalence collapsing and dominance collapsing are used to reduce the total number of [[Fault Models|faults]] that need to be considered for testing, as some [[Fault Models|faults]] may produce the same faulty behavior or one [[Fault Models|fault's]] detection implies another's.

## 3. Conclusion

[[Fault Models|Fault models]] are essential tools in [[VLSI Design|VLSI]] design and testing. By providing abstract representations of physical defects, they enable engineers to systematically analyze potential failures, generate efficient test patterns, and ensure the reliability and functionality of complex [[Integrated Circuits|integrated circuits]].

## Further Reading

*   **Digital System Testing and Testable Design** by Miron Abramovici, Melvin A. Breuer, Arthur D. Friedman
*   **VLSI Test Principles and Architectures** by Laung-Terng Wang, Cheng-Wen Wu, & Xiaoqing Wen
*   [ChipEdge - Fault Models](https://chipedge.com/fault-models/)
*   [Number Analytics - Fault Models in VLSI](https://numberanalytics.com/blog/fault-models-in-vlsi/)
*   [VLSI Pro - Fault Models](https://vlsi.pro/fault-models/)