---
title: NLDM
description: Non-Linear Delay Model (NLDM) in VLSI Static Timing Analysis (STA)
date: 2025-07-24
tags:
  - VLSI
  - STA
  - Delay Models
aliases:
  - NLDM
  - Non-Linear Delay Model
---

# Non-Linear Delay Model (NLDM) in VLSI Static Timing Analysis (STA)

## Simple Explanation (Gist)
NLDM (Non-Linear Delay Model) is a cell delay modeling technique used in [[STA|Static Timing Analysis]] that accurately represents the delay of a logic gate as a non-linear function of its input transition time and output load capacitance.

## Detailed Breakdown

*   **Motivation**: In older, larger technology nodes, gate delays could be approximated as a linear function of output load. However, as technology nodes shrink, the non-linear effects of input transition time (slew) and output load capacitance become significant. A simple linear model is no longer accurate enough for precise timing analysis.

*   **Concept**: NLDM addresses this by providing a more accurate representation of cell delays. Instead of a single delay value, NLDM uses a two-dimensional lookup table (or a set of tables) for each input-to-output pin pair of a standard cell. These tables are indexed by:
    1.  **Input Transition Time (Input Slew)**: The time it takes for the input signal to transition from one logic state to another (e.g., 10% to 90% of Vdd).
    2.  **Output Load Capacitance**: The total capacitance seen by the output of the cell, including the input capacitance of the fan-out gates and the interconnect capacitance.

*   **How it Works**: 
    *   **Characterization**: During standard cell library characterization, each cell is simulated extensively across a range of input transition times and output load capacitances. The resulting delays and output transition times are then stored in the NLDM lookup tables within the [[Timing Library]] (`.lib`) file.
    *   **Interpolation**: During [[STA|Static Timing Analysis]], when the tool needs to calculate the delay of a specific cell, it looks up the appropriate values in the NLDM table based on the actual input transition time and output load capacitance. If the exact values are not present, the tool uses interpolation to derive the delay.

*   **Information Stored in NLDM Tables**: 
    *   **Cell Delay**: The propagation delay from an input pin to an output pin.
    *   **Output Transition Time (Output Slew)**: The transition time of the signal at the output pin of the cell.

*   **Advantages**: 
    *   **High Accuracy**: Provides a much more accurate delay model compared to linear models, which is crucial for timing closure in advanced technology nodes.
    *   **Captures Non-Linear Effects**: Accounts for the non-linear relationship between delay, input slew, and output load.
    *   **Industry Standard**: Widely adopted and supported by all major EDA tools.

*   **Disadvantages/Limitations**: 
    *   **Large Library Size**: NLDM tables can be quite large, leading to larger library files and increased memory usage during STA.
    *   **Characterization Time**: Characterizing cells for NLDM requires extensive simulations, which can be time-consuming.
    *   **Still a Simplification**: While accurate, NLDM is still a simplification and does not capture all complex electrical effects (e.g., [[Crosstalk]], [[IR Drop]]). More advanced models like [[CCS | Composite Current Source (CCS)]] and [[ECSM | Effective Current Source Model (ECSM)]] address some of these limitations.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [VLSI Design and Test](https://www.amazon.com/VLSI-Design-Test-S-K-Kataria/dp/818527403X)
*   [Non-Linear Delay Model (NLDM) in STA](https://www.vlsi-expert.com/2018/01/non-linear-delay-model-nldm-in-sta.html)