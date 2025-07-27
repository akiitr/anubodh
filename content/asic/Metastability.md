---
title: Metastability
description: Explanation of Metastability in digital circuits, especially in Clock Domain Crossing (CDC).
date: 2025-07-24
tags: [ASIC, RTL Design, CDC]
aliases: [Metastability]
---

# Metastability

## Simple Explanation (Gist)
Metastability is an unstable state in a digital circuit, particularly in flip-flops, where the output settles to an unpredictable logic level (neither a clear 0 nor 1) for an indeterminate amount of time. It occurs when the setup or hold time requirements of a flip-flop are violated, most commonly when synchronizing asynchronous signals or signals crossing different clock domains.

## Detailed Breakdown

*   **Concept**: A flip-flop is designed to reliably capture data if its input data is stable for a specified period before (setup time) and after (hold time) the active clock edge. If these timing requirements are violated, the flip-flop's internal feedback loop can enter an unstable equilibrium, where its output oscillates or remains at an intermediate voltage level for a period longer than its normal propagation delay. Eventually, it will resolve to a stable 0 or 1, but the final state and the time it takes to resolve are unpredictable.

*   **Causes of Metastability**:
    *   **[[Clock Domain Crossing (CDC)|Clock Domain Crossing (CDC)]]**: This is the most common cause. When a signal transitions from one clock domain to another, there is no guaranteed timing relationship between the launching clock and the capturing clock. If the incoming data changes too close to the capturing flip-flop's clock edge, a setup or hold violation can occur.
    *   **Asynchronous Inputs**: Any asynchronous input to a synchronous system (e.g., external button presses, sensor data) can violate the timing requirements of the first flip-flop it encounters.

*   **Consequences of Metastability**:
    *   **Functional Failure**: If the metastable output is sampled by downstream logic before it resolves to a stable state, or if different parts of the circuit interpret the metastable output differently, it can lead to incorrect logic operations and functional bugs.
    *   **Increased Delay**: The time taken for a flip-flop to resolve from a metastable state adds to the overall propagation delay, potentially causing timing violations in the receiving clock domain.
    *   **System Crash**: In severe cases, unresolved metastability can propagate throughout the system, leading to unpredictable behavior or system crashes.

*   **Probability of Metastability**: While it cannot be entirely eliminated, the probability of a flip-flop entering and remaining in a metastable state can be significantly reduced. The probability decreases exponentially with time. This is why synchronizers are used.

*   **Mitigation Techniques (Synchronizers)**:
    The most common way to mitigate metastability is by using a series of flip-flops (synchronizers) to allow the metastable signal sufficient time to resolve before it is used by the rest of the synchronous logic. The most common synchronizer is the **two-flip-flop synchronizer**:

    ```mermaid
    graph LR
        A[Async Signal] --> FF1[DFF1];
        Clock[Clock] --> FF1;
        FF1 --> FF2[DFF2];
        Clock --> FF2;
        FF2 --> B[Synchronized Signal];
    ```

    *   **How it works**: The first flip-flop (FF1) is the one most likely to go metastable. If it does, the second flip-flop (FF2) provides an additional clock cycle for FF1's output to resolve to a stable state before FF2 samples it. The probability of both FF1 and FF2 going metastable simultaneously (and thus propagating an unstable signal) is extremely low.
    *   **Mean Time Between Failures (MTBF)**: The effectiveness of a synchronizer is often quantified by its MTBF, which is the average time between occurrences of a synchronization failure. A higher MTBF indicates a more reliable synchronizer.

*   **Other Synchronizer Types**:
    *   **Three-flip-flop synchronizer**: Used for very high clock frequencies or very critical signals, providing even higher reliability at the cost of more latency.
    *   **Handshake protocols**: For multi-bit signals crossing clock domains, [[Handshake Protocol|handshake protocols]] or [[Asynchronous FIFOs|asynchronous FIFOs]] are used to ensure data integrity and avoid metastability on individual bits.

*   **Importance**: Proper handling of metastability is crucial for the functional correctness and reliability of any digital system that deals with asynchronous inputs or multiple clock domains. Failure to address it can lead to elusive and difficult-to-debug bugs in silicon.

## Further Reading

*   [Metastability in electronics on Wikipedia](https://en.wikipedia.org/wiki/Metastability_in_electronics)
*   [Clock Domain Crossing (CDC) Design & Verification Techniques](https://www.synopsys.com/glossary/what-is-clock-domain-crossing.html)
*   [Digital Design and Computer Architecture](https://www.amazon.com/Digital-Design-Computer-Architecture-Harris/dp/0123944244)