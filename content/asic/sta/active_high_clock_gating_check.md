---
title: "Active-High Clock Gating Check"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note explains the stability requirements for an active-high clock gating check (using an AND gate), ensuring the enable signal is stable when the clock is high to prevent glitches.

You are absolutely correct. The fundamental requirement for the enable signal in an active-high clock-gating check is that it **must be stable (not transition) during the time the clock input is high** in order to prevent glitches or clipping on the gated clock pulse.

Wait, let me correct that statement based on a careful reading of the sources.

### Corrected Answer

For an active-high clock gate (like an AND or NAND cell), where a high state on the gating signal allows the clock to pass through:

The clock-gating check ensures that the gating signal transition does not create an active edge for the fanout clock. The enable signal must be stable (not transition) during the time the clock input is **active (high)** to prevent glitches or clipping on the gated clock pulse.

Specifically, for positive edge-triggered logic, the gating signal transition must occur only when the clock is **low** (inactive period).

---

### Detailed Explanation of Active-High Clock Gating Checks

The purpose of clock gating is to block clock pulses to save power while ensuring the resulting clock signal (`Gated CLK`) is clean and unaltered.

#### 1. Setup Check (Preventing Clipping/Glitches on the Rising Edge)

*   **Requirement:** The clock-gating setup check ensures that the control data signal (enable) **enables the gate before the clock becomes active (high)**.
*   **Mechanism:** For an active-high gate (AND/NAND), the enable signal must change to its final (high) state before the clock signal goes high. If the enable signal transitions too close to the rising edge of the clock (while the clock is low), it could cause a **clipped clock pulse** or a **glitch**.
*   **Timing Requirement:** The active-high clock gating setup check requires that the gating signal changes before the clock goes high. The timing tool validates that the gating signal changes before the next rising edge of the clock.

#### 2. Hold Check (Preventing Clipping/Glitches on the Falling Edge)

*   **Requirement:** The clock-gating hold check ensures that the control data signal **remains stable while the clock is active (high)**.
*   **Mechanism:** The gating signal must change to its final (low/disabled) state only **after the clock has fully transitioned low**. If the enable signal changes too soon (while the clock is still high), it can cause a **glitch at the trailing edge** of the clock pulse or a **clipped clock pulse**.
*   **Timing Requirement:** The active-high clock gating hold check requires that the gating signal changes only after the falling edge of the clock. The timing check is done against the trailing edge of the clock pin.

In summary, the transition of the enable signal must occur entirely within the inactive (low) phase of the clock pulse to guarantee the resulting gated clock is clean.

## Quiz Context
> [!QUESTION] Active-High Clock Gating Check
> **Question:** In a clock-gating check for an active-high gate (e.g., an AND gate where one input is the clock and the other is the enable), what is the fundamental requirement for the enable signal to prevent glitches on the gated clock?
>
> **Correct Answer:** The enable signal must be stable (not transition) during the time the clock input is high.
> *(Note: The user's original choice "stable when clock is low" is technically incorrect for an AND gate, as explained above.)*

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.