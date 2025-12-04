---
title: "Timing Derates and OCV"
date: 2025-12-04
tags: [asic, STA, ocv]
aliases: []
draft: false
---
**One-Line Summary:** A comprehensive guide to On-Chip Variation (OCV) methodologies (Standard, AOCV, POCV) and the application of timing derates to model PVT variations.

## On-Chip Variation (OCV) Derates and Methodologies

Timing analysis must account for inevitable manufacturing and environmental discrepancies across a chip, collectively known as **On-Chip Variation (OCV)**. These local PVT (Process, Voltage, Temperature) variations mean that seemingly identical transistors or wires may exhibit different speeds.

The goal of OCV analysis is to prevent silicon failure by incorporating these variations, typically by using **derating factors** to make path analysis intentionally more conservative.

### I. Core Concepts: Derating Factors and Application

A derating factor is a specified multiplier that adjusts calculated delays to model OCV effects.

*   **Min/Early Derate:** A factor less than 1.0 (e.g., 0.9) is applied to paths analyzed for minimum delay (shortest paths), making them appear faster. This is critical for **hold checks** and the **capture clock path** in setup checks.
*   **Max/Late Derate:** A factor greater than 1.0 (e.g., 1.1) is applied to paths analyzed for maximum delay (longest paths), making them appear slower. This is critical for **setup checks** and the **launch clock path/data path** in setup checks.

The `set_timing_derate` command is used in PrimeTime to apply these factors globally or selectively to nets, cells, clock paths, data paths, or cell timing checks. Applying derating implicitly switches the analysis mode to **On-Chip Variation mode**.

| Methodology | Timing Adjustment Basis | Primary Goal | Pessimism Management |
| :--- | :--- | :--- | :--- |
| **Standard OCV** | Uniform, fixed derating factor (flat derate) applied across the entire chip. | Ensure robust operation under worst-case local variations. | High pessimism due to constant scaling, especially where clock paths reconverge (CPP/CRPR required). |
| **Advanced OCV (AOCV)** | **Logic path depth** (number of stages) and **physical distance** spanned by the path. | Reduce pessimism by applying derates proportional to actual path sensitivity. | Reduces conservatism using path-specific metrics. |
| **Parametric OCV (POCV)** | Statistical distributions (mean and sigma) of delay, slew, and constraints for each cell instance. | Achieve high accuracy and exhaustively model process parameter variations. | Achieves significant pessimism reduction through statistical cancellation of independent (uncorrelated) variations. |

### II. Detailed OCV Methodology Types

#### 1. Standard OCV (On-Chip Variation Mode)

Standard OCV is a **deterministic** analysis model where a single set of maximum and minimum delays (often derived from WCS and BCF corners) applies to different path segments simultaneously to create a conservative timing picture.

*   **Usage:** Used universally to compensate for intra-die variations.
*   **Pessimism and Correction (CRPR):** Standard OCV leads to **Common Path Pessimism (CPP)** because portions of the clock network shared by the launch and capture paths are simultaneously scaled by both the early (minimum) and late (maximum) derate factors. This artificial conflict is resolved using **Clock Reconvergence Pessimism Removal (CRPR)**, which removes the calculated delay difference along the common segment.

#### 2. Advanced OCV (AOCV)

AOCV refines standard OCV by applying the derating factor as a function of specific path characteristics, providing less pessimistic results.

*   **Path Depth:** Paths with a greater **logic path depth** show reduced overall timing variation because random variations tend to statistically cancel out over a longer chain of gates.
*   **Physical Distance:** Paths covering a greater **physical distance** across the die typically accumulate more systematic variations, requiring higher derating.

AOCV requires derating tables read by the `read_ocvm` command, which are indexed by these path depth and distance metrics to calculate a path-specific derating factor.

#### 3. Parametric OCV (POCV) / Statistical Timing Analysis (SSTA)

POCV is Synopsys's implementation of **Statistical Static Timing Analysis (SSTA)**, addressing the limitations of deterministic corner analysis in modern designs.

*   **Mechanism:** POCV models delay and timing checks not as single worst-case numbers, but as **statistical distributions** defined by mean and standard deviation $(\sigma)$.
*   **Benefit (Statistical Cancellation):** This statistical approach allows independent local variations (intra-die device variations) affecting individual cells to be combined non-deterministically. This process results in a phenomenon called **statistical cancellation**, where the resulting path delay variation ($\sigma$ path) is smaller (proportional to $\sqrt{\Sigma \sigma^2}$) than the sum of the worst-case individual delays ($\Sigma \sigma$), dramatically reducing pessimism.
*   **Input Data:** POCV data is commonly supplied in Liberty Variation Format (LVF) libraries, which contain tables for parameters like delay sigma (`ocv_sigma_cell_rise`) based on input slew and output load.

> [!QUESTION]
> **Scenario:** Advanced On-Chip Variation (AOCV) improves upon standard OCV by making the derate factor dependent on what two parameters?
>
> **Incorrect Answer:** "Input transition time and output load capacitance."
>
> **Correct Answer:** "Logic path depth and physical distance."

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.
*   **Related:** [[mmmc_dmsa_smva_analysis]]
