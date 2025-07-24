---
title: report_annotated_parasitics
description: report_annotated_parasitics Command in PrimeTime STA
date: 2025-07-24
tags:
  - VLSI
  - STA
  - PrimeTime
  - Commands
aliases:
  - report_annotated_parasitics
---

# report_annotated_parasitics Command in PrimeTime STA

## Simple Explanation (Gist)
`report_annotated_parasitics` is a [[PrimeTime]] command used in [[STA|Static Timing Analysis]] to report the status of parasitic annotation for nets in the design, showing which nets have had their resistance and capacitance values successfully loaded from parasitic extraction files.

## Detailed Breakdown

*   **Motivation**: Accurate parasitic information (resistance and capacitance of interconnects) is crucial for precise delay calculation in [[STA]]. If parasitics are not correctly annotated, the timing analysis will be inaccurate, potentially leading to timing violations in silicon or over-design. This command helps verify the integrity of the parasitic annotation process.

*   **Concept**: After parasitic extraction tools (like StarRC, Quantus, or Calibre xACT) generate parasitic files (e.g., [[SPEF|Standard Parasitic Exchange Format]]), these files are loaded into the [[STA]] tool. `report_annotated_parasitics` checks if the parasitic data from these files has been successfully applied (annotated) to the corresponding nets in the design database.

*   **Key Information Reported**: 
    *   **Total Nets**: The total number of nets in the design.
    *   **Annotated Nets**: The count and percentage of nets that have been successfully annotated with parasitic information.
    *   **Unannotated Nets**: The count and percentage of nets that *do not* have parasitic information. These are critical and must be investigated.
    *   **Partially Annotated Nets**: Nets that might have some parasitic information but are not fully annotated (e.g., only resistance or only capacitance, or incomplete data).
    *   **Source of Annotation**: Indicates whether the parasitics came from SPEF, SDF, or were estimated by [[WLM|Wire Load Models]].
    *   **Nets with Discrepancies**: Highlights nets where there might be a mismatch between the netlist and the parasitic file.

*   **Importance**: 
    *   **Ensures Timing Accuracy**: Guarantees that the delay calculations are based on realistic interconnect delays, leading to more accurate timing analysis.
    *   **Identifies Data Mismatches**: Helps pinpoint issues where the parasitic extraction output might not perfectly match the netlist, indicating potential problems in the physical design flow.
    *   **Reduces Risk**: Minimizes the risk of silicon failures due to inaccurate timing predictions caused by missing or incorrect parasitic data.
    *   **Signoff Requirement**: Often a critical check before final timing signoff to ensure the quality of the extracted parasitics.

*   **Usage**: 
    *   The command is typically run after loading the design, libraries, SDC constraints, and SPEF files in PrimeTime.
    *   It can be run with various options to control the level of detail in the report, such as reporting specific nets or only unannotated nets.

*   **Relationship to Other Commands**: 
    *   Complements `report_timing` by ensuring the underlying data for delay calculation is sound.
    *   Issues identified by this command often require debugging the parasitic extraction flow or the netlist generation process.

## Further Reading

*   [Synopsys PrimeTime User Guide](https://www.synopsys.com/content/dam/synopsys/implementation-and-signoff/signoff/primetime-ds.pdf) (Refer to the official documentation for detailed command syntax and options)
*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [VLSI STA Commands](https://www.vlsi-expert.com/2018/01/vlsi-sta-commands.html)