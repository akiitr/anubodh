
---
title: Propagation Delay
description: Explanation of Propagation Delay in VLSI.
date: 2025-07-24
tags: [ASIC, Timing, Delay]
aliases: [Gate Delay, Cell Delay]
---

# Propagation Delay

## Simple Explanation (Gist)
Propagation delay is the time it takes for a signal to travel through a logic gate or a circuit path, from the moment its input changes until its output responds. It's a fundamental measure of a circuit's speed.

## Detailed Breakdown

*   **Definition**: Propagation delay (`t_p`) is the time interval between the application of an input signal and the appearance of the corresponding output signal. It is typically measured from the 50% point of the input transition to the 50% point of the output transition.

*   **Types of Propagation Delay**: 
    *   **`t_pLH` (Low-to-High Propagation Delay)**: The time taken for the output to transition from a low logic level to a high logic level.
    *   **`t_pHL` (High-to-Low Propagation Delay)**: The time taken for the output to transition from a high logic level to a low logic level.
    *   The overall propagation delay of a gate is often taken as the average of `t_pLH` and `t_pHL`.

*   **Factors Affecting Propagation Delay**: 
    1.  **Input Transition Time (Slew)**: The rate at which the input signal changes. A slower input transition (higher slew) generally leads to a longer propagation delay through the gate.
    2.  **Output Load Capacitance**: The total capacitance connected to the output of the gate. This includes the input capacitance of the gates it drives (fanout) and the parasitic capacitance of the interconnecting wires. A higher load capacitance requires more time to charge or discharge, thus increasing the propagation delay.
    3.  **Drive Strength of the Gate**: The ability of the gate to charge or discharge the output load. Stronger (larger) gates have lower output resistance and can drive larger loads faster, resulting in smaller propagation delays.
    4.  **Process, Voltage, Temperature (PVT)**: These manufacturing and environmental factors significantly influence transistor characteristics and thus gate delays. For example, higher temperature generally increases delay, while higher voltage generally decreases delay.

*   **Importance in VLSI Design**: 
    *   **Performance**: Propagation delay directly limits the maximum operating frequency of a chip. Shorter delays allow for faster clock speeds and higher performance.
    *   **Timing Closure**: Accurate knowledge of propagation delays is essential for [[STA|Static Timing Analysis]] to ensure that all timing paths in the design meet their setup and hold requirements.
    *   **Power Consumption**: While primarily affecting performance, propagation delay is indirectly related to power. Slower transitions (longer delays) can lead to increased dynamic power consumption due to longer periods of short-circuit current.

*   **Modeling Propagation Delay**: 
    *   Propagation delays for standard cells are characterized by the foundry or library vendor and provided in [[Timing Library|timing library]] files (e.g., Liberty format). 
    *   These libraries often use [[NLDM|Non-Linear Delay Models]] (NLDM) or [[CCS | Composite Current Source]] (CCS) models to accurately represent the non-linear relationship between delay, input slew, and output load.

## Further Reading

*   [CMOS VLSI Design: A Circuits and Systems Perspective](https://www.amazon.com/CMOS-VLSI-Design-Circuits-Perspective/dp/0321547748)
*   [Digital Integrated Circuits: A Design Perspective](https://www.amazon.com/Digital-Integrated-Circuits-Design-Perspective/dp/0130909963)
*   [Propagation Delay on Wikipedia](https://en.wikipedia.org/wiki/Propagation_delay)
