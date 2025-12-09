---
title: "Electromigration Analysis Guide"
date: 2025-12-08
tags: [asic, Physical_Design, PDN]
alias: ["EM Analysis", "Signal EM", "Power EM"]
draft: false
---
**One-Line Summary:** Electromigration (EM) is a critical reliability phenomenon caused by electron-atom momentum transfer; Power EM checks DC/RMS/Peak current against foundry limits in Power/Ground (PG) nets (requiring AnalysisView inputs), while Signal EM performs the same checks across signal net interconnects (requiring SignalNetCurrentView inputs).

### Details:

Electromigration (EM) involves the movement of metal atoms due to momentum transfer from electrons flowing through the conductor, representing a serious reliability challenge in IC design. This effect is magnified by increasing current density and temperature.

EM failures result in wire narrowing, which degrades performance or causes open circuits, or hillocks/bumps, which may lead to shorts with adjacent lines. Foundries set maximum current limits based on parameters such as wire width, topology, and operating temperature to prevent premature failure.

#### Comparison of Power EM and Signal EM

RedHawk performs EM analysis for both Power/Ground (PG) nets and signal nets, utilizing different data sources appropriate for the nature of the network.

| Feature | Power EM (PG Nets) | Signal EM (Signal Nets) |
| :--- | :--- | :--- |
| **Scope** | Verifies Power and Ground distribution networks. | Verifies all signal net routing segments, both intra-cell and inter-cell. |
| **Analysis Types** | Static EM (DC), Dynamic EM (RMS and Peak). | RMS, Peak, and Average (uni-directional or bi-directional). |
| **Current Basis** | Static: True average current. Dynamic: True average, RMS, or peak transient current values. | Current estimated from capacitive load, frequency, toggle rate, and supply voltage. Rectified average current is calculated due to typically bi-directional current flow. |
| **Analysis Input View** | Requires **AnalysisView** (Av). | Requires **SignalNetCurrentView** (SCV). |
| **Key Input Data** | Total power and PG network RLC values. | CCS timing models are required for the dynamic signal flow. |

#### Electromigration Current Types and Reliability

Foundry rules specify distinct EM limits for average ($I_{avg}$), RMS ($I_{rms}$), and peak ($I_{peak}$) currents, as these relate to different physical mechanisms affecting the interconnect lifespan.

| Current Type | Abbreviation | Physical Mechanism & Purpose |
| :--- | :--- | :--- |
| **Average Current** | $I_{avg}$ | Also known as DC current. This current is primarily quantified using **Black's equation** to assess the **Mean-Time-To-Failure (MTTF)** for interconnects. It is critical for checking long-term metal ion migration. |
| **RMS Current** | $I_{rms}$ | Limits designed to prevent **Joule heating (self-heating)** failures in the wires. RMS current is often estimated using polynomial-based profiles derived from average current and transition times. |
| **Peak Current** | $I_{peak}$ | Limits used to prevent failures caused by instantaneous high current surges, which introduce **latent electromigration damage**. Peak current checks ensure the instantaneous current does not exceed the material's capacity. |

#### EM Analysis Flow and Outputs (Conceptual)

The full EM analysis flow requires inputs including the technology file (which defines EM limits), the extracted design parasitics (from ExtractView), and accurate switching activity data.

$$ 
\text{EM Ratio } \% = \left(\frac{\text{Actual Current Density}}{\text{EM Current Limit}}\right) \times 100
$$ 

The tool reports electromigration ratio (EM_Ratio) for every wire and via segment. An EM Ratio exceeding 100% indicates a violation.

#### Electromigration Formulas

1.  **Rectified Average Current (Signal EM estimate):** The rectified average current is calculated where $T_{clk}$ is the clock period and $I(t)$ is the instantaneous current.
    $$ I_{avg} = \frac{1}{T_{clk}} \int_{0}^{T_{clk}} |I(t)| dt $$
2.  **RMS Current (Dynamic EM):** RMS current accounts for thermal effects (Joule heating):
    $$ I_{rms} = \sqrt{\frac{1}{T_{clk}} \int_{0}^{T_{clk}} I(t)^2 dt} $$



### Table: Thermal Component Comparison

| Component | Physical Source | RedHawk-SC Data Type | Primary Calculation Basis |
| :--- | :--- | :--- | :--- |
| **Joule Heating** | Resistive losses in the local wire/via segment. | `joule_heating` | RMS current density and wire resistance. |
| **Self-Heating** | Sum of local Joule heating, device coupling, and wire coupling. | `self_heating` | Comprehensive model combining power consumption (devices) and RLC extraction (interconnect). |

### Equations or match representing the details of the topic.

1.  **Edge Self-Heating Definition:**
    The Edge Self-Heating is composed of three thermal factors:

    $$\text{Edge Self-heating} = \Delta T_{Joule\_heating} + \Delta T_{instance\_coupling} + \Delta T_{wire\_to\_wire\_coupling}$$

2.  **Effective Edge Temperature:**
    The final effective temperature of an interconnect edge is calculated as the sum of the environmental temperature and the edge self-heating:

    $$\text{Effective Edge Temperature} = T_{environment} + \text{Edge Self-heating}$$

### References
*   **Source:** RedHawk-SC_v23R2_Reference_Manual.md - Ansys, Inc.
*   **Source:** RedHawk-SC_v23R2_User_Manual.md - Ansys, Inc.
*   **Source:** Power Delivery Network (PDN) - Semiconductor Engineering - Bushra Fatima and Rajeevan Chandel
