---
title: Synchronizers
description: Explanation of Synchronizers in Clock Domain Crossing (CDC).
date: 2025-07-24
tags: [ASIC, CDC, Verification]
aliases: [Clock Domain Crossing Synchronizers]
---

# Synchronizers

## Simple Explanation (Gist)
Synchronizers are special circuits used in ASIC design to safely transfer data or control signals between different [[Clock Domain Crossing (CDC)|clock domains]] (parts of a chip operating at different clock frequencies or phases), preventing [[Metastability]] and ensuring reliable data transfer.

## Detailed Breakdown

*   **Purpose**: When a signal crosses from one clock domain to another, it can violate the [[Setup|setup]] and [[Hold Time|hold]] time requirements of the receiving flip-flop, leading to [[Metastability]]. A synchronizer is designed to mitigate this risk by ensuring that the signal is stable and valid before it is sampled by the destination clock domain.

*   **Metastability**: This is an unstable state where a flip-flop's output is neither a clear logic 0 nor a clear logic 1, and it can remain in this state for an unpredictable amount of time before settling to a valid logic level. If the metastable output is sampled by another flip-flop, it can propagate throughout the design, leading to functional failures.

*   **Common Synchronizer Topologies**:
    1.  **Two-Flip-Flop Synchronizer**: The most common and robust synchronizer for single-bit control signals. It consists of two cascaded flip-flops clocked by the destination clock. The first flip-flop is susceptible to metastability, but the second flip-flop samples the output of the first. The probability of both flip-flops going metastable simultaneously is extremely low, ensuring that the output of the second flip-flop is stable.
        ```mermaid
        graph LR
            A[Source Clock Domain] --> B(Data_in);
            B --> C[FF1 - Dest_Clk];
            C --> D[FF2 - Dest_Clk];
            D --> E[Destination Clock Domain];
        ```
        *   **Limitation**: Introduces two clock cycles of latency.
        *   **Usage**: Ideal for control signals (e.g., enable, reset, handshake signals) where latency is acceptable.

    2.  **Three-Flip-Flop Synchronizer**: Used when even higher reliability is required, or when the clock frequency is very high, further reducing the probability of metastability.

    3.  **[[Asynchronous FIFOs|Asynchronous FIFOs]]**: For multi-bit data transfer between asynchronous clock domains. FIFOs (First-In, First-Out) use handshake signals and dual-port RAMs with separate read and write pointers to safely transfer data.

    4.  **Handshake Protocols**: For control signals that require acknowledgment, a request-acknowledge handshake can be implemented using two-flip-flop synchronizers for each direction.

    5.  **Mux-Based Synchronizers**: Used for multi-bit data buses where latency must be minimized. These are more complex and require careful design to avoid glitches.

*   **Design Considerations**:
    *   **Latency**: Synchronizers introduce latency (typically 2-3 clock cycles) into the signal path. This latency must be accounted for in the design's timing budget.
    *   **Throughput**: For data paths, the synchronizer must be able to handle the required data rate without loss.
    *   **Reset Synchronization**: Resets crossing clock domains also need to be synchronized to prevent asynchronous reset release issues.
    *   **Testability**: Synchronizers should be designed to be testable, ensuring their proper operation during manufacturing tests.
    *   **Formal Verification**: [[Formal Verification]] tools are often used to formally verify the correctness of synchronizer implementations.

*   **CDC Verification**: Dedicated [[Clock Domain Crossing (CDC)|CDC verification]] tools are used to identify all clock domain crossings in a design and ensure that appropriate synchronizers are in place, preventing potential metastability issues.

## Further Reading

*   [Clock Domain Crossing: A Practical Guide to Design and Verification](https://www.amazon.com/Clock-Domain-Crossing-Practical-Verification/dp/0123742920)
*   [SystemVerilog for Verification: A Guide to Learning the Testbench Language Features](https://www.amazon.com/SystemVerilog-Verification-Learning-Testbench-Language/dp/0137046318)