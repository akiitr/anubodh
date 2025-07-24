---
title: report_exceptions
description: report_exceptions Command in PrimeTime STA
date: 2025-07-24
tags:
  - VLSI
  - STA
  - PrimeTime
  - Commands
aliases:
  - report_exceptions
---

# report_exceptions Command in PrimeTime STA

## Simple Explanation (Gist)
`report_exceptions` is a [[PrimeTime]] command used in [[STA|Static Timing Analysis]] to display a list of all timing exceptions (like false paths and multicycle paths) that have been applied to the design, helping designers verify their correct application and identify any unintended impacts.

## Detailed Breakdown

*   **Motivation**: Timing exceptions are crucial for accurate [[STA]] because they instruct the tool to ignore certain paths ([[False Paths]]) or to allow more clock cycles for others ([[Multicycle Paths]]). Incorrectly applied exceptions can lead to either overly pessimistic (and thus over-designed) or overly optimistic (and thus functionally failing) timing results. This command provides a clear overview of all such exceptions.

*   **Concept**: The `report_exceptions` command parses the [[SDC|Synopsys Design Constraints]] and presents a summary of all `set_false_path`, `set_multicycle_path`, `set_max_delay`, `set_min_delay`, and other exception commands. It shows the source and destination of the paths affected by these exceptions, along with the type of exception and its value.

*   **Key Information Reported**: 
    *   **Exception Type**: Indicates whether it's a false path, multicycle path, max/min delay exception, etc.
    *   **Source and Destination**: The start and end points of the paths to which the exception applies. This can be specific pins, cells, or entire clock domains.
    *   **Through Pins/Nets**: If the exception is defined to pass through specific pins or nets.
    *   **Value**: For multicycle paths, the number of cycles allowed; for max/min delay, the delay value.
    *   **Condition**: Any conditional logic associated with the exception.
    *   **Applied Status**: Whether the exception was successfully applied by the tool.

*   **Importance**: 
    *   **Verification of Intent**: Ensures that the timing exceptions defined in the SDC file are correctly interpreted and applied by the STA tool.
    *   **Debugging**: Helps in debugging timing issues by confirming that critical paths are either correctly ignored or given appropriate cycle allowances.
    *   **Avoidance of Over-Constraining/Under-Constraining**: Prevents designers from over-constraining the design (leading to unnecessary area/power) or under-constraining it (leading to functional failures).
    *   **Documentation**: Serves as a clear record of all timing exceptions applied to the design.

*   **Usage**: 
    *   The command is typically run after loading the design, libraries, and SDC files in PrimeTime.
    *   It can be run with various options to filter the report by exception type, source/destination, or specific objects.

*   **Relationship to Other Commands**: 
    *   Often used in conjunction with `report_timing` to understand why certain paths might not be reported as violating or why they have unexpected slack.
    *   Complements `report_constraint` by focusing specifically on the exceptions within the SDC.
    *   Issues identified by `report_exceptions` often require careful review and modification of the SDC file.

## Further Reading

*   [Synopsys PrimeTime User Guide](https://www.synopsys.com/content/dam/synopsys/implementation-and-signoff/signoff/primetime-ds.pdf) (Refer to the official documentation for detailed command syntax and options)
*   [Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)](https://www.amazon.com/Constraining-Designs-Synthesis-Timing-Analysis/dp/0387333817)
*   [VLSI STA Commands](https://www.vlsi-expert.com/2018/01/vlsi-sta-commands.html)