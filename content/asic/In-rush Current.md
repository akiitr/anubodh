---
title: In-rush Current
description: In-rush Current in VLSI Power Management Techniques
date: 2025-07-24
tags:
  - VLSI
  - Power Management
  - Power Integrity
aliases:
  - In-rush Current
  - Wakeup Latency
---

# In-rush Current in VLSI Power Management Techniques

## Simple Explanation (Gist)
In-rush current is a momentary surge of current that occurs when a power domain or a chip is first powered on or woken up from a low-power state, due to the charging of internal capacitances.

## Detailed Breakdown

*   **Definition**: In-rush current, also known as switch-on surge or power-on surge, is the maximum instantaneous input current drawn by an electrical device when it is first turned on. In VLSI, this phenomenon is particularly relevant when power domains are enabled or when a chip transitions from a deep sleep mode to an active state.

*   **Causes**: The primary cause of in-rush current in digital circuits is the charging of parasitic capacitances within the chip, such as gate capacitances of transistors and interconnect capacitances. When power is applied, these capacitances act as short circuits initially, drawing a large amount of current until they are fully charged.

*   **Impact**: 
    *   **Voltage Droop**: The sudden high current demand can cause a temporary drop in the supply voltage (voltage droop) across the [[Power Delivery Network (PDN)]], potentially leading to functional failures or increased delays.
    *   **Electromigration (EM)**: Repeated high current surges can accelerate [[Electromigration]] in power rails, degrading their reliability over time.
    *   **Power Supply Stress**: It can stress the external power supply and on-chip power switches, potentially leading to their failure.
    *   **Wakeup Latency**: Managing in-rush current is crucial for optimizing wakeup latency, as the chip cannot fully function until stable power is established.

*   **Mitigation Techniques**: 
    *   **Slew Rate Control**: Controlling the rate at which the power supply ramps up to limit the peak current. This can be achieved through controlled power switches or dedicated power management units.
    *   **Staged Power-Up**: Enabling different power domains or sections of the chip sequentially rather than all at once, distributing the in-rush current over time.
    *   **Pre-charging**: Pre-charging certain internal nodes or capacitances before full power-up to reduce the initial current surge.
    *   **Decoupling Capacitors (Decaps)**: While primarily for dynamic IR drop, strategically placed [[Decaps]] can help supply local charge during sudden current demands, including in-rush.
    *   **Current Limiting Circuits**: Implementing circuits that actively limit the maximum current drawn during power-up.

*   **Design Considerations**: In-rush current analysis is an important part of [[Power Signoff]] and power management design. Designers need to ensure that the PDN and power management strategy can handle the peak in-rush current without violating voltage integrity or reliability constraints.

## Further Reading

*   [Power Integrity for I.C. Design](https://www.amazon.com/Power-Integrity-Design-Louis-Scheffer/dp/0387366423)
*   [VLSI Design and Test](https://www.amazon.com/VLSI-Design-Test-S-K-Kataria/dp/818527403X)