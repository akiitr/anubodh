---
title: "CCS vs NLDM Timing Models"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note explains the advantages of Composite Current Source (CCS) timing models over Non-Linear Delay Model (NLDM) models, particularly for nanometer designs, due to CCS's superior accuracy in handling resistive interconnects and complex non-linear circuit behaviors.

You have selected the **correct answer**. The use of **Composite Current Source (CCS)** timing models represents a significant advancement over the **Non-Linear Delay Model (NLDM)**, driven primarily by the challenges of **nanometer technologies**.

Here is a breakdown of the advantages and concepts:

### 1. The Limitation of NLDM in Nanometer Designs

The NLDM is the established method for modeling delay. It calculates cell delay based on a two-dimensional lookup table indexed by **input transition time (slew)** and **output load capacitance**.

*   **Inaccuracy with RC Interconnect:** NLDM assumes that the output loading is **purely capacitive**. In nanometer designs (especially 65nm and below), interconnect traces have significant resistance (RC parasitics), which accounts for a majority of the total delay and power dissipation. This makes NLDM's simplified assumption inaccurate.
*   **Non-Linear Waveforms:** When interconnect resistance is high, the resulting waveforms become highly non-linear. NLDM uses a simplified driver model (a linear voltage ramp in series with a resistor—a Thevenin model). This simplification is not accurate when the load includes resistance, leading to potential inaccuracies of 7% or more compared to SPICE.

### 2. The Advantage of the CCS Model

The CCS timing approach was developed to address the effects of deep sub-micron processes and offers significantly higher accuracy (within 2-3% of SPICE).

*   **Current-Source Representation (Driver Model):** The key advantage is that the CCS driver model uses a **time-varying current source** (based on Norton's theorem). This model mathematically describes the cell's output driver by capturing the complete current waveform flowing into the load. This is a more accurate representation of transistor behavior in advanced nodes compared to NLDM's voltage-source approach.
*   **Accurate RC Network Handling:** By modeling the output as a current source, a timing analyzer (like PrimeTime) can numerically integrate this output current to accurately find the voltage response and propagation delay into an **arbitrary RC network**. This provides superior accuracy when dealing with resistive and complex interconnects.
*   **Enhanced Receiver Model:** CCS models the receiver as a dynamic equivalent capacitance rather than a single, fixed load capacitance. It incorporates greater detail to account for sensitivities like Miller capacitance, input transition times, and output load. Specifically, it uses **two different capacitor values** ($C_1$ and $C_2$) to dynamically adjust the load based on the input waveform, providing a much better approximation of Miller effects.
*   **Handling Non-Idealities & Advanced Effects:** CCS models are superior because they are better at handling:
    *   The **Miller Effect**: NLDM struggles, while CCS's two-capacitor receiver model offers better approximation.
    *   **Dynamic IR drop**.
    *   **Crosstalk coupling** and effective loading on interconnect wires.
    *   **Multivoltage analysis** and library scaling.
    *   **Complex non-linearities** and interconnect dominance at 65nm and below.
*   **Complete Waveform Propagation:** CCS allows for the propagation of a complete waveform (time, voltage pairs) throughout the timing analysis, offering a more comprehensive view than NLDM's limited delay and slew numbers.

In essence, CCS's time-varying current source driver and its two-capacitor receiver model allow the tool to accurately replicate the complex, non-linear waveforms seen in nanometer circuits that NLDM cannot, ensuring more reliable timing closure and reducing discrepancies between simulation and silicon performance.

## Quiz Context
> [!QUESTION] CCS vs NLDM Timing Models
> **Question:** In the context of Composite Current Source (CCS) timing models, what is the advantage over traditional NLDM models, particularly for nanometer designs with resistive interconnects?
>
> **Correct Answer:** CCS models provide a current waveform representation of the cell's output driver, which allows for more accurate delay calculation in the presence of RC interconnect shielding effects.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.