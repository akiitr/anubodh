---
title: Launch and Capture Path
description: Explanation of Launch and Capture Paths in Static Timing Analysis (STA).
date: 2025-07-24
tags: [ASIC, STA, Timing]
aliases: [Launch Path, Capture Path]
---

# Launch and Capture Path

## Simple Explanation (Gist)
In Static Timing Analysis (STA), the launch path refers to the clock path that activates the launching flip-flop, and the capture path refers to the clock path that activates the capturing flip-flop, both of which are crucial for determining the overall timing of a data transfer.

## Detailed Breakdown

*   **Concept**: Every data transfer between two sequential elements (e.g., flip-flops) in a synchronous digital circuit involves a launch event and a capture event. The timing of these events is governed by the clock signals arriving at the respective flip-flops. Understanding the launch and capture paths is fundamental to performing accurate [[STA|Static Timing Analysis]].

*   **Launch Path**: The launch path is the clock path from the clock source (e.g., PLL, clock pin) to the clock pin of the *launching* sequential element (e.g., flip-flop, latch). It determines when the data is effectively launched from the output of the launching flip-flop.
    *   **Components**: Clock source, clock buffers, clock inverters, clock gates, and the interconnects that deliver the clock signal to the launching flip-flop's clock pin.
    *   **Launch Clock Edge**: The specific clock edge (e.g., rising edge) that causes the data to propagate from the launching flip-flop.
    *   **Launch Clock Latency**: The total delay from the clock source to the clock pin of the launching flip-flop.

*   **Capture Path**: The capture path is the clock path from the clock source to the clock pin of the *capturing* sequential element. It determines when the capturing flip-flop is ready to sample the data arriving at its input.
    *   **Components**: Similar to the launch path, it includes clock buffers, inverters, gates, and interconnects that deliver the clock signal to the capturing flip-flop's clock pin.
    *   **Capture Clock Edge**: The specific clock edge (e.g., rising edge, or the next rising edge for setup checks) that causes the data to be sampled by the capturing flip-flop.
    *   **Capture Clock Latency**: The total delay from the clock source to the clock pin of the capturing flip-flop.

*   **Relationship in Timing Analysis**: The difference in clock arrival times between the launch and capture paths (i.e., [[Clock Skew]]) is a critical factor in determining the available time for data to propagate through the combinational logic between the two flip-flops.

    *   **Setup Check**: For a setup check, the data launched by the *current* clock edge must arrive at the capturing flip-flop *before* the *next* clock edge. The timing window for setup is influenced by the launch clock latency and the capture clock latency.
        `Data Arrival Time (at capturing FF) <= Data Required Time (at capturing FF)`
        `T_launch_clock_latency + T_clk_to_q + T_comb_delay <= T_capture_clock_latency + T_period - T_setup`

    *   **Hold Check**: For a hold check, the data launched by the *current* clock edge must remain stable at the capturing flip-flop's input for a certain duration *after* the *current* clock edge. The timing window for hold is also influenced by the launch and capture clock latencies.
        `Data Arrival Time (at capturing FF) >= Data Required Time (at capturing FF)`
        `T_launch_clock_latency + T_clk_to_q + T_comb_delay >= T_capture_clock_latency + T_hold`

*   **Importance**: Accurate modeling of launch and capture paths, including their respective clock latencies and skews, is essential for reliable timing closure. Any inaccuracies can lead to optimistic or pessimistic timing analysis results, potentially causing functional failures in silicon or unnecessary design iterations.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0470095467)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Timing/dp/0471721426)
*   [Understanding Setup and Hold Time](https://www.eetimes.com/understanding-setup-and-hold-time/)