---
title: "Power Gating Checks and Inrush"
date: 2025-12-08
tags: [asic, Physical_Design, PDN]
aliases: []
draft: false
---
**One-Line Summary:** Power Gating checks primarily focus on verifying dynamic and static voltage integrity, handling transient effects like inrush current during state transitions, and ensuring physical reliability through analyses like Electromigration and Shortest Path Resistance.

### Details:
Power gating (PG) designs require specialized verification techniques to ensure functionality and reliability during power-down, power-up, and normal operation. These checks fall into verification stages covering design intent (isolation, retention logic) and physical effects (IR drop, EM).

#### Comparison of Key Power Gating Analyses

| Analysis Type | Purpose & Description | Key Inputs | Key Outputs |
| :--- | :--- | :--- | :--- |
| **Static IR Drop** | Checks average voltage drop (DC component) across the power delivery network (PDN) during the ON state. Useful for early PDN quality assessment. | Design View, Extract View (R network), Power View (Average/DC current). | IR contour maps, `ir.worst` file (worst node locations), Voltage reports. |
| **Dynamic IR Drop (DVD)** | Checks instantaneous voltage drop (AC transient) due to worst-case/peak switching currents. Critical for chip performance and reliability. | Simulation View, Scenario View (Transient current waveforms), Timing View (Timing windows, slews). | DVD heatmaps (e.g., MinTW, AvgTW, Effective DVD), Voltage waveforms, `dvd file` (VDD-VSS differential). |
| **Rampup/Inrush Current** | Verifies PG control sequencing and manages current surge during power-up (OFF to ON transition) to prevent voltage spikes and corruption of retention data. | Liberty View (Switch models, PWCAP), Scenario View (LSO for switch timing/control sequence), Analysis View (Transient simulation). | Peak current waveforms/reports, Switch turn-on time reports, Differential voltage reports (for crowbar currents). |
| **Dynamic EM (RMS/Peak)** | Ensures interconnect reliability against current density limits (RMS/Peak currents) during dynamic operation, typically based on transient simulation results. | Electromigration View, Analysis View (RMS/Peak current data), Tech View (EM limits). | EM violation heatmaps and reports. |
| **Quiet State Analysis** | Determines the equilibrium DC voltage and leakage current of internal nets when the power domain is in the OFF state. | Net object, simulation data with PG switches OFF. | DC voltage, leakage current, status (tuple). |

#### Deep Dive: Inrush and Rampup Analysis
This analysis focuses on verifying dynamic voltage integrity and managing high transient currents, often referred to as rush current, that occur when the switched domain transitions from the OFF state to the ON state (power-up). The primary goal is to prevent excessive IR drop and voltage spikes that could corrupt retention elements or neighboring always-on logic.

| Analyzed Parameter | What is Checked | Key Inputs | Key Outputs |
| :--- | :--- | :--- | :--- |
| **Rampup Current / IR Drop** | Peak instantaneous current draw during switch turn-on to assess noise coupling and voltage degradation in the power delivery network. | APL Switch Model file. APL PWCAP file (PieceWiseCapacitance) detailing intrinsic capacitance and leakage vs. voltage. LSO files defining switch control timing sequence. | Peak Rush Current reports. Power Gate Current Waveforms (total power gate currents per net). IR Drop Heatmaps/Violation Reports (via AnalysisComboView). |
| **Switch Timing & Sequencing** | Verification of delay implementation in the switch fabric (e.g., daisy chain) to control current rise time. | ScenarioView configured as `RampUp`. Timing window information from STA file (for switch control pins). | Switch Turn-on Time (10% to 90% internal V). Absolute Turn-on Time (0% to 90% internal V). |
| **Differential Voltage** | Voltage difference between the internal VDD and VSS rails of the switched domain during rampup to check against crowbar current thresholds. | AnalysisView set to gather full voltage statistics (`KeepStats="Full"`). | Differential voltage reports for switch pairs (driver-receiver analysis). Instance Voltage Waveforms (at internal PG pins). |

#### In-Rush Current Control Mechanism (Daisy Chain)

The standard approach to managing in-rush current is through the implementation of a daisy-chain distribution of control signals across the switching fabric.

1.  **Staggered Activation:** The daisy chain configuration ensures that the power switch transistors (sleep transistors) are turned on gradually, rather than simultaneously, preventing a large, instantaneous current surge.
2.  **Propagation Delay:** The control signal originates from the power controller and propagates sequentially from one switch unit to the next. Each switch in the chain buffers the signal, introducing a defined delay ($\Delta T$) before transmitting it to the succeeding switch.
3.  **Dual Chain Preference:** For larger designs, a dual daisy chain distribution is often preferred, splitting the switches into a weak transistor chain (for trickle charging the virtual net) and a main transistor chain (for full activation), providing superior rush current control.
4.  **Control Signal Path:** The control signals that manage this sequence (e.g., power-on/off, acknowledge) must be buffered exclusively by **always-on buffers** to ensure they remain functional even when the main power domain is shut down.

