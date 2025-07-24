---
title: Stuck-at Faults
description: Explanation of Stuck-at Faults in Design for Test (DFT).
date: 2025-07-24
tags: [ASIC, DFT, Fault Models]
aliases: [Stuck-at-0, Stuck-at-1]
---

# Stuck-at Faults

## Simple Explanation (Gist)
Stuck-at faults are a fundamental [[Fault Models|fault model]] used in digital circuit testing where a signal line or a gate input/output is permanently fixed at a logic 0 (stuck-at-0) or a logic 1 (stuck-at-1), regardless of the actual circuit behavior.

## Detailed Breakdown

*   **Purpose**: The stuck-at fault model is widely used in [[DFT|Design for Test]] because it is simple, effective, and covers a significant percentage of physical defects that can occur during semiconductor manufacturing. It simplifies the process of [[Automatic Test Pattern Generation (ATPG)|ATPG]] and [[Test Coverage]] calculation.

*   **Types of Stuck-at Faults**:
    1.  **Stuck-at-0 (SA0)**: The signal line or node is permanently fixed at a logic low (0) value.
    2.  **Stuck-at-1 (SA1)**: The signal line or node is permanently fixed at a logic high (1) value.

*   **Location of Faults**: Stuck-at faults can occur at various points in a digital circuit:
    *   **Gate Inputs**: An input pin of a logic gate is stuck at 0 or 1.
    *   **Gate Outputs**: The output pin of a logic gate is stuck at 0 or 1.
    *   **Net Segments**: Any segment of a wire (net) connecting two or more components is stuck at 0 or 1.

*   **How Stuck-at Faults Occur (Physical Defects)**:
    *   **Shorts**: A short circuit to ground (VSS) can cause a stuck-at-0. A short to power (VDD) can cause a stuck-at-1.
    *   **Opens**: An open circuit can cause a floating node, which might behave as a stuck-at-0 or stuck-at-1 depending on the technology and surrounding circuitry.
    *   **Transistor Failures**: A transistor permanently stuck ON or OFF can manifest as a stuck-at fault.

*   **Testing for Stuck-at Faults**:
    1.  **Activation**: A test pattern (input vector) is applied to the circuit to create a logic value at the fault site that is *opposite* to the stuck-at value. For example, to test for a stuck-at-0 fault, a logic 1 must be driven to the fault site.
    2.  **Propagation**: The effect of the fault (the incorrect logic value at the fault site) must then be propagated through the combinational logic to an observable output pin (or a scan chain flip-flop) where it can be detected by the [[ATE|Automatic Test Equipment]].

*   **Fault Coverage**: The percentage of detectable stuck-at faults in a design is a key metric for test quality. [[Scan Chains]] are widely used to improve the controllability and observability of internal nodes, thereby increasing stuck-at fault coverage.

*   **Limitations**: While widely used, the stuck-at fault model does not cover all possible physical defects. Other fault models, such as [[Transition Faults]] (for delay defects) and [[Bridging Faults]] (for shorts between two signal lines), are used to complement stuck-at testing.

## Further Reading

*   [VLSI Test Principles and Architectures](https://www.amazon.com/VLSI-Test-Principles-Architectures-Wang/dp/0123706015)
*   [The Small Book About Design-for-Test](https://www.amazon.com/Small-Book-About-Design-Test-Juergen/dp/1732267909)