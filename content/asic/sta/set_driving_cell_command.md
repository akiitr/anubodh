---
title: "set_driving_cell Command in SDC"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
aliases: []
draft: false
---
**One-Line Summary:** This note details the `set_driving_cell` SDC command, explaining its role in accurately modeling external driver characteristics for input ports to ensure precise timing analysis by providing realistic drive strength and slew.

That is the **correct answer**. The primary function of the `set_driving_cell` command is indeed to model the drive strength and slew characteristics of the external circuit driving an input port of the Design Under Analysis (DUA).

Here is a detailed explanation of why this command is essential in Static Timing Analysis (STA):

### 1. The Purpose: Accurate Timing at the Chip Boundary

To perform accurate STA, the tool (such as PrimeTime or Design Compiler) must correctly calculate the delay of the first logic cell connected to an input port.

The delay through a cell depends on two primary factors:
1.  The **output load capacitance**.
2.  The **input transition time (slew)**.

Since the input port is the boundary of the DUA, the STA tool cannot inherently know the input transition time of the signal arriving at the first cell unless the external environment is modeled.

### 2. How `set_driving_cell` Works

The `set_driving_cell` command addresses this by specifying a standard library cell (e.g., `BUFF4X`) that realistically represents the external driver.

*   **Models Drive Strength and Slew:** By naming a library cell, the command applies the cell's design rule constraints and drive capabilities to the input port. This allows the timing tool to calculate the output transition time (slew) of this *virtual* external driver, which then becomes the realistic **input transition time** for the first cell inside the DUA.
*   **Calculates Port Delay:** When using `set_driving_cell`, the port may have a cell delay that is the load-dependent portion of the external driving cell's delay. This driver is used to calculate the transition time at the first cell, and to compute the delay from the input port to the first cell if RC interconnect is present.
*   **Superior Accuracy:** This method is more accurate for Non-Linear Delay Models (NLDM) than using the simpler `set_drive` command (which specifies a fixed resistance value) because it takes advantage of the actual delay model of the library cell.
*   **Design Rule Constraints:** It inherently considers the design rule constraints associated with the specified driving cell, such as maximum fanout and transition time limits.

### 3. Contrast with Alternatives

| Command | Modeling Method | Primary Use |
| :--- | :--- | :--- |
| `set_driving_cell` | Models a **library cell**. | Provides the most accurate, load-dependent slew for the first internal gate. |
| `set_input_transition` | Defines a **fixed transition time**. | Useful if the driver slew is known and is relatively independent of load. The port has zero cell delay. |
| `set_drive` | Defines an **external drive resistance**. | Used when a library cell cannot be specified. Less accurate for NLDM. A value of 0 signifies the highest drive strength. |

In the absence of any driving specification, the tool assumes an ideal transition value of 0, which is unrealistic for accurate timing analysis.

### 4. Examples of `set_driving_cell` Usage

*   `set_driving_cell -lib_cell IV {I1}`: Specifies that input port `I1` is driven by a library cell named `IV`.
*   `set_driving_cell -lib_cell AND2 -pin Z -from_pin B {I2}`: Indicates input port `I2` is driven by the `Z` pin of an `AND2` cell, with the signal originating from pin `B` of that cell.
*   `set_driving_cell -lib_cell BUF [get_ports IO1]`: Sets input port `IO1` to be driven by a buffer cell (`BUF`).
*   `set_driving_cell -lib_cell INV3 -library slow [get_ports INPB]`: Specifies input port `INPB` is driven by an inverter cell (`INV3`) from the `slow` library.

## Quiz Context
> [!QUESTION] Function of set_driving_cell
> **Question:** What is the primary function of the set_driving_cell command in an SDC file?
>
> **Correct Answer:** To model the drive strength and slew characteristics of an external circuit driving an input port of the DUA.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.