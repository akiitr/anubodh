---
title: "Hold Checks at Slow Corners and PVT Inversion"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note explains why hold checks are required at Worst-Case Slow (WCS) corners in addition to Best-Case Fast (BCF), focusing on On-Chip Variation (OCV) and Temperature Inversion in nanometer designs.

That is a good question that highlights how multiple corners are essential for robust verification, even when the analysis type (hold check) usually defaults to one extreme.

While the hold check is generally toughest to meet at the **Best-Case Fast (BCF) corner** (where cell and net delays are minimal, leading to the fastest data arrival), your premise touches on the real motivation for running analysis across many corners: dealing with **variation**.

Here is why a design corner that involves a worst-case condition (WCS) might be checked for hold, either explicitly or as part of a multi-corner strategy:

### 1. Robustness Through Multi-Corner/Multi-Mode (MMMC) Analysis

Static Timing Analysis (STA) is typically performed at specific Process, Voltage, and Temperature (PVT) operating conditions. To ensure robust design, timing is validated at the extreme corners of the manufacturing process and environment.

*   **Default Timing:** For standard flip-flop hold checks, the absolute worst-case scenario occurs at the BCF corner (Fast Process, High Voltage, Low Temperature).
*   **The Need for Other Corners:** Certain corner combinations are crucial for checking specialized timing issues that only appear when components are slow or mismatched.
    *   Specific corners, such as **F F F F F** (Fast device/Fast interconnect/Fast environment) are important for checking **race conditions and hold time constraints**.
    *   However, corners like **S F T F F** (Slow nMOS, Fast pMOS) and **F S T F F** (Fast nMOS, Slow pMOS) are necessary to check **ratioed circuits** and **races** where the relative strengths and speeds of different transistors (nMOS vs. pMOS) or interconnect are important. These corners test the integrity of non-standard cell logic or sequential elements under specific combinations of process variation, which can induce hold violations or functional ratio problems that don't appear at the absolute BCF extreme.

### 2. The OCV Mechanism vs. The Path Speed

Your chosen answer describes the core mechanism of **On-Chip Variation (OCV) analysis**. OCV is designed to model this localized variation *within a single die*.

When performing a **Hold Check with OCV**:

1.  **Launch Path:** OCV dictates that the data path and launch clock path must be analyzed at their **minimum possible delay** (earliest arrival).
2.  **Capture Path:** The capture clock path must be analyzed at its **maximum possible delay** (latest arrival).

Even if the overall analysis is based on the **Worst-Case Slow (WCS) corner**, OCV allows the tool to apply **derating factors** to simulate locally fast paths for the hold check:

*   If the timing verification is run at the WCS PVT condition, derating is applied to the paths that are intended to be fast (the launch clock and data paths). The slow corner is used as the base, and those paths are artificially made faster (e.g., sped up by $10\%$ with derate factors) to ensure robustness against local variations.

### 3. Temperature Inversion Effect

In advanced technology nodes (typically below 65nm), the traditional assumption that "Low Temperature = Fast Delay" no longer holds true for all cells. This phenomenon is called **Temperature Inversion**.

*   **Mechanism:** At low voltages in deep sub-micron nodes, the threshold voltage ($V_{th}$) increases significantly at low temperatures. This increase in $V_{th}$ can overpower the mobility gain that usually makes cold transistors faster.
*   **Result:** Some cells may actually be **faster at high temperatures** (normally the "slow" condition) or **slower at low temperatures** (normally the "fast" condition).
*   **Impact on Hold:** Because of this inversion, the "fastest" path delay might not occur at the traditional BCF (Low Temp) corner. A hold violation might appear at the High Temperature (WCS) corner because specific cells speed up unexpectedly, or because the clock tree slows down differently than the data path due to mixed cell types. This necessitates checking hold at the WCS corner to catch these inversion-induced races.

Therefore, running hold checks at a base WCS corner (with appropriate derating factors applied) is part of ensuring that the design is robust against the full range of PVT variations across the die, verifying specialized circuit requirements, even though the *worst-case minimum timing path* is expected at BCF.

## Quiz Context
> [!QUESTION] Hold Checks at WCS Corner
> **Question:** Why might a hold check be performed at a worst-case slow (WCS) corner in addition to the typical best-case fast (BCF) corner?
>
> **Correct Answer:** To catch scenarios where a slow-corner data path is captured by a fast-corner clock path due to on-chip variation, creating a 'local' fast-path-to-slow-path hold violation.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.
*   **Related:** [[timing_derates_and_ocv]]