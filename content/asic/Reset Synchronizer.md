---
title: Reset Synchronizer
description: Reset Synchronizer in VLSI Design
date: 2025-07-24
tags:
  - VLSI
  - RTL Design
  - Reset
  - CDC
aliases:
  - Reset Synchronizer
---

# Reset Synchronizer in VLSI Design

## Simple Explanation (Gist)
A reset synchronizer is a circuit used in VLSI design to safely transfer an asynchronous reset signal from one clock domain to another, or to synchronize an external asynchronous reset to the internal clock, preventing [[Metastability]] and ensuring reliable reset operation.

## Detailed Breakdown

*   **Motivation**: An asynchronous reset signal can change at any time, independent of the clock. If this asynchronous signal directly drives flip-flops in a synchronous clock domain, and its de-assertion (or assertion) happens too close to the active clock edge, it can violate the flip-flop's [[Recovery|recovery]] or [[Removal|removal]] time requirements. This can lead to metastability, where the flip-flop output enters an unstable state, potentially causing unpredictable behavior or functional failures.

*   **Concept**: A reset synchronizer typically consists of a series of flip-flops (usually two or three) clocked by the destination clock. The asynchronous reset signal is fed into the first flip-flop, and its output is then fed into the subsequent flip-flops. This chain of flip-flops acts as a filter, allowing any metastable state to resolve before the signal propagates to the rest of the synchronous logic.

*   **Common Implementations**: 
    1.  **Two-Flip-Flop Synchronizer**: 
        *   The most common and simplest form. The asynchronous reset signal (or its synchronized version) is passed through two cascaded flip-flops clocked by the destination clock.
        *   Provides a high probability of resolving metastability, but not 100% guaranteed.

        ```mermaid
        graph TD
            A[Asynchronous Reset] --> B[FF1 (Clocked by Dest_Clk)];
            B --> C[FF2 (Clocked by Dest_Clk)];
            C --> D[Synchronized Reset to Logic];
            style B fill:#f9f,stroke:#333,stroke-width:2px
            style C fill:#f9f,stroke:#333,stroke-width:2px
        ```

    2.  **Three-Flip-Flop Synchronizer**: 
        *   Adds an extra flip-flop to the chain, further reducing the probability of metastability. Used in very high-reliability designs or when the clock period is very short.

*   **Key Considerations**: 
    *   **Reset Assertion vs. De-assertion**: 
        *   **Asynchronous Assertion**: The reset signal can be asserted asynchronously to immediately force the system into a known state.
        *   **Synchronous De-assertion**: The de-assertion of the reset signal is typically synchronized to the destination clock. This is crucial because if the reset is de-asserted asynchronously, different flip-flops might come out of reset at slightly different times due to varying delays, leading to functional issues.
    *   **Reset Pulse Width**: The asynchronous reset pulse must be wide enough to be reliably captured by the synchronizer flip-flops.
    *   **Reset Polarity**: The synchronizer must handle the correct polarity of the reset signal.
    *   **Reset Domain Crossing**: When a reset originates in one clock domain and needs to be applied to logic in another clock domain, a reset synchronizer is essential for safe [[CDC|Clock Domain Crossing]].

*   **Role in [[Reset Strategy]]**: Reset synchronizers are a fundamental component of a robust reset strategy, especially when dealing with asynchronous resets or resets crossing clock domains. They ensure that the reset signal is clean and stable before affecting the synchronous logic.

## Further Reading

*   [Digital Design and Computer Architecture](https://www.amazon.com/Digital-Design-Computer-Architecture-Harris/dp/0123944244)
*   [Clock Domain Crossing (CDC) Design & Verification Techniques](https://www.vlsi-expert.com/2018/01/clock-domain-crossing-cdc-design.html)
*   [Synchronizers for Asynchronous Inputs](https://www.eetimes.com/synchronizers-for-asynchronous-inputs/)
