---
title: report_qor
description: report_qor Command in PrimeTime STA
date: 2025-07-24
tags:
  - VLSI
  - STA
  - PrimeTime
  - Timing Reports
aliases:
  - report_qor
---

# report_qor Command in PrimeTime STA

## Simple Explanation (Gist)
`report_qor` (Quality of Results) is a command in [[PrimeTime]] (Synopsys's [[STA|Static Timing Analysis]] tool) that provides a high-level summary of the design's overall timing, area, and power metrics, giving a quick overview of the design's health and how well it meets its targets.

## Detailed Breakdown

*   **Motivation**: Designers need a quick and concise way to assess the overall quality of their design at various stages of the flow. `report_qor` consolidates key metrics into a single report, making it easy to track progress, identify major issues, and compare different design iterations.

*   **Concept**: The command aggregates information from various analyses performed by PrimeTime (timing, power, area) and presents it in a summarized format. It typically focuses on the worst-case scenarios for each metric.

*   **Key Information Reported**: 
    1.  **Timing Summary**: 
        *   **Worst Negative Slack (WNS)**: The most critical timing violation (negative slack) in the design. A positive WNS indicates that all paths meet timing.
        *   **Total Negative Slack (TNS)**: The sum of all negative slacks in the design. Indicates the overall severity of timing violations.
        *   **Number of Violating Paths**: The count of timing paths that fail to meet their requirements.
        *   **Operating Frequency**: The maximum frequency at which the design can operate without timing violations.
        *   **Number of Setup/Hold Violations**: Specific counts for setup and hold time violations.
    2.  **Area Summary**: 
        *   **Total Cell Area**: The sum of the areas of all standard cells and macros used in the design.
        *   **Utilization**: The percentage of the available core area occupied by standard cells and macros.
    3.  **Power Summary**: 
        *   **Total Power**: The estimated total power consumption of the design, typically broken down into [[Dynamic Power]] and [[Static Power]].
        *   **Leakage Power**: The static power component.
        *   **Switching Power**: The dynamic power component.
    4.  **Design Rule Violations (DRV) Summary**: 
        *   Reports on violations of design rules like max transition, max capacitance, and max fanout.
    5.  **Clock Information**: 
        *   May include summary information about clock periods, latencies, and uncertainties.

*   **Importance**: 
    *   **Quick Health Check**: Provides an immediate snapshot of the design's status.
    *   **Progress Tracking**: Useful for monitoring the progress of timing closure and optimization efforts.
    *   **Decision Making**: Helps designers make informed decisions about design trade-offs (e.g., sacrificing some area for better performance).
    *   **Signoff**: Often a key report reviewed during timing signoff to confirm that all targets are met.

*   **Usage**: 
    *   Typically run at various stages of the physical design flow, especially after placement, CTS, and routing, to assess the impact of each step on the overall quality of results.
    *   Designers use this report to quickly identify if the design is on track to meet its PPA targets.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [Synopsys PrimeTime User Guide](https://www.synopsys.com/content/dam/synopsys/implementation-and-signoff/signoff/primetime-ds.pdf)
*   [VLSI STA Commands](https://www.vlsi-expert.com/2018/01/vlsi-sta-commands.html)