#### Consequences of Controlled Ramp-up

Controlling the switch sequence directly impacts system latency and reliability:

| Parameter | Description | Relevance to Ramp-up Control |
| :--- | :--- | :--- |
| **In-rush Current Peak** | The maximum instantaneous current draw during switch turn-on. | Minimizing this peak prevents excessive IR drop and voltage spikes that could corrupt retention state or adjacent logic. |
| **Ramp-up Time / Latency** | The total time required for the switched block's internal voltage to stabilize (e.g., from 10% to 90% of nominal voltage). | Sequential turn-on increases this time, creating a necessary trade-off between rush current suppression and system wake-up speed. |
| **Differential Voltage** | Voltage variation across driver-receiver switch pairs in internal domains. | Differential voltage checks verify control sequencing integrity, as high differential voltage can cause destructive crowbar currents in receiving domains. |
| **Acknowledge Signal** | A signal generated by the switching fabric indicating that power-up is complete and stable. | The operational block must wait for this signal before resuming normal operation (e.g., re-enabling clocks and assertion of restore signals). |

#### Deep Dive: Quiet State Analysis
Quiet state analysis determines the static equilibrium conditions when the power domain is intentionally shut down (OFF state).

| Analyzed Parameter | What is Checked | Key Inputs | Key Outputs |
| :--- | :--- | :--- | :--- |
| **Off-State Integrity** | DC voltage and leakage current of internal nets when PG switches are ideally OFF. | Design netlist, cell leakage models (for sub-threshold leakage). Optional: `RAMPUP_OFFSTATE_VOLTAGE` setting used for initial voltage. | The DC voltage of the net when power gates are OFF (`dc_state`). Leakage current ($I_{Leakage}$) flowing through the PG switches. |

#### General Power Gating Design Checks

1.  **Isolation and Level Shifting Verification:**
    *   **Goal:** Ensure signals crossing between domains operate correctly. Isolation cells clamp output signals from a powered-down domain to a known state (0, 1, or latch) to prevent crowbar currents in the receiving domain. Level shifters (LS) ensure proper voltage translation.
    *   **Tools/Checks:** Verification tools check isolation/LS policies against the power state table. The check involves verifying that the isolation supply remains ON during the driver domain's OFF state. The required LS supply must match the input/output supply voltages.

2.  **State Retention Verification:**
    *   **Goal:** Verify that retention registers save internal state before power-down and restore it correctly upon power-up.
    *   **Components:** Retention registers (using a shadow/balloon register connected to an always-on supply) and control signals (SAVE/RESTORE).
    *   **Checks:** Must ensure SAVE occurs before power-down and RESTORE occurs after power is stable. Checks often involve comparing the final restored state against the pre-sleep state.

3.  **Power Switching Network Design:**
    *   **Goal:** Ensure the switching fabric (header or footer switches) is sized and controlled correctly for functionality, area efficiency, and performance.
    *   **Checks:** Focus on switch efficiency (Ion/Ioff ratio), area overhead, and physical layout to minimize IR drop during the ON state.

4.  **Logical/Behavioral Verification (Sequencing and Clocks):**
    *   **Goal:** Validate the power controller state machine and ensure clocks and resets interact correctly with power states.
    *   **Checks:** Verify sequencing of flush, clock stop, isolation assert, save (if used), power-down, power-up, restore (if used), isolation de-assert, and clock restart. Clocks must be stopped/parked before retention/power-down begins. Clock tree synthesis tools must be power-aware to handle level shifters placed on clock paths.

### Analytical Representation

The time required for the virtual power rail voltage ($V_{VV D}$) to reach an operational level (e.g., $90\% V_{DD}$ from $10\% V_{DD}$) during rampup is critical for latency determination. This time is largely determined by the switch resistance ($R_{Switch}$) and the parasitic capacitance of the switched domain ($C_{Switched}$).

$$
T_{Rampup} \propto R_{Switch} \cdot C_{Switched}
$$

### References
*   **Source:** Low Power Methodology Manual
*   **Source:** Synopsys Multivoltage Flow User Guide
*   **Source:** Power Compiler User Guide
*   **Source:** IC Compiler II and Fusion Compiler Guide
*   **Source:** RISC-V CPU Cores with DC-NXT And ICC2
*   **Source:** RedHawk Flow Introduction
*   **Source:** RedHawk-SC Reference Manual
*   **Source:** RedHawk-SC User Manual
*   **Source:** Analysis of IR Drop
*   **Command:** `dump_differential_voltage_report`
*   **Command:** `rampup_get_worst_node`