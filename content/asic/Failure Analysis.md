---
title: Failure Analysis
description: Explanation of Failure Analysis (FA) in VLSI.
date: 2025-07-24
tags: [ASIC, Post-Silicon, Reliability]
aliases: [FA, Failure Analysis]
---

# Failure Analysis (FA)

## Simple Explanation (Gist)
Failure Analysis (FA) in VLSI is the process of investigating and determining the root cause of a chip or system malfunction, whether it occurs during manufacturing, testing, or in the field.

## Detailed Breakdown

*   **Motivation**: Despite rigorous design, verification, and testing, some chips may still fail. FA is crucial for:
    *   **Yield Improvement**: Identifying manufacturing defects to improve [[Yield Analysis|yield]].
    *   **Design Debugging**: Pinpointing design flaws that manifest only in silicon.
    *   **Reliability Improvement**: Understanding failure mechanisms to enhance product reliability.
    *   **Customer Returns**: Diagnosing issues with chips returned from customers.

*   **FA Process Flow**: FA typically involves a systematic, multi-step approach:
    1.  **Non-Destructive Analysis**: Initial steps that do not alter the sample.
        *   **Electrical Characterization**: Replicating the failure on a test bench, measuring electrical parameters (voltage, current, timing), and isolating the faulty pin or block.
        *   **X-ray Inspection**: Detecting internal structural defects like voids, cracks, or misaligned bonds without damaging the package.
        *   **Scanning Acoustic Microscopy (SAM)**: Identifying delamination, cracks, and voids within the package or at interfaces.
        *   **Thermal Imaging**: Locating hot spots or abnormal thermal behavior.
    2.  **Destructive Analysis**: Steps that involve physically altering the sample to expose the area of interest.
        *   **Decapsulation**: Removing the chip package to expose the bare die, usually through chemical etching or mechanical grinding.
        *   **Delayering/Polishing**: Removing layers of metal and dielectric material one by one to expose underlying structures, often combined with imaging.
        *   **Cross-Sectioning**: Cutting the chip and polishing the cross-section to view internal structures and interfaces.
    3.  **Fault Localization**: Pinpointing the exact physical location of the defect on the die.
        *   **Emission Microscopy (EMMI)**: Detecting light emitted from defective areas (e.g., hot electrons, leakage current).
        *   **Laser Scanning Microscopy (LSM)**: Using lasers to induce or detect changes in electrical properties, such as Light-Induced Voltage Alteration (LIVA) or Optical Beam Induced Current (OBIC).
        *   **Scanning Electron Microscopy (SEM)**: Providing high-resolution images of the chip surface to identify physical defects like shorts, opens, or material anomalies.
        *   **Focused Ion Beam (FIB)**: Used for precise material removal (milling) or deposition, enabling cross-sectioning of specific features or creating probing points for electrical measurements.
    4.  **Root Cause Identification**: Analyzing the collected data to determine the fundamental reason for the failure (e.g., manufacturing defect, design error, material issue, stress-induced failure).
    5.  **Corrective Action**: Based on the root cause, recommending and implementing corrective actions in design, manufacturing, or testing processes.

*   **Common Failure Mechanisms**: 
    *   **Manufacturing Defects**: Shorts, opens, contamination, lithography errors, etching issues.
    *   **Design Errors**: Timing violations, functional bugs, power integrity issues, ESD weaknesses.
    *   **Reliability Issues**: [[Electromigration]], Hot Carrier Injection (HCI), Bias Temperature Instability (BTI), Time Dependent Dielectric Breakdown (TDDB).
    *   **Package-Related Issues**: Wire bond breaks, delamination, solder joint failures.

## Further Reading

*   [Semiconductor Failure Analysis on Wikipedia](https://en.wikipedia.org/wiki/Semiconductor_failure_analysis)
*   [Microelectronics Failure Analysis: From Concepts to Case Studies](https://www.amazon.com/Microelectronics-Failure-Analysis-Concepts-Studies/dp/047050092X)
*   [VLSI Test Principles and Architectures](https://www.amazon.com/VLSI-Test-Principles-Architectures-Wang/dp/0123706015)