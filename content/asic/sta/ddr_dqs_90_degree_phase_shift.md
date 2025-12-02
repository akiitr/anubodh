---
title: "DDR DQS 90-Degree Phase Shift"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note explains why the DQS signal is typically phase-shifted by 90 degrees relative to DQ in a DDR SDRAM write cycle to center the DQS edge within the data valid window, maximizing timing margins.

That is absolutely the **correct answer**. The 90-degree (quarter-cycle) phase shift is the critical mechanism used to guarantee that the memory controller's output data is captured reliably by the SDRAM chip during a write operation.

Here is a detailed explanation of this requirement:

### 1. DDR Signaling and the Capture Requirement

In a DDR interface, data (DQ) is transferred on both the rising and falling edges of the clock/strobe. The DQS signal functions as a strobe that the receiving SDRAM chip uses as its clock to capture the incoming DQ data.

The fundamental requirement for reliable synchronous data transfer is that the clock (or strobe) edge must occur precisely at the **center of the data valid window** (or "eye"). This maximizes the margin available for both setup and hold timing checks at the capture element.

### 2. The Quarter-Cycle Phase Shift

During the write cycle (where the DUA sends DQ and DQS to the SDRAM):

1.  **DQ Data:** The DQ signals are generated on both the rising and falling edges of the memory clock (or an internal 1x or 2x clock), resulting in new data every half-cycle.
2.  **DQS Requirement:** To position the DQS transition edge exactly in the center of the half-cycle window where the DQ data is stable, the DQS signal must be offset by **90 degrees (a quarter-cycle)** relative to the main DQ launch clock edges.
3.  **Implementation:** The DUA achieves this quarter-cycle delay, often through a **Delay-Locked Loop (DLL)**, which delays the DQS signal by the required amount (e.g., $1.5\text{ns}$ in a $6\text{ns}$ clock period example).

### 3. Constraints Imposed on the DUA

When constraining this interface, the timing tool must verify that the DQS is offset correctly at the DUA output and that the data meets the memory's specified setup and hold requirements (which are defined relative to this offset DQS strobe).

This required timing relationship is why the timing constraints on the DUA are often counter-intuitive:

*   The timing check for DQ output uses the **DQS signal as the reference clock**.
*   The setup check for DQ (max delay) is performed against the DQS edge that is **90 degrees later** than the DQ launch edge.
*   The constraints must also account for variations caused by IO buffer delays and Printed Circuit Board (PCB) trace differences, as these can cause misalignment even if the signals are perfectly generated inside the DUA.

This tight coupling and required offset contrast with the **read cycle** in DDR, where the memory chip aligns DQ and DQS, and the controller inside the DUA uses its own DLL to delay the incoming DQS to center it for capture.

## Quiz Context
> [!QUESTION] DDR DQS 90-Degree Phase Shift
> **Question:** In a DDR SDRAM write cycle, why is the DQS (data strobe) signal typically phase-shifted by 90 degrees relative to the DQ (data) signals at the DUA output?
> 
> **Correct Answer:** To align the DQS edges with the center of the DQ data valid window at the memory's input pins, maximizing setup and hold margins for data capture.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.