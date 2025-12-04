---
title: "PLL Modeling for Timing Analysis in PrimeTime"
date: 2025-12-03
tags: [asic, STA, tutorial]
aliases: []
draft: false
---
**One-Line Summary:** PrimeTime models PLLs for timing analysis by defining generated clocks with specific feedback and output options to perform phase shift correction and eliminate clock tree delay.

> [!QUESTION] If a design uses a PLL (Phase-Locked Loop) to eliminate clock tree delay, how does PrimeTime model this for timing analysis?
>
> **Correct Answer:** By using the create_generated_clock command with -pll_feedback and -pll_output options to model the phase shift correction.

The PLL is a critical component in high-speed digital designs, often used to generate low-jitter, high-frequency clocks and **to eliminate clock tree delay** (or clock insertion delay) through phase alignment.

Your chosen answer is correct and identifies the precise method PrimeTime uses to model the PLL structure and its phase-shifting effects for accurate Static Timing Analysis.

### I. Modeling the PLL for Timing Analysis

PrimeTime supports the analysis of Phase-Locked Loop (PLL) cells. The method relies on defining the PLL output clock as a **generated clock** and providing specific options that instruct the tool to perform **phase shift correction**.

The PLL circuit aims to make the phase of the clock at the **feedback pin** the same as the phase at the **reference clock pin**. PrimeTime uses the generated clock definition to model this phase alignment and clock multiplication/division:

*   **Command:** `create_generated_clock` is used to define the PLL output clock.
*   **`-pll_feedback`:** This option indicates which PLL feedback pin is used for the clock's **phase shift correction**.
*   **`-pll_output`:** This option specifies the PLL clock output pin that propagates the clock signal to the feedback pin.

Once this setup is provided, PrimeTime automatically **computes the timing of the feedback path and applies it as a phase correction on the PLL cell** during a timing update. This mechanism handles multiple PLLs and PLLs with multiple outputs.

### II. PLL Clock Characteristics and Setup

The PLL is considered the clock source and is typically defined first, often fed by a low-frequency external clock (reference clock) to generate a higher-frequency, low-jitter output clock.

**1. Clock Definition and Attributes:**

The PLL analysis requires specific pin identification in the library cell and related constraints in the SDC:

| Component | SDC Constraint/Library Attribute | Purpose |
| :--- | :--- | :--- |
| **PLL Output Clock** | Defined using `create_generated_clock` | Establishes the new clock derived from the reference. |
| **PLL Pins** | Library attributes like `is_pll_reference_pin`, `is_pll_output_pin`, and `is_pll_feedback_pin` | Used to perform error checking during generated clock definition. |
| **Feedback Adjustment** | `create_generated_clock` with `-pll_feedback` and `-pll_output` | Enables PrimeTime to compute phase alignment based on feedback path delay. |

**2. Handling Skew and Delay:**

*   For the adjustment to occur correctly, the PLL output clock and the reference clock arriving at the PLL reference clock pin must be set as **propagated clocks**.
*   The PLL drift and jitter characteristics of the phase-corrected output clock are specified using the **set_clock_latency** command with the **`-pll_shift`** option for the PLL output clock, which indicates that the delay specified is added to the base early or late latency.
*   PLL drift and jitter can be specified using both the **`-pll_shift` and `-dynamic`** options.

**3. CRPR Consideration for PLL Paths:**

When a path is launched and captured by clocks originating from different outputs of the same PLL (e.g., OUTCLK1 and OUTCLK2), PrimeTime assumes all output clocks have the same phase. Therefore, **PrimeTime removes the clock reconvergence pessimism (CRPR)** up to the outputs of the PLL, even though the last physical common pin is the reference pin of the PLL. This ensures an accurate analysis because the output clocks of the PLL must be in phase.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.
