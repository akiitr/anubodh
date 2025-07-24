---
title: report_clock_timing
description: report_clock_timing Command in PrimeTime STA
date: 2025-07-24
tags:
  - VLSI
  - STA
  - PrimeTime
  - Commands
aliases:
  - report_clock_timing
---

# report_clock_timing Command in PrimeTime STA

## Simple Explanation (Gist)
`report_clock_timing` is a [[PrimeTime]] command used in [[STA|Static Timing Analysis]] to generate detailed reports on the characteristics and propagation of clocks within the design, helping to verify clock tree integrity and identify potential clock-related timing issues.

## Detailed Breakdown

*   **Motivation**: Clocks are the most critical signals in synchronous digital designs, dictating the timing of all operations. Any issues with clock definition, propagation, or integrity can lead to widespread timing violations and functional failures. This command provides a comprehensive view of the clock network, essential for debugging and signoff.

*   **Concept**: The `report_clock_timing` command analyzes the clock network after [[CTS|Clock Tree Synthesis]] and provides detailed information about clock characteristics, including insertion delay, latency, skew, jitter, and uncertainty. It helps designers verify that the clock tree meets the specified timing requirements.

*   **Key Information Reported**: 
    *   **Clock Name**: The name of the clock being reported.
    *   **Source Latency**: The delay from the clock source (e.g., PLL, oscillator) to the clock definition point in the design.
    *   **Network Latency (Insertion Delay)**: The delay from the clock definition point to the clock pin of each sequential element (flip-flop or latch). This is also known as [[Insertion Delay]].
    *   **Total Latency**: Sum of source latency and network latency.
    *   **[[Clock Skew]]**: The difference in arrival times of the clock signal at different sequential elements. Reported as both local (between adjacent flip-flops) and global (across the entire clock domain) skew.
    *   **[[Clock Uncerainity | Clock Uncertainty]]**: The total variation in clock arrival times, including [[Clock Jitter|jitter]] (random variations) and phase error.
    *   **Clock Path Details**: Lists the cells and nets along the clock path, along with their individual delays.
    *   **Clock Gating Information**: Details about inserted [[Clock Gating|clock gating cells]] and their impact on clock propagation.
    *   **Clock Tree Balance**: Provides insights into how well the clock tree is balanced, indicating potential areas for optimization.

*   **Importance**: 
    *   **Clock Tree Verification**: Essential for verifying the quality and integrity of the clock tree after CTS.
    *   **Timing Debugging**: Helps pinpoint the source of clock-related timing violations (e.g., excessive skew, high insertion delay).
    *   **Signoff Requirement**: A critical report for clock domain signoff, ensuring that the clock network meets all performance and reliability targets.
    *   **Correlation**: Helps correlate pre-layout clock tree analysis with post-layout results.

*   **Usage**: 
    *   The command is typically run after loading the design, libraries, SDC constraints, and parasitic files in PrimeTime.
    *   It can be run with various options to filter the report by clock name, specific pins, or to control the level of detail.

*   **Relationship to Other Commands**: 
    *   Complements `report_timing` by providing detailed information about the clock signals that drive the timing paths.
    *   Issues identified by `report_clock_timing` often require modifications to the clock tree or SDC constraints related to clocks.

## Further Reading

*   [Synopsys PrimeTime User Guide](https://www.synopsys.com/content/dam/synopsys/implementation-and-signoff/signoff/primetime-ds.pdf) (Refer to the official documentation for detailed command syntax and options)
*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [VLSI STA Commands](https://www.vlsi-expert.com/2018/01/vlsi-sta-commands.html)