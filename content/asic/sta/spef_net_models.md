---
title: "SPEF Net Models (Lumped C, R_NET, D_NET)"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note explains different net models used in SPEF files for post-layout Static Timing Analysis (STA), highlighting D_NET as the most detailed and Lumped C as the least detailed.

You are correct that the **Lumped C Model** is incorrect, and the **D_NET (Distributed Net)** model is the correct answer.

Here is a concise explanation of why the D_NET model provides the most detail and why the Lumped C Model is the least detailed:

### 1. The Purpose of D_NET (Distributed Net)

The D_NET model is designed to represent the physical reality of the routed interconnect with the highest fidelity.

*   **Individual Segment RC:** In the D_NET representation within a Standard Parasitic Exchange Format (SPEF) file, **each segment** of a net route has its **own resistance (R) and capacitance (C)**. This is the most accurate form of extraction, representing the resistance and capacitance of each segment (multiple R's and C's) of the routed netlist. This form is often limited to critical nets and clock trees due to the long extraction times required for a full design.
*   **Coupling Capacitances:** The D_NET construct is capable of describing **cross-coupling capacitances** between two nets. It can specify coupling capacitances between internal nodes of the net and nodes of adjacent nets.

### 2. The Limitation of the Lumped C Model

The **Lumped Capacitance Model** provides the least amount of detail, making your initial answer incorrect for the "most detailed" question.

*   **Single Capacitance:** The Lumped Capacitance Model simplifies the entire net down to only a **single capacitance** value for the whole net. It ignores all distributed resistance and segment details.
*   **Use Case:** This model is useful for quick approximations during initial phases, but it does not contain the detailed RC information required for accurate post-layout delay and signal integrity analysis.

### Summary of SPEF Net Models

The SPEF format supports several net models, ranging from least to most detailed:

| Model | Description | Detail Level |
| :--- | :--- | :--- |
| **Lumped C Model** | A single capacitance value for the entire net. | Least Detailed |
| **R_NET (Reduced Net)** | Uses a reduced RC network (like a pi model, with two C's and one R) and a single reduced R and C on the load pins. | Medium Detail |
| **D_NET (Distributed Net)** | Represents each net segment with its own R and C, including coupling capacitors to other nets. | Most Detailed |

The D_NET representation captures the complexity of the RC network necessary for advanced analysis, especially where net delays are significant compared to cell delays, such as in deep submicron designs.

## Quiz Context
> [!QUESTION] Most Detailed SPEF Net Model
> **Question:** In post-layout STA, which distributed net model in a SPEF file provides the most detailed information, including individual segment RC values and coupling capacitances?
>
> **Incorrect Answer:** Lumped C Model
> **Correct Answer:** D_NET (Distributed Net)

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.