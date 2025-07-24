---
title: Scan Chains
description: Explanation of Scan Chains in Design for Test (DFT).
date: 2025-07-24
tags: [ASIC, DFT, Testing]
aliases: [Scan Path, Scan Register]
---

# Scan Chains

## Simple Explanation (Gist)
Scan chains are a fundamental Design for Test (DFT) technique where all sequential elements (flip-flops and latches) in an ASIC are reconfigured into one or more long shift registers during test mode, allowing for easy access and control of internal states.

## Detailed Breakdown

*   **Purpose**: The primary purpose of scan chains is to improve the [[Controllability]] and [[Observability]] of internal nodes in a digital circuit, which are crucial for effective manufacturing testing. By converting sequential elements into a shift register, test patterns can be shifted in and test responses can be shifted out, making it possible to test complex designs.

*   **How it Works**:
    1.  **Scan Flip-Flop**: A standard flip-flop is modified to become a scan flip-flop. This typically involves adding a 2-to-1 multiplexer at its data input. One input to the mux is the functional data input (D), and the other is the scan data input (SI).
    2.  **Test Mode**: During normal functional operation, the multiplexer selects the functional data input. In test mode (controlled by a global scan enable signal, SE), the multiplexer selects the scan data input.
    3.  **Chain Formation**: All scan flip-flops in the design are connected in a daisy-chain fashion, with the scan output (SO) of one flip-flop connecting to the scan input (SI) of the next. This forms one or more long shift registers, known as scan chains.
    4.  **Scan In/Scan Out**: Test patterns are shifted serially into the scan chain through a dedicated scan input (SI) pin. After the pattern is loaded, the circuit is put into functional mode for one or more clock cycles to capture the response. Then, the circuit is switched back to test mode, and the captured response is shifted out through a dedicated scan output (SO) pin for observation.

*   **Benefits**:
    *   **High Fault Coverage**: Enables high [[Fault Models|fault coverage]] for various fault types, especially [[Stuck-at Faults]].
    *   **Reduced Test Time**: While shifting is serial, the ability to access internal nodes significantly reduces the complexity and time required for test pattern generation compared to functional testing.
    *   **Automated Test Pattern Generation (ATPG)**: Scan chains are highly compatible with [[Automatic Test Pattern Generation (ATPG)|ATPG]] tools, which can automatically generate test patterns and predict expected responses.
    *   **Simplified Debugging**: Provides a mechanism to observe and control internal states, aiding in silicon debug and diagnosis.

*   **Design Considerations**:
    *   **Area Overhead**: The additional multiplexers and routing for scan chains add to the chip area. This overhead is typically acceptable due to the significant testability benefits.
    *   **Performance Impact**: The multiplexer in the scan flip-flop adds a small delay to the functional path, which must be accounted for during [[STA|timing analysis]].
    *   **Scan Chain Ordering**: The order in which flip-flops are connected in a scan chain can impact routing complexity, test time, and power consumption during scan operations.
    *   **Clocking**: All flip-flops in a scan chain must be clocked by the same clock during scan shift operations, or careful handling of multiple clocks is required.
    *   **Power during Scan**: Shifting large amounts of data can lead to high power consumption, which needs to be managed (e.g., using [[Scan Compression]] or low-power scan techniques).

*   **Integration into DFT Flow**: Scan chain insertion is a key step in the overall [[DFT|Design for Test]] flow, typically performed after [[Synthesis]] and before [[Physical Design]].

## Further Reading

*   [VLSI Test Principles and Architectures](https://www.amazon.com/VLSI-Test-Principles-Architectures-Wang/dp/0123706015)
*   [The Small Book About Design-for-Test](https://www.amazon.com/Small-Book-About-Design-Test-Juergen/dp/1732267909)