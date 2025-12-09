---
title: "Device Effects Impacting Timing and Power"
date: 2025-12-08
tags: [asic, Physical_Design, STA, PDN]
aliases: ["Transistor Effects on Timing and Power"]
draft: false
---
**One-Line Summary:** Power consumption is categorized into dynamic (switching and internal power) and static (leakage power), driven by fundamental transistor physics where scaling supply voltage mandates threshold voltage reduction, creating a trade-off that dramatically increases static leakage power in modern FinFET architectures, often leading to thermal reliability concerns.

### Details:
Several physical phenomena in deep sub-micron and nanometer technologies significantly affect device performance, reliability, and power consumption, fundamentally linked to threshold voltage, supply scaling, and current density.

#### 1. Different Kinds of Power

The total power consumed by an integrated circuit is composed of dynamic power and static power. Static power in CMOS devices is attributable solely to leakage. Dynamic power is generated when the device is actively switching.

| Power Type | Definition | Key Components | Dependency/Calculation Formula |
| :--- | :--- | :--- | :--- |
| **Dynamic Power ($P_{dyn}$)** | Power consumed when signals are changing values (active state). | Switching Power ($P_{switching}$) and Internal Power ($P_{internal}$). | $P_{dyn} \propto f_{clock} \cdot P_{trans} \cdot C_{L} \cdot V_{DD}^2$ |
| **Switching Power ($P_{switching}$)** | Power required to charge and discharge load capacitance ($C_L$). | Load Capacitance ($C_L$), Supply Voltage ($V_{DD}$), Frequency ($f_{clock}$), and Probability of Transition ($P_{trans}$). | $P_{switching} \propto C_L \cdot V_{DD}^2 \cdot f_{clock}$ |
| **Internal Power ($P_{internal}$)** | Power dissipated internally, primarily due to short circuit currents (crowbar current) during transitions when both PMOS and NMOS transistors are briefly ON. | Short Circuit Time ($t_{sc}$) and peak switching current ($I_{peak}$). | $P_{internal} \propto f_{clock} \cdot I_{peak} \cdot t_{sc} \cdot V_{DD}$ |
| **Static Power ($P_{static}$)** | Power consumed when the device is powered up but not active (leakage). | Sub-threshold Leakage ($I_{SUB}$), Gate Leakage ($I_{GATE}$), Junction Leakage ($I_{REV}$), and Gate Induced Drain Leakage ($I_{GIDL}$). | $P_{Static} = V_{DD} \cdot I_{Leakage}$ |

#### 2. Transistor Device Level Effects and Relationships

In modern, deep sub-micron processes (90nm and below), transistor characteristics exhibit complex behaviors driven by aggressive voltage and dimensional scaling.

##### $I_{DS}$ and Voltage Relationship

The drive current ($I_{DS}$) of a MOSFET is approximated by a formula demonstrating its dependence on carrier mobility ($\mu$), gate capacitance ($C_{ox}$), dimensions ($W/L$), and the voltage overdrive $(V_{GS} - V_T)$:

$$
I_{DS} \propto \mu \cdot \frac{W}{L} \cdot C_{ox} \cdot (V_{GS} - V_T)^2
$$

The most effective way to reduce dynamic power ($P_{dyn}$) is to reduce the supply voltage ($V_{DD}$) (due to the quadratic dependency). However, lowering $V_{DD}$ tends to lower $I_{DS}$, resulting in slower speeds. To maintain performance, the threshold voltage ($V_T$) must be simultaneously lowered.

This trade-off creates a direct conflict in advanced nodes: lowering $V_T$ to maintain performance results in an exponential increase in sub-threshold leakage current ($I_{SUB}$). Static leakage power increases dramatically as technology scales below 90nm.

##### Device and Reliability Impacts (FinFET Context)

In FinFET and advanced planar devices, scaling introduces key effects that complicate timing and reliability:

| Effect | Description | Relevance to FinFET/Advanced Nodes |
| :--- | :--- | :--- |
| **Temperature Inversion** | Occurs at low supply voltages ($V_{DD}$), where gate delay decreases as temperature increases (non-monotonic behavior). <br><br> **Mechanism:** At low $V_{DD}$, the reduction in threshold voltage ($V_T$) at high temperatures outweighs the degradation in carrier mobility ($\mu$), causing transistors to switch faster as they get hotter. | Caused by high sensitivity to $V_T$ changes overwhelming mobility changes as temperature rises. This complicates timing analysis and verification (requires multi-corner analysis) and limits DVFS. |
| **Sub-threshold Leakage ($I_{SUB}$)** | Current flows from drain-to-source even when the transistor is nominally turned OFF (operating in weak inversion). Depends exponentially on $(V_{GS} - V_T)$. | Lowering $V_T$ to maintain performance as $V_{DD}$ decreases results in an exponential increase in $I_{SUB}$, making it a dominant static power component. |
| **Gate Leakage ($I_{GATE}$)** | Tunneling current flows directly through the extremely thin gate oxide layer due to quantum effects. | Becomes a substantial contributor to static power, potentially equaling $I_{SUB}$ starting around the 90nm node. Necessitates high-k dielectric materials. |
| **Dynamic Voltage Drop (DVD)** | Instantaneous voltage degradation (AC transient) across the Power Delivery Network (PDN) due to sudden, high peak current consumption ($I_{peak}$) when instances switch simultaneously. | High DVD represents a weak power grid and can cause local hotspots and timing violations. Must be calculated using RLC models and transient current sources. |
| **Electromigration (EM)** | Physical degradation of interconnects due to high current density and temperature. Exacerbated by self-heating in FinFETs. | Critical issue in advanced nodes where smaller wire widths and 3D structures (like FinFET vertical fins) lead to increased current density and localized self-heating. EM limits are based on temperature-dependent specifications. |
| **Thermal Feedback** | Leakage current increases exponentially with temperature. | Power consumption creates heat, and this heat increases leakage, causing a runaway cycle that poses reliability problems. Electro-thermal analysis is necessary to evaluate reliability accurately. |
| **Stack Effect** | When multiple transistors in a series stack are turned OFF, small sub-threshold leakage currents cause intermediate node voltages to float (self reverse bias), lowering the drain-source potential. | Reduces sub-threshold leakage significantly (by an order of magnitude for two stacked transistors versus one). |
| **Reverse Body Bias (RBB)** | Applying a dedicated voltage bias to the substrate/well that reverses the normal operational bias, increasing $V_T$. | Reduces standby leakage dramatically, though effectiveness decreases in scaled nodes due to BTBT/GIDL. |

### References
*   **Source:** Low Power Methodology Manual For System-on-Chip
*   **Source:** Analysis of IR Drop for Robust Power Grid
*   **Source:** Power Delivery Network (PDN) - Semiconductor Engineering
*   **Source:** RedHawk-SC User Manual
*   **Source:** Synopsys Multivoltage Flow User Guide