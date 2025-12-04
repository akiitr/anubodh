---
title: "Crosstalk Impact in Glitch and Delay Analysis"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note distinguishes between crosstalk glitch analysis (functional integrity on steady nets) and crosstalk delay analysis (timing impact on switching nets).

You have correctly identified the **key difference** between crosstalk glitch analysis and crosstalk delay analysis. This distinction is critical for robust design verification in nanometer technologies.

Here is a detailed breakdown of the two types of crosstalk analysis, their specific targets, and their consequences.

### 1. Crosstalk Glitch Analysis (Noise Effects)

Crosstalk glitch analysis (or noise analysis) focuses on ensuring the **functional integrity** or **static noise immunity** of a circuit.

| Feature | Description |
| :--- | :--- |
| **Victim Net State** | The victim net is **steady** (constant at a logic 1 or logic 0 voltage level). |
| **Aggressor Activity** | The aggressor net(s) switch(es). This switching activity unintentionally transfers charge through capacitive coupling (crosstalk) onto the steady victim net. |
| **Effect on Victim** | This coupling induces a temporary voltage spike, known as a **noise bump** or **glitch**, on the victim net. Glitches can be positive (rise glitch), negative (fall glitch), overshoot (above VDD), or undershoot (below GND). |
| **Goal of Analysis** | **Check for functional failure**. The analysis determines if the magnitude (height) and width of the glitch are large enough to be seen as an incorrect logic value by fanout cells, potentially causing a sequential element (like a flip-flop or latch) to capture the wrong data. |
| **Consequence of Failure** | If the glitch is latched by a flip-flop or propagated through combinational logic to a sequential cell, it can be **catastrophic to the functionality** of the design, leading to state machine corruption.

### 2. Crosstalk Delay Analysis (Timing Effects)

Crosstalk delay analysis (or delta delay analysis) focuses on measuring the change in the time required for a signal to propagate along a path, affecting timing closure (setup/hold constraints).

| Feature | Description |
| :--- | :--- |
| **Victim Net State** | The victim net is **switching** (undergoing a signal transition, e.g., rising from 0 to 1). |
| **Aggressor Activity** | The aggressor net(s) switch(es) concurrently (at the same time) as the victim net. |
| **Effect on Victim** | The capacitive coupling either **speeds up (negative crosstalk)** or **slows down (positive crosstalk)** the transition time of the victim net. |
| **Types of Effects** | **Positive Crosstalk (Slowdown/Max Delay):** Occurs if the aggressor switches in the **opposite direction** of the victim (e.g., Aggressor Rise, Victim Fall). This increases the effective capacitance, causing delay. This is critical for **setup checks**.<br><br>**Negative Crosstalk (Speedup/Min Delay):** Occurs if the aggressor switches in the **same direction** as the victim (e.g., Aggressor Rise, Victim Rise). This decreases the effective capacitance, reducing delay. This is critical for **hold checks**. |
| **Goal of Analysis** | **Calculate the change in timing speed-up or slow-down (delta delay)** and apply this correction to the total path delay. This determines if the timing path still meets the required setup and hold times. |
| **Consequence of Failure** | A delay violation can cause a **setup time failure (max-delay failure)** or a **hold time failure (min-delay failure)**. Crosstalk-induced delay faults can lead to parametric yield problems. |

### Summary of Context

Both types of analyses rely on accurate knowledge of the parasitic coupling capacitance and the **timing windows** (earliest and latest switching times) of the aggressor and victim nets to determine the worst-case scenario. If timing windows for an aggressor and victim do not overlap, crosstalk timing effects cannot occur.

| Analysis Type | Focus | Victim Activity | Consequence of Failure |
| :--- | :--- | :--- | :--- |
| **Glitch** (Noise) | Functional Failure | **Steady** (Logic 0 or 1) | Incorrect logic value captured. |
| **Delay** (Delta Delay) | Timing Failure | **Switching** (Transitioning) | Setup or hold time violation. |

## Quiz Context
> [!QUESTION] Crosstalk Analysis Types
> **Question:** What is the key difference between how crosstalk affects a timing path in a 'glitch analysis' versus a 'delay analysis'?
>
> **Correct Answer:** Glitch analysis checks for functional failure on a steady victim net, while delay analysis calculates the timing speed-up or slow-down on a switching victim net.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.
*   **Related:** [[crosstalk_delay_vs_noise]], [[reducing_si_pessimism_with_exclusion]]