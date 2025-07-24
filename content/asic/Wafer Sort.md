---
title: Wafer Sort
description: Explanation of Wafer Sort in ASIC Manufacturing.
date: 2025-07-24
tags: [ASIC, Manufacturing, Testing]
aliases: [Wafer Probe, Electrical Die Sort, EDS]
---

# Wafer Sort

## Simple Explanation (Gist)
Wafer sort is an electrical test performed on a silicon wafer after fabrication but before it is cut into individual chips (dies). It identifies and marks defective dies, ensuring that only good dies proceed to the more expensive [[Packaging]] and final test stages.

## Detailed Breakdown

*   **Context**: Wafer sort is a critical step in the [[Tape Out & Manufacturing|semiconductor manufacturing]] process, occurring after the wafer fabrication is complete but before the wafer is diced into individual chips. It is the first electrical test performed on the fabricated silicon.

*   **Purpose**: The primary goals of wafer sort are:
    1.  **Identify Defective Dies**: To detect functional and parametric defects in individual dies (chips) on the wafer.
    2.  **Improve Manufacturing Efficiency**: By identifying and marking bad dies early, it prevents them from undergoing costly subsequent steps like dicing, packaging, and final test.
    3.  **Provide Feedback to Fabrication**: Data collected during wafer sort can be used to monitor the manufacturing process, identify process variations, and provide feedback to the [[Foundry]] for process improvement.
    4.  **Binning**: To classify dies based on basic performance characteristics (e.g., speed, power) for early binning.

*   **How it Works**:
    1.  **Probe Card**: A specialized **probe card** is used, which has an array of microscopic needles (probes) that precisely align with the bond pads or test pads on each die of the wafer.
    2.  **Automated Test Equipment (ATE)**: The wafer is placed on a wafer prober, which moves the wafer under the probe card. The probe card is then lowered to make electrical contact with a single die (or a small group of dies).
    3.  **Test Pattern Application**: The [[ATE|Automatic Test Equipment]] applies a series of electrical test patterns (often derived from [[DFT|Design for Test]] structures like [[Scan Chains]]) to the die through the probes.
    4.  **Response Measurement**: The ATE measures the electrical responses from the die and compares them against expected values.
    5.  **Defect Marking**: If a die fails any of the tests, it is marked as defective. Traditionally, this was done with a small ink dot, but modern methods often involve storing the coordinates of the bad dies in a wafer map file.
    6.  **Repeat**: The process is repeated for every die on the wafer.

*   **Types of Tests Performed**:
    *   **Continuity/Open/Short Tests**: Basic checks for electrical connectivity.
    *   **Parametric Tests**: Measure basic electrical characteristics like leakage currents, threshold voltages, and resistance.
    *   **Functional Tests**: Apply test patterns to verify the basic functionality of the logic, often using scan tests.
    *   **Memory Tests**: For dies with embedded memory, specific memory tests are run.

*   **Key Considerations**:
    *   **Test Time**: Wafer sort can be time-consuming, especially for large wafers with many dies. Parallel testing (testing multiple dies simultaneously) is often employed.
    *   **Probe Card Design**: The probe card is a custom, high-precision component that is expensive and critical for accurate testing.
    *   **Test Coverage**: The test patterns used must provide sufficient [[Test Coverage]] to ensure that most defects are caught at this stage.

*   **Output**: The primary output is a **wafer map**, which is a digital record indicating the pass/fail status and sometimes the binning category for each die on the wafer. This map guides the subsequent dicing and packaging steps.

## Further Reading

*   [VLSI Test Principles and Architectures](https://www.amazon.com/VLSI-Test-Principles-Architectures-Wang/dp/0123706015)
*   [The Essential Guide to Semiconductors](https://www.amazon.com/Essential-Guide-Semiconductors-Jim-Turley/dp/013046404X)