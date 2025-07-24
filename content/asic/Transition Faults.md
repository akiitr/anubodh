---
title: Transition Faults
description: Explanation of Transition Faults in Design for Test (DFT).
date: 2025-07-24
tags: [ASIC, DFT, Fault Models]
aliases: [Delay Faults]
---

# Transition Faults

## Simple Explanation (Gist)
Transition faults are a [[Fault Models|fault model]] used in digital circuit testing to detect defects that cause a signal to transition too slowly (or too quickly), leading to a delay fault. This ensures the circuit operates correctly at its specified clock frequency.

## Detailed Breakdown

*   **Purpose**: While [[Stuck-at Faults]] detect permanent shorts or opens, they do not adequately cover defects that cause a circuit to operate slower than expected. Transition faults specifically target these delay-related defects, ensuring that the circuit can meet its timing requirements at the target operating frequency.

*   **Types of Transition Faults**:
    1.  **Slow-to-Rise (STR)**: The signal transitions from logic 0 to logic 1 too slowly.
    2.  **Slow-to-Fall (STF)**: The signal transitions from logic 1 to logic 0 too slowly.

*   **How Transition Faults Occur (Physical Defects)**:
    *   **Resistive Shorts**: High-resistance shorts between a signal line and power/ground or another signal line.
    *   **Opens**: Partial or complete breaks in interconnects.
    *   **Process Variations**: Variations in manufacturing that lead to slower transistors or higher interconnect resistance/capacitance.
    *   **Weak Transistors**: Transistors that do not switch strongly enough.

*   **Testing for Transition Faults**: Testing for transition faults requires a two-pattern test sequence:
    1.  **Initialization Pattern (Launch)**: The first pattern is applied to set the fault site to the *opposite* logic value of the desired transition. For example, to test for a slow-to-rise fault, the fault site is initialized to logic 0.
    2.  **Propagation Pattern (Capture)**: The second pattern is applied to trigger the desired transition at the fault site (e.g., 0 to 1 for STR) and propagate the effect of the fault to an observable output (or [[Scan Chains|scan chain]] flip-flop). This second pattern is applied with a clock cycle that is equal to the functional clock period, ensuring that the transition occurs within the specified time.

*   **Key Concepts in Transition Testing**:
    *   **Launch-on-Shift (LOS)**: The second pattern is launched by shifting the scan chain one more time.
    *   **Launch-on-Capture (LOC)**: The second pattern is launched by a functional clock pulse after the scan chain is loaded.
    *   **At-Speed Testing**: Transition fault testing is inherently an at-speed test, meaning the test patterns are applied at the functional clock frequency of the chip.

*   **Fault Coverage**: Transition fault coverage measures the percentage of detectable transition faults in a design. It is a critical metric for assessing the quality of manufacturing tests for delay defects.

*   **Relationship with STA**: Transition fault testing complements [[STA|Static Timing Analysis]]. STA verifies the design against timing specifications in a static manner, while transition testing dynamically verifies the ability of the manufactured chip to operate at speed.

## Further Reading

*   [VLSI Test Principles and Architectures](https://www.amazon.com/VLSI-Test-Principles-Architectures-Wang/dp/0123706015)
*   [The Small Book About Design-for-Test](https://www.amazon.com/Small-Book-About-Design-Test-Juergen/dp/1732267909)