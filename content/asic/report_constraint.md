---
title: report_constraint
description: report_constraint Command in PrimeTime STA
date: 2025-07-24
tags:
  - VLSI
  - STA
  - PrimeTime
  - Commands
aliases:
  - report_constraint
---

# report_constraint Command in PrimeTime STA

## Simple Explanation (Gist)
`report_constraint` is a [[PrimeTime]] command used in [[STA|Static Timing Analysis]] to display the [[SDC|Synopsys Design Constraints]] applied to the design, helping designers verify that the timing requirements are correctly and completely specified.

## Detailed Breakdown

*   **Motivation**: The accuracy and completeness of [[SDC|Synopsys Design Constraints]] are paramount for successful timing closure. Incorrect or missing constraints can lead to inaccurate timing analysis, missed violations, or over-constraining the design, resulting in functional failures or suboptimal [[PPA|Power, Performance, and Area]]. This command allows designers to review the constraints as interpreted by the STA tool.

*   **Concept**: The `report_constraint` command reads the SDC file(s) and presents the constraints in a human-readable format. It shows how clocks are defined, input/output delays are specified, and various timing exceptions are applied, providing a clear picture of the timing intent.

*   **Key Information Reported**: 
    *   **Clock Definitions**: Details of all defined clocks, including their periods, waveforms, sources, and associated attributes (e.g., `create_clock`, `create_generated_clock`).
    *   **Input/Output Delays**: The specified delays for primary inputs and outputs relative to their respective clocks (e.g., `set_input_delay`, `set_output_delay`).
    *   **Timing Exceptions**: 
        *   **[[False Paths]]**: Paths that are logically or functionally not intended to be active, and thus should not be timed (e.g., `set_false_path`).
        *   **[[Multicycle Paths]]**: Paths that are allowed to take more than one clock cycle to propagate (e.g., `set_multicycle_path`).
        *   **Maximum/Minimum Delays**: Explicitly set maximum or minimum delay constraints on specific paths (e.g., `set_max_delay`, `set_min_delay`).
    *   **Clock Grouping**: How different clocks are grouped for analysis (e.g., `set_clock_groups`).
    *   **Case Analysis**: Any `set_case_analysis` commands used to fix specific signals to a constant value for analysis.
    *   **Driving Cell/Load**: Information about the driving cell and output load for primary ports.
    *   **Design Rules**: Any explicitly set design rules (e.g., `set_max_transition`, `set_max_capacitance`).

*   **Importance**: 
    *   **Constraint Verification**: Allows designers to verify that the SDC constraints are correctly interpreted by the tool and match the design intent.
    *   **Debugging**: Helps in debugging timing issues by confirming that the correct constraints are being applied to the relevant paths.
    *   **Signoff Requirement**: A crucial step in the timing signoff process to ensure that the design is constrained properly for manufacturing.
    *   **Documentation**: Provides a clear documentation of the timing constraints for the design.

*   **Usage**: 
    *   The command is typically run after loading the design, libraries, and SDC files in PrimeTime.
    *   It can be run with various options to filter the report by specific objects (e.g., clocks, ports, paths) or constraint types.

*   **Relationship to Other Commands**: 
    *   Often used in conjunction with `check_timing` to identify potential issues with the constraints themselves.
    *   The output of `report_constraint` directly influences the results of `report_timing` and `report_analysis_coverage`.

## Further Reading

*   [Synopsys PrimeTime User Guide](https://www.synopsys.com/content/dam/synopsys/implementation-and-signoff/signoff/primetime-ds.pdf) (Refer to the official documentation for detailed command syntax and options)
*   [Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)](https://www.amazon.com/Constraining-Designs-Synthesis-Timing-Analysis/dp/0387333817)
*   [VLSI STA Commands](https://www.vlsi-expert.com/2018/01/vlsi-sta-commands.html)