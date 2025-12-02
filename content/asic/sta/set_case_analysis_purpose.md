---
title: "set_case_analysis in SDC"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note explains the purpose of the `set_case_analysis` command in SDC/STA, which is to apply constant logic values to pins/ports to disable inactive timing paths for specific modes, unlike operating condition commands.

You are correct; your initial answer was incorrect because it confused the process of selecting operating corners with the process of defining the circuit's active logical state.

The **correct purpose** of `set_case_analysis` is to define the logical environment for STA.

### Why Your Answer Was Incorrect

Your answer described how a timing tool selects which delay value to use from the Standard Delay Format (SDF) file's triplet (minimum, typical, or maximum).

*   This selection of delays is controlled by the **operating conditions** set for the Static Timing Analysis (STA), using commands like `set_operating_conditions` or options within the `read_sdf` command (e.g., `-analysis_type on_chip_variation` or `-min_file`/`-max_file`).
*   The `set_case_analysis` command does **not** influence the PVT corner selection for the delay calculation itself.

### The True Purpose of `set_case_analysis`

The `set_case_analysis` command is used to specify a constant logic value (0 or 1) on a port or pin. This serves two critical functions:

1.  **Propagating Constants:** It forces the specified pin or port to propagate a logic constant forward through the design. This constant propagation can even extend through asynchronous preset or clear pins of sequential elements.
2.  **Disabling False Paths/Modes:** The primary benefit is that setting a constant value allows the timing analyzer to **disable timing arcs** that are functionally impossible or irrelevant in a specific mode of operation. This reduces the design space and prevents reporting of irrelevant paths.

#### Common Applications:

*   **Mode Analysis:** If a chip has DFT (Design-for-Test) logic, the test pin might be set to logic $0$ in normal functional mode. Using `set_case_analysis 0 TEST` causes the timing tool to disable paths related to the test logic (e.g., scan chains), allowing the tool to focus on the real timing-critical functional paths.
*   **Clock Selection:** If a multiplexer selects between different clocks (e.g., PLLdiv8 vs. PLLdiv16), setting the multiplexer select pin via `set_case_analysis` ensures that only one clock is analyzed, blocking the path for the other clock and reducing runtime.
*   **Conditional Timing:** Case analysis can also be used to enable the correct conditional timing arc within a cell if the cell library contains **state-dependent models** defined with `sdf_cond`. For instance, setting an input pin `B` to $0$ might select the non-inverting timing arc for a conditional cell.

This command is one of four common commands (along with `set_false_path`, `set_disable_timing`, and `set_multicycle_path`) used to refine the STA analysis space.

## Quiz Context
> [!QUESTION] Purpose of set_case_analysis
> **Question:** What is the purpose of specifying a set_case_analysis constraint in an SDC file?
>
> **Incorrect Answer:** To select which case (min, typ, max) from an SDF file should be used for back-annotation.
> **Correct Answer:** To apply a constant logic value (0 or 1) to a specific pin or port, which disables timing paths that are not active in a particular mode of operation.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.