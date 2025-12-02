---
title: "Time Borrowing (Cycle Stealing) in Latches"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note explains time borrowing (cycle stealing), a technique used in latch-based designs where logic paths can exceed their nominal cycle time by utilizing the latch's transparency window, effectively "borrowing" time from the next stage.

That is absolutely correct. **Time borrowing**, also known as **cycle stealing**, is a feature unique to designs utilizing **transparent latches**.

Here is a detailed look at why this concept exists and how it works:

### 1. Why Latches Allow Borrowing

The ability to borrow time stems from the fundamental difference between a latch and a flip-flop:

*   **Latches are Level-Sensitive (Transparent):** A D latch is a sequential element that is "transparent" (open) when the clock is high (or low, depending on design), meaning the output (Q) instantly follows the input (D). Since the latch stays transparent for the entire pulse width, data can continue to propagate through the latch even after the clock's active edge (the opening edge).
*   **Flip-Flops Have Hard Edges:** Flip-flops are edge-triggered and impose a **hard edge**. Data must arrive and meet the setup time *before* the clock edge; if it arrives late, the result is an incorrect sample (a setup violation).

### 2. Mechanism of Time Borrowing

Time borrowing typically happens in two-phase clocking systems where the available computation time is nominally divided into half-cycles.

1.  **Late Arrival:** If the combinational logic path leading to a latch has a propagation delay longer than the nominal time available for that half-cycle, the data signal may arrive **after the clock's opening edge**.
2.  **Transparency:** Because the latch is still transparent until the **closing edge** of the clock, it can still capture the data correctly. The path has effectively borrowed time from the next clock phase.
3.  **Launch Point Shift:** When borrowing occurs, the timing tool models the next stage's launch point not from the latch's clock pin, but from the actual **data arrival time at the D pin**. This ensures that the time borrowed from the next stage is accurately accounted for.

### 3. The Consequences

While time borrowing helps meet setup requirements for long paths, it shortens the time available for subsequent logic stages:

*   The total delay for the path, including the borrowed time, must still meet the required cycle time for the entire design.
*   This technique is valuable because it allows designers to **balance delay** across pipeline stages more easily during design, and it allows the finished chip to opportunistically compensate for process variations.

## Quiz Context
> [!QUESTION] Time Borrowing / Cycle Stealing
> **Question:** What is the concept of 'time borrowing' or 'cycle stealing' in STA, and with which type of sequential element is it associated?
>
> **Correct Answer:** It occurs in a latch-based design, where a path ending at a latch can use time from the next clock phase if it fails to meet timing within the current phase.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.