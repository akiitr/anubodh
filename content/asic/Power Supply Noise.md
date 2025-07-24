
---
title: Power Supply Noise
description: Explanation of Power Supply Noise in VLSI.
date: 2025-07-24
tags: [ASIC, Power Integrity, Noise]
aliases: [Power Noise, VDD Noise, Ground Bounce]
---

# Power Supply Noise

## Simple Explanation (Gist)
Power supply noise refers to unwanted fluctuations or variations in the voltage levels of the power (Vdd) and ground (Vss) lines within a VLSI chip, which can negatively impact circuit performance and reliability.

## Detailed Breakdown

*   **Concept**: Ideally, the power (Vdd) and ground (Vss) rails on a chip should maintain constant, stable voltage levels. However, due to the dynamic switching of millions of transistors, current demands fluctuate rapidly, causing voltage drops and spikes across the resistive and inductive components of the [[Power Delivery Network (PDN)]]. These fluctuations are collectively known as power supply noise.

*   **Sources of Power Supply Noise**: 
    1.  **[[IR Drop]]**: The voltage drop across the resistive components of the PDN due to the average current drawn by the circuit. This is a DC voltage drop.
    2.  **Ldi/dt Noise (Simultaneous Switching Noise - SSN)**: This is a transient voltage drop or spike caused by rapid changes in current (dI/dt) flowing through the parasitic inductance (L) of the power delivery path (package, bond wires, on-chip interconnects). When many gates switch simultaneously, they draw a large surge of current, leading to a sudden voltage drop (Vdd sag) or ground bounce (Vss rise).
    3.  **Resonance**: The PDN, along with [[Decaps|decoupling capacitors]], forms a complex RLC (Resistance-Inductance-Capacitance) network. If not properly designed, this network can resonate at certain frequencies, leading to amplified voltage fluctuations.
    4.  **External Noise**: Noise coupled from external sources or other parts of the system.

*   **Impact of Power Supply Noise**: 
    *   **Performance Degradation**: Reduced effective supply voltage at the gates slows down transistor switching, increasing gate delays and potentially causing [[Setup|setup]] or [[Hold Time|hold]] violations.
    *   **Functional Failures**: Severe noise can cause logic gates to malfunction, flip-flops to enter metastable states, or even lead to incorrect data capture, resulting in functional errors.
    *   **[[Signal Integrity]] Issues**: Noise on power rails can couple into signal nets, degrading signal quality and potentially causing [[Crosstalk]] or false switching.
    *   **Increased Power Consumption**: Noise can lead to unnecessary switching, contributing to dynamic power consumption.
    *   **Reliability Issues**: Long-term exposure to excessive voltage fluctuations can stress transistors and accelerate aging mechanisms like [[Electromigration]].

*   **Mitigation Techniques**: 
    *   **Robust [[Power Delivery Network (PDN)]] Design**: 
        *   **Wide Power/Ground Lines**: Using wider and thicker metal lines for power and ground to reduce resistance and inductance.
        *   **Dense [[Power Mesh]]/[[Power Grid]]**: Designing a dense grid of power and ground straps on multiple layers to provide multiple low-impedance paths for current.
        *   **Sufficient Vias**: Ensuring ample and robust via connections between different metal layers of the power grid.
    *   **[[Decaps|Decoupling Capacitors (Decaps)]]**: Strategically placing on-chip and off-chip decoupling capacitors close to switching logic. Decaps act as local charge reservoirs, providing instantaneous current during switching events and absorbing voltage fluctuations.
    *   **Controlled Slew Rates**: Limiting the slew rate of high-current signals to reduce dI/dt.
    *   **Staggered Switching**: Designing circuits to avoid simultaneous switching of a large number of gates.
    *   **Power-Aware Design**: Employing [[Low Power Design]] techniques like [[Clock Gating]] and [[Power Gating]] to reduce overall current demands.
    *   **Power Integrity Analysis**: Using specialized [[PDN Tools]] (e.g., RedHawk-SC, Voltus) to analyze and verify the PDN integrity, identify noise hot spots, and ensure compliance with voltage specifications.

## Further Reading

*   [Power Integrity Analysis and Management for Integrated Circuits](https://www.amazon.com/Power-Integrity-Analysis-Management-Integrated/dp/0132398202)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Power Supply Noise in VLSI](https://www.vlsi-expert.com/2018/01/power-supply-noise-in-vlsi.html)
