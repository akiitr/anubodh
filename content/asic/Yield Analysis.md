---
title: Yield Analysis
description: Explanation of Yield Analysis in ASIC manufacturing.
date: 2025-07-24
tags: [ASIC, Manufacturing, Post-Silicon]
aliases: [Chip Yield, Manufacturing Yield]
---

# Yield Analysis

## Simple Explanation (Gist)
Yield analysis is the process of studying and improving the percentage of functional, defect-free chips (dies) produced from a silicon wafer. It's crucial for the economic viability of ASIC manufacturing, as higher yield means lower cost per chip.

## Detailed Breakdown

*   **Definition**: Yield in semiconductor manufacturing refers to the proportion of working devices (dies) out of the total number of dies on a wafer. It is typically expressed as a percentage:
    `Yield (%) = (Number of Good Dies / Total Number of Dies on Wafer) * 100`

*   **Importance**: Yield is a critical metric because:
    *   **Cost**: Each wafer costs a significant amount to process. A low yield means a high cost per good chip, making the product uncompetitive.
    *   **Profitability**: Higher yield directly translates to higher profitability for semiconductor companies.
    *   **Production Volume**: Affects the number of chips available for market demand.

*   **Stages of Yield Measurement**:
    1.  **Wafer Sort Yield**: Measured after [[Wafer Sort]] (electrical test on the wafer). This is the percentage of dies that pass the wafer-level tests.
    2.  **Final Test Yield**: Measured after [[Packaging]] and final electrical test. This accounts for dies that might have been damaged during packaging or failed more comprehensive tests.
    3.  **System-Level Yield**: In some cases, yield might be measured after integration into a larger system, accounting for system-level failures.

*   **Causes of Yield Loss**:
    Yield loss can be attributed to various factors, broadly categorized as:
    1.  **Random Defects**: Microscopic imperfections in the silicon or contamination during fabrication (e.g., particles, crystal defects, lithography errors). These are typically random and distributed across the wafer.
    2.  **Systematic Defects**: Design-related issues or process variations that consistently cause failures in specific patterns or locations (e.g., design rule violations, stress-induced failures, hot spots).
    3.  **Parametric Failures**: Chips that are functionally correct but fail to meet performance specifications (e.g., too slow, consume too much power) due to process variations.
    4.  **Handling/Assembly Damage**: Physical damage to dies during dicing, packaging, or handling.

*   **Yield Analysis Process**:
    1.  **Data Collection**: Gathering test results from [[Wafer Sort]] and final test, including wafer maps (indicating pass/fail status and location of dies).
    2.  **Defect Localization**: Using advanced diagnostic tools and techniques (e.g., [[Failure Analysis | Failure Analysis]], electrical fault isolation) to pinpoint the exact location and nature of defects on failing dies.
    3.  **Root Cause Identification**: Analyzing the defect data to identify the underlying causes of yield loss (e.g., specific process steps, design weaknesses, equipment issues).
    4.  **Yield Improvement**: Implementing corrective actions based on the root cause analysis. This can involve:
        *   **Process Optimization**: Adjusting manufacturing parameters.
        *   **Design for Manufacturability (DFM)**: Modifying the design to make it more robust against process variations.
        *   **Test Program Optimization**: Refining test patterns to better screen out defective parts.
        *   **Equipment Maintenance**: Addressing issues with fabrication equipment.

*   **Tools and Techniques**:
    *   **Statistical Process Control (SPC)**: Monitoring manufacturing processes to detect deviations.
    *   **Design for Yield (DFY)**: Design practices aimed at improving yield.
    *   **Yield Management Systems (YMS)**: Software platforms for collecting, analyzing, and reporting yield data.
    *   **[[Shmoo Plots]]**: Used to characterize performance margins and identify parametric yield issues.

## Further Reading

*   [The Essential Guide to Semiconductors](https://www.amazon.com/Essential-Guide-Semiconductors-Jim-Turley/dp/013046404X)
*   [VLSI Test Principles and Architectures](https://www.amazon.com/VLSI-Test-Principles-Architectures-Wang/dp/0123706015)