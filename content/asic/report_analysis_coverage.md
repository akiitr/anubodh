---
title: report_analysis_coverage
description: report_analysis_coverage Command in PrimeTime STA
date: 2025-07-24
tags:
  - VLSI
  - STA
  - PrimeTime
  - Commands
aliases:
  - report_analysis_coverage
---

# report_analysis_coverage Command in PrimeTime STA

## Simple Explanation (Gist)
`report_analysis_coverage` is a [[PrimeTime]] command used in [[STA|Static Timing Analysis]] to assess how thoroughly the timing analysis has covered the design, identifying any unconstrained or partially constrained paths that might lead to inaccurate timing results.

## Detailed Breakdown

*   **Motivation**: For accurate and reliable timing signoff, it is crucial that all relevant timing paths in the design are properly constrained and analyzed. Unconstrained paths can hide critical timing violations, leading to functional failures or performance issues in silicon. This command helps designers ensure comprehensive analysis.

*   **Concept**: The `report_analysis_coverage` command provides a summary of the percentage of the design that is covered by timing analysis. It categorizes paths and objects based on whether they are fully constrained, partially constrained, or unconstrained, and highlights potential issues that need to be addressed.

*   **Key Information Reported**: 
    *   **Total Paths/Endpoints**: The total number of timing paths or endpoints in the design.
    *   **Constrained Paths/Endpoints**: The percentage and count of paths/endpoints that are fully constrained and analyzed.
    *   **Unconstrained Paths/Endpoints**: The percentage and count of paths/endpoints that are not constrained at all. These are critical and must be addressed.
    *   **Partially Constrained Paths/Endpoints**: Paths/endpoints that have some constraints but are not fully defined (e.g., missing input/output delays, missing clock definitions for some parts of the path).
    *   **Paths with Warnings/Errors**: Paths that encountered issues during analysis (e.g., clock propagation problems, library issues).
    *   **Clock Coverage**: Information about how well clocks are defined and propagated throughout the design.
    *   **Input/Output Delay Coverage**: How well input and output delays are specified for primary ports.
    *   **Timing Exception Coverage**: How well [[Timing Exceptions]] (like [[False Paths]] and [[Multicycle Paths]]) are applied and whether they are correctly defined.

*   **Importance**: 
    *   **Ensures Signoff Quality**: Helps ensure that the timing signoff is robust and that no critical paths are missed due to incomplete constraints.
    *   **Identifies Constraint Issues**: Pinpoints areas where the [[SDC|Synopsys Design Constraints]] need to be refined or corrected.
    *   **Reduces Risk**: Minimizes the risk of silicon failures due to unanalyzed timing paths.
    *   **Guides Debugging**: Provides a high-level overview that can guide designers to specific areas of the design or constraints that require attention.

*   **Usage**: 
    *   The command is typically run after loading the design, libraries, and SDC constraints in PrimeTime.
    *   It can be run with various options to control the level of detail in the report.

*   **Relationship to Other Commands**: 
    *   Often used in conjunction with `check_timing` to get a comprehensive view of the timing analysis quality.
    *   The issues identified by `report_analysis_coverage` often require modifications to the SDC constraints, which are then verified using commands like `report_constraint` and `report_timing`.

## Further Reading

*   [Synopsys PrimeTime User Guide](https://www.synopsys.com/content/dam/synopsys/implementation-and-signoff/signoff/primetime-ds.pdf) (Refer to the official documentation for detailed command syntax and options)
*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [VLSI STA Commands](https://www.vlsi-expert.com/2018/01/vlsi-sta-commands.html)