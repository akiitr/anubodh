---
title: "check_timing vs report_constraint in PrimeTime"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note clarifies the distinction between `check_timing` (verifies constraint setup/completeness) and `report_constraint` (summarizes analysis results/violations) in Synopsys PrimeTime.

This scenario perfectly illustrates the functional difference between two key Synopsys PrimeTime (PT) commands: `check_timing` and `report_constraint`.

Your confusion is understandable because both commands deal with constraints and report on the "health" of the design. However, they serve distinct purposes in the Static Timing Analysis (STA) flow: one validates the *completeness* and *setup* of the constraints, while the other reports the *results* of the analysis based on those constraints.

Here is a breakdown of why your answer (`report_constraint`) was incorrect and why the correct answer (`check_timing`) is the essential command for constraint verification and setup health.

### 1. The Purpose of `check_timing` (Constraint Health/Completeness)

The primary role of the `check_timing` command is to **validate that the timing environment is fully and correctly defined**, thereby ensuring the STA results are meaningful.

*   **Undefined Constraints:** `check_timing` checks for constraint problems such as **undefined clocking**, **undefined input arrival times**, and **undefined output constraints**.
*   **Completeness Checks:** Running `check_timing` is **crucial to identify design or constraint issues** beyond simple path timing. It checks for issues like:
    *   **Missing Clocks (No Clock):** It specifically checks for `no_clock` (register clock pins with no clock).
    *   **Unconstrained Paths:** It reports **unconstrained endpoints** (endpoints not constrained for maximum delay/setup) and **no input_delay**.
    *   **Structural Issues:** It also checks for issues that could mask real violations, such as **combinational feedback loops** (`loops`).
*   **Recommendation:** The command is **recommended whenever you apply new constraints** (like clock definitions, I/O delays, or timing exceptions) to catch overlooked violations caused by setup problems.

Therefore, for the specific task of checking the overall completeness of the timing constraints, such as identifying **unconstrained paths** or **clocks without a period**, `check_timing` is the **essential command**.

### 2. The Purpose of `report_constraint` (Design Rule and Violation Summary)

The `report_constraint` command serves a different function: assessing the quality and results of the analysis *after* a timing update has been performed.

*   **Design Rule Checks (DRC):** `report_constraint` is primarily used to check for Design Rule Constraints (DRCs) defined by the designer or technology library, such as `max_transition`, `max_capacitance`, `max_fanout`, and `min_pulse_width`.
*   **Violation Summary:** This command determines the **"overall health of the design"** specifically with regard to **setup and hold time violations**. It produces a summary report of constraint violations (including timing, area, and power constraints) and the amount by which they are violated.
*   **Lack of Detail:** Crucially, the timing report produced by the `report_constraint` command **does not include a full path timing report**; it only produces a summary report for all violating paths per endpoint. For detailed path debugging, you must use `report_timing`.

### 3. Summary of Difference

| Command | Primary Function | What it Checks For |
| :--- | :--- | :--- |
| **`check_timing`** | **Constraint Validation & Setup Integrity** | Missing constraints (`no_clock`, `no_input_delay`), unconstrained endpoints, generated clock problems, combinational loops. |
| **`report_constraint`** | **Result Summary & DRC Compliance** | Worst-case *actual violations* (negative slack), design rule compliance (`max_transition`, `max_capacitance`), and overall count/severity of violations. |

**Analogy:** If `check_timing` is like a mechanic checking that you remembered to put gas in the engine and install all four wheels before driving, `report_constraint` is like receiving a post-trip summary report showing how far you drove (slack met/violated) and whether your tire pressure limits (DRCs) were exceeded during the journey. You must run `check_timing` first to ensure the timing model is logically complete.

## Quiz Context
> [!QUESTION] check_timing vs report_constraint
> **Question:** Which PrimeTime command is essential for checking the overall health and completeness of the timing constraints, such as identifying unconstrained paths or clocks without a period?
>
> **Incorrect Answer:** report_constraint
> **Correct Answer:** check_timing

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.