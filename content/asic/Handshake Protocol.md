---
title: Handshake Protocol
description: Explanation of Handshake Protocols in digital design.
date: 2025-07-24
tags: [ASIC, RTL Design, CDC]
aliases: [Handshake Protocol]
---

# Handshake Protocol

## Simple Explanation (Gist)
A handshake protocol is a method of communication between two asynchronous digital circuits or modules, where control signals are exchanged to ensure that data is transferred reliably and that both sender and receiver are ready for the transaction.

## Detailed Breakdown

*   **Motivation**: In [[Clock Domain Crossing (CDC)|Clock Domain Crossing (CDC)]] or between any two asynchronous modules, direct data transfer can lead to [[Metastability]] or data corruption if the sender and receiver are not synchronized. Handshake protocols provide a robust mechanism to coordinate data transfer without relying on a common clock.

*   **Concept**: A handshake involves a sequence of signal exchanges (typically request and acknowledge) that ensure both the sender and receiver are in a known state before and after a data transfer. This prevents race conditions and ensures data integrity.

*   **Common Types of Handshake Protocols**:
    1.  **Two-Phase Handshake (or Double Handshake)**:
        *   **Signals**: Typically `req` (request) and `ack` (acknowledge).
        *   **Operation**: The sender asserts `req` to indicate data is ready. The receiver asserts `ack` to indicate data has been received. Both `req` and `ack` are then de-asserted before the next transaction. The state of the signals (high or low) matters.
        *   **Sequence**: `req` high -> `ack` high -> `req` low -> `ack` low.
        *   **Characteristics**: Each transition (rising or falling edge) of `req` and `ack` signifies a new event. This means a full data transfer cycle requires four transitions (two for `req`, two for `ack`).

    2.  **Four-Phase Handshake (or Single Handshake)**:
        *   **Signals**: Typically `req` and `ack`.
        *   **Operation**: The sender asserts `req` to indicate data is ready. The receiver asserts `ack` to indicate data has been received. The sender then de-asserts `req`. Finally, the receiver de-asserts `ack`. Only the rising edge of `req` and `ack` signifies a new event.
        *   **Sequence**: `req` high -> `ack` high -> `req` low -> `ack` low.
        *   **Characteristics**: A full data transfer cycle requires four distinct phases (assert `req`, assert `ack`, de-assert `req`, de-assert `ack`). This is the most common type of handshake.

*   **Example (Four-Phase Handshake)**:
    *   **Sender**: Places data on the bus, then asserts `req`.
    *   **Receiver**: Detects `req` asserted, reads data from the bus, then asserts `ack`.
    *   **Sender**: Detects `ack` asserted, de-asserts `req`.
    *   **Receiver**: Detects `req` de-asserted, de-asserts `ack`.
    *   The system is now ready for the next transaction.

*   **Advantages**:
    *   **Robustness**: Provides reliable data transfer between asynchronous domains.
    *   **Flexibility**: Does not require a common clock, making it suitable for interfacing modules with different clock frequencies or even no clock relationship.
    *   **Simplicity**: Conceptually straightforward to implement.

*   **Disadvantages**:
    *   **Overhead**: Introduces latency due to the multiple signal exchanges required for each data transfer.
    *   **Area**: Requires additional control logic and wires for the handshake signals.

*   **Applications**:
    *   **[[Asynchronous FIFOs|Asynchronous FIFOs]]**: Used to manage data flow between clock domains.
    *   **Inter-module Communication**: Between different blocks on an SoC that operate at different clock speeds.
    *   **Peripheral Interfaces**: Communicating with external devices that are not synchronous with the main system clock.
    *   **GALS (Globally Asynchronous, Locally Synchronous) Systems**: Architectures where different parts of the chip operate synchronously but communicate asynchronously.

## Further Reading

*   [Asynchronous Communication on Wikipedia](https://en.wikipedia.org/wiki/Asynchronous_communication)
*   [Clock Domain Crossing (CDC) Design & Verification Techniques](https://www.synopsys.com/glossary/what-is-clock-domain-crossing.html)
*   [Digital Design and Computer Architecture](https://www.amazon.com/Digital-Design-Computer-Architecture-Harris/dp/0123944244)