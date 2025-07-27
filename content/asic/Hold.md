---
title: Hold Time
description: Explanation of Hold Time in Static Timing Analysis (STA).
date: 2025-07-24
tags: [ASIC, STA, Timing]
aliases: [Hold, Hold Time]
---

# Hold Time

## Simple Explanation (Gist)
Hold time is the minimum amount of time that the data input to a sequential element (like a flip-flop) must be stable *after* the active clock edge, to ensure that the data is reliably captured. If data changes too soon after the clock edge, a hold violation occurs.

## Detailed Breakdown

*   **Concept**: For a flip-flop to reliably capture data, its data input (D) must remain stable for a certain period *after* the clock edge. This period is called the hold time. It's a characteristic of the flip-flop itself, determined by its internal gate delays.

*   **Hold Time Requirement**: `T_data_stable_after_clock_edge >= T_hold_ff`
    *   `T_hold_ff`: The hold time requirement of the flip-flop.

*   **Hold Path**: A hold path is typically a short path from a launching flip-flop to a capturing flip-flop. Hold violations occur when the data arrives too *early* at the capturing flip-flop, and then changes too *soon* after the clock edge, violating the hold time requirement.

*   **Hold Check Equation**: For a path from a launching flip-flop (FF1) to a capturing flip-flop (FF2):
    `T_clk_launch + T_clk_to_q_FF1 + T_comb_delay >= T_clk_capture + T_hold_FF2`

    Where:
    *   `T_clk_launch`: Clock arrival time at FF1.
    *   `T_clk_to_q_FF1`: Clock-to-Q delay of FF1.
    *   `T_comb_delay`: Combinational logic delay between FF1 and FF2.
    *   `T_clk_capture`: Clock arrival time at FF2.
    *   `T_hold_FF2`: Hold time requirement of FF2.

    The term `T_clk_launch + T_clk_to_q_FF1 + T_comb_delay` represents the data arrival time at FF2.
    The term `T_clk_capture + T_hold_FF2` represents the data required time at FF2.

    For a hold check, we want the data to arrive *after* the required time. So, `Data Arrival Time >= Data Required Time`.

*   **Hold Slack**: `Hold Slack = Data Arrival Time - Data Required Time`
    *   A positive slack means the hold requirement is met.
    *   A negative slack indicates a hold violation.

*   **Why Hold is Independent of Clock Period**: Hold time is a minimum stability requirement *after* the clock edge. It only depends on the relative arrival times of data and clock at the capturing flip-flop, and the internal characteristics of the flip-flop. It does not depend on how long the clock period is, as long as the clock is fast enough to trigger the flip-flop.

*   **Conditions for Hold Violations**: Hold violations are typically checked at the *fastest* process corner (e.g., Fast-Fast, 0V, 125°C) because delays are minimal, making data arrive too quickly.

*   **Fixing Hold Violations**: Hold violations are generally harder to fix than setup violations because they are not dependent on the clock period and often require adding delay to the data path. Common techniques include:
    1.  **Buffer Insertion**: Adding non-inverting buffers or inverters into the data path to increase combinational delay.
    2.  **Cell Sizing**: Downsizing cells (using weaker drive strength cells) in the data path to increase their propagation delay.
    3.  **Wire Lengthening**: Intentionally lengthening wires in the data path (less common and generally avoided).
    4.  **Clock Skew Adjustment**: Increasing the clock skew (making the capturing clock arrive later relative to the launching clock) can help, but this can worsen setup violations.
    5.  **Hold-Fixing Cells**: Some standard cell libraries provide specific cells designed to add minimal delay for hold fixing.

*   **Importance**: Hold violations are critical because they can lead to functional failures that are difficult to debug, as they are often asynchronous to the clock period and can manifest inconsistently.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0470095467)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Setup and Hold Time in VLSI](https://www.vlsi-expert.com/2018/01/setup-and-hold-time-in-vlsi.html)