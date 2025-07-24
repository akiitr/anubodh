---
title: Cost Target
description: A detailed explanation of Cost Target in VLSI, its components, and its impact on technical decisions in ASIC design.
date: 2025-07-23
tags: ["VLSI", "ASIC Design", "Economics", "Manufacturing"]
---
The [[Cost Target]] is a primary business requirement that translates into direct technical constraints for the [[ASIC Design|ASIC]] design team. It dictates the budget for both initial development and recurring manufacturing costs, heavily influencing technology selection, [[Die Size Estimation|die size]], packaging, and test strategy.

### Components of Cost
1.  **Non-Recurring Engineering (NRE) Costs**:
    *   Large, one-time, upfront costs to design, verify, and prepare the [[ASIC Design|ASIC]] for manufacturing.
    *   The single largest NRE cost is typically the **photomask set** used for lithography.
    *   NRE for advanced nodes (e.g., 5nm) can be millions of dollars. A design re-spin incurs this cost again.

2.  **Per-Unit Cost**:
    *   The recurring cost to manufacture, package, and test each individual [[Integrated Circuits|chip]].
    *   The dominant factor is the silicon **[[Die Size Estimation|die area]]**. Smaller dice result in more chips per wafer and higher [[Yield Analysis|yield]], lowering the per-unit cost.
    *   This cost is amortized over the production volume.

### Impact on Technical Decisions
The [[Cost Target]] is a powerful forcing function that drives key early decisions:

*   **Process Technology Selection**: A project with a limited budget cannot afford the high NRE of a leading-edge process node. It will be constrained to specify an older, more mature, and less expensive technology (e.g., 40nm vs. 5nm).
*   **[[PPA]] Boundaries**: The chosen process technology directly determines the fundamental characteristics of the transistors (size, speed, power, leakage). This sets a hard ceiling on the achievable [[PPA]]. No amount of clever [[Microarchitecture]] can make a a 180nm process achieve a 5 GHz [[Clock Frequency]].
*   **[[Area]] Constraint**: The need to minimize per-unit cost translates directly into a strict constraint on silicon area, influencing every [[Microarchitecture]] decision.

In this way, the business-level [[Cost Target]] creates a direct causal chain down to the most fundamental physical constraints of the [[Integrated Circuits|chip]], defining the design space before [[RTL Design]] begins.

## Further Reading

*   **VLSI Design** by Debaprasad Das
*   **CMOS VLSI Design: A Circuits and Systems Perspective** by Neil Weste & David Harris
*   [SemiEngineering - Chip Costs](https://semiengineering.com/chip-costs/)
*   [Wikipedia - Non-recurring engineering](https://en.wikipedia.org/wiki/Non-recurring_engineering)