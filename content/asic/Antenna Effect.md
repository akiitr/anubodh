---
title: Antenna Effect in VLSI
description: A detailed explanation of the Antenna Effect in VLSI, its causes, and how to prevent it.
date: 2025-07-23
tags: ["VLSI", "Physical Design", "ASIC", "Antenna Effect", "DRC"]
---

# Antenna Effect in VLSI

## 1. What is the Antenna Effect?

The [[Antenna Effect]], also known as Plasma-Induced Gate Oxide Damage, is a manufacturing-related reliability issue in [[ASIC Design|VLSI design]]. It occurs during the fabrication process, specifically during plasma etching, where long metal interconnects connected to a gate can accumulate charge, similar to an antenna. This charge can then discharge through the thin gate oxide of a transistor, causing damage and potentially leading to device failure.

## 2. Why is it a concern?

The [[Antenna Effect]] is a major concern for several reasons:

*   **Reliability:** It can cause permanent damage to the gate oxide, leading to device failure.
*   **Yield:** It can significantly reduce the manufacturing yield.
*   **Performance:** It can degrade the performance of the affected transistors.

## 3. How is it caused?

The [[Antenna Effect]] is caused by the following sequence of events:

1.  **Plasma Etching:** During plasma etching, a process used to define the metal interconnects, a large amount of charge is generated.
2.  **Charge Accumulation:** This charge can accumulate on long metal interconnects that are not yet connected to a diffusion layer.
3.  **Gate Oxide Damage:** If the accumulated charge is large enough, it can create a large electric field across the thin gate oxide of a connected transistor, causing a discharge that damages the oxide.

## 4. How is it prevented?

The [[Antenna Effect]] can be prevented by following a set of design rules known as "Antenna Rules." These rules are provided by the [[Foundry|foundry]] and specify the maximum allowable ratio of the metal interconnect area to the gate area.

Here are some common techniques used to prevent the [[Antenna Effect]]:

*   **Metal Jumping:** Breaking long interconnects and "jumping" to a higher metal layer for a short distance. This reduces the length of the "antenna."
*   **Diode Insertion:** Adding a reverse-biased diode near the gate to provide a safe discharge path for the accumulated charge.
*   **Gate Protection:** Using a gate protection circuit to clamp the voltage at the gate to a safe level.

## 5. How is it checked?

The [[Antenna Effect]] is checked using a set of tools known as "Antenna Checkers." These tools are typically part of the [[DRC|Design Rule Checking (DRC)]] flow and are used to identify any violations of the antenna rules.

## 6. Conclusion

The [[Antenna Effect]] is a critical reliability issue in [[ASIC Design|VLSI design]] that can cause device failure and reduce manufacturing yield. It is caused by charge accumulation on long metal interconnects during plasma etching. The [[Antenna Effect]] can be prevented by following a set of design rules and by using techniques such as metal jumping and diode insertion.

## Further Reading

*   **Physical Design Essentials: An ASIC Design Implementation Perspective** by Khosrow Golshan
*   **CMOS VLSI Design: A Circuits and Systems Perspective** by Neil Weste and David Harris
*   [Synopsys IC Compiler II Documentation](https://www.synopsys.com/implementation-and-signoff/physical-implementation/ic-compiler-ii.html)
