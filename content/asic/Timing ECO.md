---
title: Timing ECO
description: Explanation of Timing ECO in ASIC design.
date: 2025-07-24
tags: [ASIC, ECO, STA]
aliases: [Timing Engineering Change Order]
---

# Timing ECO

## Simple Explanation (Gist)
Timing ECO (Engineering Change Order) is a process in ASIC design used to fix timing violations (like [[Setup|setup]] or [[Hold Time|hold]] violations) that are discovered late in the design flow, typically after [[Physical Design]] or even after [[Tape Out & Manufacturing|tape-out]], without requiring a full re-synthesis or re-layout.

## Detailed Breakdown

*   **Purpose**: The primary goal of a timing ECO is to achieve timing closure efficiently. When timing violations are found during [[STA|Static Timing Analysis]] (especially at [[Sign Off|sign-off]]), a full design iteration (going back to [[Synthesis]] or [[RTL Design]]) can be very time-consuming and costly. Timing ECOs provide a faster, more localized way to fix these issues.

*   **When it's Performed**: Timing ECOs are typically performed after the initial physical design (placement and routing) is complete and timing analysis has identified violations. They are a critical part of the timing closure process.

*   **Types of Timing ECOs**:
    1.  **[[Manual ECO]]**: Changes are implemented manually by the designer using physical design tools. This requires deep understanding of the design and careful execution to avoid introducing new issues.
    2.  **[[Tool Assisted ECO]]**: Modern EDA tools (e.g., Synopsys PrimeTime ECO, Cadence Tempus ECO) have automated or semi-automated capabilities to generate and implement timing ECOs. These tools can analyze the timing violations and suggest or implement fixes.

*   **Common Fixing Techniques**:
    *   **[[Cell Sizing]]**: Changing the drive strength of logic cells (e.g., replacing a standard cell with a stronger or weaker version) to reduce delay or improve transition times.
    *   **[[Buffer Insertion]]**: Adding buffers or inverters to reduce net delays, improve signal integrity, or fix max transition/capacitance violations.
    *   **[[Clock Path ECO]]**: Adjusting clock tree buffers or inverters to fix clock skew issues or optimize clock latency.
    *   **[[Vt Swapping]]**: Replacing standard cells with equivalent cells that have different threshold voltages (Vt) to optimize for speed (low Vt for faster cells) or leakage power (high Vt for lower leakage).
    *   **[[Metal ECO | Wire Optimization]]**: Rerouting critical nets, widening wires, or adding vias to reduce interconnect resistance and capacitance.
    *   **[[Frequency Optimization]]**: Adjusting the clock frequency if the design cannot meet timing at the target frequency.
    *   **[[Common Path Optimization ]]
    *   [[Logic Cloning]]**: Duplicating logic to reduce fanout or create shorter paths.

*   **Impact on Design**:
    *   **Minimal Disruption**: Aims to make the smallest possible changes to the layout, often only modifying metal layers (a "metal-only ECO"). This saves time and cost by avoiding re-fabrication of lower layers.
    *   **Risk of New Violations**: Poorly executed ECOs can introduce new timing violations, DRC/LVS errors, or even functional bugs. Thorough verification after an ECO is crucial.
    *   **Area/Power Impact**: ECOs can sometimes lead to slight increases in area or power consumption due to the insertion of additional cells or routing.

*   **Verification after ECO**: After a timing ECO, the design must undergo rigorous verification, including:
    *   Incremental [[STA|Static Timing Analysis]] to confirm timing closure.
    *   Incremental [[Physical Verification]] (DRC, LVS) to ensure no new layout violations.
    *   [[Formal Verification]] (Equivalence Checking) to ensure functional correctness is maintained.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs-J-Bhasker/dp/0387719257)
*   [Engineering Change Order (ECO) in VLSI](https://www.synopsys.com/glossary/eco.html)