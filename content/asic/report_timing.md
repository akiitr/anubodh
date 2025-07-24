---
title: report_timing
description: report_timing Command in PrimeTime STA
date: 2025-07-24
tags:
  - VLSI
  - STA
  - PrimeTime
  - Timing Reports
aliases:
  - report_timing
---

# report_timing Command in PrimeTime STA

## Simple Explanation (Gist)
`report_timing` is a fundamental command in [[PrimeTime]] (Synopsys's [[STA|Static Timing Analysis]] tool) that generates detailed reports for specific timing paths in a design, showing their delay components and slack, which is crucial for identifying and debugging timing violations.

## Detailed Breakdown

*   **Motivation**: The primary goal of [[STA]] is to ensure that all signals propagate through the logic within their allocated time budgets. When timing violations occur (negative slack), `report_timing` is the go-to command to understand *why* a path is failing and *where* the delays are coming from, enabling targeted optimization.

*   **Concept**: The command traces a timing path from its start point (e.g., a clock pin of a flip-flop, a primary input) to its end point (e.g., a data pin of a flip-flop, a primary output). For each segment of the path, it reports the delay contributed by the logic cell and the interconnect wire, along with other relevant timing information.

*   **Key Information Reported**: 
    1.  **Path Summary**: 
        *   **Startpoint**: The launching flip-flop or primary input.
        *   **Endpoint**: The capturing flip-flop or primary output.
        *   **Path Group**: The clock domain or group to which the path belongs.
        *   **Path Type**: Indicates if it's a setup, hold, recovery, or removal path.
    2.  **Timing Details (for each stage along the path)**: 
        *   **Cell Name**: The name of the logic gate or sequential element.
        *   **Pin Name**: The specific input or output pin of the cell.
        *   **Arc Delay**: The delay through the cell from the input pin to the output pin.
        *   **Net Delay**: The delay contributed by the interconnect wire connecting the cells.
        *   **Arrival Time**: The time at which the signal arrives at a particular point.
        *   **Required Time**: The time by which the signal must arrive at a particular point to meet timing requirements.
        *   **Slack**: The difference between the required time and the arrival time. A negative slack indicates a timing violation.
    3.  **Clock Information**: 
        *   Details about the launch clock and capture clock, including their periods, latencies, and uncertainties.
    4.  **Constraint Information**: 
        *   Shows the specific timing constraints (e.g., `set_input_delay`, `set_output_delay`, `set_multicycle_path`) that apply to the reported path.
    5.  **Delay Breakdown**: 
        *   Often provides a summary of total cell delay, total net delay, and total path delay.

*   **Importance**: 
    *   **Debugging Timing Violations**: The most frequently used command for debugging setup and hold violations. It provides the detailed information needed to identify the root cause of timing failures.
    *   **Timing Optimization**: Helps designers pinpoint the critical components (slow cells, long wires) that need optimization.
    *   **Verification**: Confirms that the design meets its performance specifications.
    *   **Signoff**: A key report for timing signoff, demonstrating that all critical paths are analyzed and meet timing.

*   **Usage**: 
    *   Can be used to report the worst paths (`-nworst`), specific paths (`-from`, `-to`, `-through`), or paths with specific slack ranges.
    *   Often used iteratively: run `report_qor` to get an overview, then `report_timing` for specific violating paths, and then `report_delay_calculation` for detailed delay breakdown.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [Synopsys PrimeTime User Guide](https://www.synopsys.com/content/dam/synopsys/implementation-and-signoff/signoff/primetime-ds.pdf)
*   [VLSI STA Commands](https://www.vlsi-expert.com/2018/01/vlsi-sta-commands.html)