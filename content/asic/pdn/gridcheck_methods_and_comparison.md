---
title: "Gridcheck Methods and Comparison"
date: 2025-12-08
tags: [asic, Physical_Design, PDN]
alias: ["Gridcheck Analysis", "Power Grid Analysis", "BQM"]
draft: false
---
**One-Line Summary:** Gridcheck, BQM, and Static IR Drop are methods for early Power/Ground (P/G) grid robustness analysis: Gridcheck quickly estimates normalized resistance; Static IR analyzes voltage drop from anticipated average power; and BQM evaluates structural integrity using engineered current sources.

### Details:

These analyses fall under the category of **Early Grid Analysis** in RedHawk-SC, designed to verify the strength and connectivity of the P/G grid structures before the completion of detailed layout (such as full timing and routing).

### Comparison of Grid Robustness Analysis Methods

| Metric | Gridcheck (Normalized R) | Static IR Drop (DC Analysis) | Build Quality Metric (BQM) |
| :--- | :--- | :--- | :--- |
| **Domain** | P/G Network Structure. | DC Voltage Drop (Average Current Load). | P/G Network Structural Integrity (Simulated Stress). |
| **Analysis Goal** | Identify overall structural weakness by estimating the upper bound on resistance. | Calculate the *actual* sustained DC voltage drop across P/G pins due to expected average power consumption. | Identify subtle resistive faults and weaknesses in the grid structure by simulating uniform stress. |
| **Core Methodology**| R extraction followed by calculating normalized resistance ratios (Rinst vs. Rmax/Rmin). | R network extraction combined with calculating average cycle power to derive DC current sinks. | R extraction combined with applying **equidistant constant current sources** (probes) across the low metal layers. |
| **Primary Output** | Normalized resistance percentage (%). | Absolute voltage values (V) and voltage drop maps based on average current loads. | Normalized voltage drop (or resistance gradient) heatmaps at internal nodes and instances. |
| **Current Source** | Not directly driven by current. Reports passive resistance properties. | Calculated average power consumption from input data (LIB, APL, toggle rates). | Artificial, constant current injected via internal probes, independent of cell activity. |
| **Accuracy / Fidelity**| Lowest fidelity, provides only relative resistance strength indication. | Medium fidelity; accurate for sustained power distribution issues. | High fidelity for structural integrity, independent of actual circuit switching activity. |
| **Execution Command**| `perform gridcheck`. | `perform analysis -static`. | Initiated via `bqm.generate_bqm_current_probe_metal`. |

### Major Differences and Recommended Usage

The three methods target different aspects of grid performance and are often complementary tools:

| Characteristic | Gridcheck | Static IR Drop Analysis | Build Quality Metric (BQM) |
| :--- | :--- | :--- | :--- |
| **Distinction** | Fast calculation of resistance inherent in the physical layout, normalized to reveal worst/best areas. | Uses actual power consumption derived from inputs (e.g., toggle rates, LIB data) to calculate *expected voltage impact* during sustained operation. | Ignores the design's functional activity; instead, focuses on mapping the structural resistance characteristics by forcing uniform current loading via synthesized probes. |
| **When to Use** | **Early Planning:** Used immediately after P/G routing is available to get a quick initial metric of structural quality before detailed floorplanning or placement validation. | **Pre-Sign-Off / Design Development:** Used when reliable average power data is available to quantify the actual voltage degradation expected under normal, non-transient operating conditions. | **Structural Validation:** Recommended method for structural checks. Used early on (design planning through implementation) to systematically stress the grid to find layout weaknesses (such as bottlenecks or poorly placed vias) irrespective of initial cell activity. |
| **Fixing Goal** | Highlights imbalances between VDD and VSS resistance for correction via grid optimization. | Ensures minimum operating voltage is met for prolonged periods (e.g., fixing poor placement/floorplan issues). | Guides fixes to ensure uniform grid quality (e.g., adding vias/straps) where resistance gradients are steep. |

### Equations Representing Core Concepts

1.  **Gridcheck Normalization (Rinst as % of max range):**
    Gridcheck reports the total effective P/G resistance for an instance ($R_{inst} = R_{VDD} + R_{VSS}$) as a percentage of the overall resistance range, where $R_{min}$ is the lowest Rinst and $R_{max}$ is the highest.
    $$R_{Normalized} = \frac{R_{inst} - R_{min}}{R_{max} - R_{min}} \times 100\%$$

2.  **Static IR Drop (DC Voltage Law):**
    Static IR drop calculates the voltage drop ($V_{drop}$) resulting from the flow of average DC current ($I_{DC}$) through the physical network resistance ($R_{network}$), following Ohm's law.
    $$I_{DC} \approx \frac{P_{avg}}{V_{supply}}$$
    $$V_{drop} \approx I_{DC} \times R_{network}$$

3.  **BQM Voltage Generation:**
    BQM generates a simulated voltage map by solving the R network using synthesized current probes ($I_{probe}$) applied at regular intervals across the grid geometry.
    $$V_{node} = R_{node\_to\_supply} \times I_{probe}$$
    $$R_{gradient} = \frac{R_{score\_instance\_pin}}{R_{median\_score\_basis\_ground}}$$

### References
*   **Source:** RedHawk User Manual - Apache Design, Inc.
*   **Source:** RedHawk-SC_v23R2_Reference_Manual.md - Ansys, Inc.
*   **Source:** RedHawk-SC_v23R2_User_Manual.md - Ansys, Inc.
*   **Source:** Analysis of IR Drop for Robust Power Grid of Semiconductor Chip Design: A Review - Bushra Fatima and Rajeevan Chandel