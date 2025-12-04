---
title: "Essential PrimeTime Variables"
date: 2025-12-03
tags: [asic, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** Disabling CRPR leaves pessimistic delays on common clock paths, and mastering core PrimeTime commands is essential for accurate STA and sign-off.

> [!QUESTION] What is the effect of setting the timing_remove_clock_reconvergence_pessimism variable to false in PrimeTime?
>
> **Correct Answer:** It will leave in the pessimistic delta delay on common clock paths that arises from OCV derating, potentially causing false violations.

### I. Effect of Disabling Clock Reconvergence Pessimism Removal (CRPR)

The correct interpretation is that setting the variable **`timing_remove_clock_reconvergence_pessimism`** to `false` disables the automatic correction mechanism designed to increase analysis accuracy.

1.  **Source of Pessimism:** Clock Reconvergence Pessimism (CRP) occurs when the launch clock path and the capture clock path share a common physical segment of the clock distribution network. When On-Chip Variation (OCV) derating is applied, STA performs a worst-case assumption: it simultaneously assumes that this single common path operates at its slowest delay (for the launch path) and its fastest delay (for the capture path). This assumption is inherently pessimistic because a single physical segment can only be at one PVT condition at any given time.
2.  **Effect of `false` Setting:** If the removal mechanism is disabled (`false`), this pessimistic delta delay is left in the timing calculation. The clock reconvergence pessimism is the difference between the earliest and latest arrival times calculated for the clock signal at the common point.
3.  **Consequence:** Leaving this pessimism results in a calculated slack value that is artificially **lower** (more negative) than the actual value, potentially causing **false timing violations**.

***

### II. Essential PrimeTime Variables and Commands

A PrimeTime engineer should be aware of critical commands and application variables related to configuration, constraint definition, timing analysis, and sign-off verification.

#### A. Core Timing Configuration and Analysis

| Variable/Command | Category | Purpose/Functionality |
| :--- | :--- | :--- |
| **`update_timing`** | Analysis Execution | Performs a full timing calculation, recomputing all timing information and preparing reports. |
| **`report_timing`** | Reporting/Debug | Displays detailed path information, including delays, slack, and path components. Supports extensive filtering and options like `-pba_mode`. |
| **`check_timing`** | Sanity Check | Performs essential design and constraint checks, verifying integrity like setup/hold checks, missing clocks (`no_clock`), or unconstrained endpoints. |
| **`set_timing_derate`** | Variation/OCV | Specifies derating factors (e.g., `-early` for short paths, `-late` for long paths) to model OCV effects on cell/net delays. |
| **`set_propagated_clock`**| Clock Modeling | Instructs the tool to compute latency by propagating actual delays along the clock network after clock tree synthesis. |
| **`timing_max_time_borrow`** | Latch/Exception | Limits the maximum time a path ending at a latch can borrow from the next cycle. |
| **`si_enable_analysis`** | SI Control | Enables PrimeTime SI crosstalk analysis capabilities (necessary for calculating delta delay and noise). |
| **`set_case_analysis`** | Logic Control | Sets a constant logic value (0 or 1) on a pin/port to limit signal propagation, disable paths, and accurately model operating modes. |

#### B. Constraint and Exception Definition

| Variable/Command | Purpose/Functionality |
| :--- | :--- |
| **`create_clock`** | Defines a primary clock signal, specifying its period and waveform. |
| **`create_generated_clock`**| Defines a clock generated from a master clock within the design (e.g., clock dividers). |
| **`set_clock_uncertainty`**| Specifies the timing variation (skew/jitter) of clock edges to tighten setup checks and loosen hold checks. |
| **`set_input_delay`**| Specifies the delay of external circuitry leading to a primary input port, relative to a clock edge. |
| **`set_output_delay`**| Specifies the required time for an output signal to be ready for capture by an external sequential element. |
| **`set_false_path`**| Declares timing paths that should be ignored from analysis because they are functionally impossible or asynchronous. |
| **`set_multicycle_path`**| Specifies that a path is designed to take more than one clock cycle for data propagation. |
| **`set_max_transition`**| Specifies the maximum allowable transition time (slew) limit for nets or pins (a Design Rule Constraint - DRC). |
| **`set_max_capacitance`**| Specifies the maximum capacitance limit allowable on a net or pin (a DRC). |

#### C. Input/Output and Flow Support

| Variable/Command | Purpose/Functionality |
| :--- | :--- |
| **`read_parasitics`**| Reads detailed parasitic data (R, C, coupling C) often in SPEF/GPD format, essential for accurate post-layout delay calculation. |
| **`set_driving_cell`**| Models the drive strength of the external cell driving an input port to accurately calculate the slew and delay of the first internal gate. |
| **`set_load`**| Specifies the capacitive load on output ports to model the external load being driven by the design. |
| **`report_qor`**| Provides an overview of the design’s timing quality, including worst negative slack (WNS) and total negative slack (TNS). |
| **`report_constraint`**| Summarizes constraint violations, particularly reporting setup/hold slack and Design Rule Violations (DRVs). |
| **`report_analysis_coverage`**| Gauges the completeness of timing constraints by reporting tested versus untested endpoints/checks. |

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.
*   **Related:** [[timing_derates_and_ocv]]
