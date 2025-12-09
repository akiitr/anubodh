---
title: "Vector IR Drop Analysis: High Fidelity DVD Sign-off"
date: 2025-12-08
tags: [asic, Physical_Design, PDN, STA]
alias: ["Vector IR Analysis", "VCD IR Drop", "FSDB IR Drop"]
draft: false
---
**One-Line Summary:** Vector-based analysis in RedHawk-SC uses accurate VCD/FSDB switching waveforms for transient simulation, providing high fidelity Dynamic Voltage Drop (DVD) results essential for sign-off by capturing peak current effects that are often missed in simpler vectorless models.

### Details:
Vector-based analysis involves utilizing temporal data files, typically Value Change Dump (VCD) or Fast Signal Database (FSDB) files, to model the exact switching events of design elements over time. This approach is fundamental to performing Dynamic Voltage Drop (DVD) analysis.

#### I. Vector-Based Analysis vs. Vectorless Analysis

Vector-based analysis is preferred, especially for sign-off, because it incorporates the specific timing and spatial correlation of switching events, leading to accurate determination of instantaneous peak current ($I_{peak}$) and dynamic voltage drop.

| Feature | Vector-Based Analysis (VCD/FSDB) | Vectorless Analysis (NPV/LP) |
| :--- | :--- | :--- |
| **Data Source** | Actual simulation waveforms/events derived from RTL or Gate-level simulation. | Statistically derived events, using toggle rates, target power, or logic propagation techniques. |
| **Accuracy (Timing)** | High, especially with True-Time (delay annotated) VCD, as exact event times are honored. | Lower, as it relies on estimated delays (cell delay or STA times) or statistical switching patterns. |
| **Current Modeling** | Models instantaneous $I_{peak}$ based on measured switching events. | Models $I_{peak}$ based on simultaneous switching heuristics and statistical scores (e.g., PeakTW). |
| **Primary Use** | Final design verification and sign-off, targeting high transient current analysis. | Early design stages (grid/floorplan checks) or for high-coverage vector generation (PCVS/NPV). |

#### II. Key Views in RHSC Vector-Based Flow

The core flow uses a sequence of views to process the raw vector data and produce simulation results:

| View | UPF Command | Primary Role in VCD Analysis |
| :--- | :--- | :--- |
| **ValueChangeView (VCV)** | `create_value_change_view` | Reads and stores the complete temporal event sequences from VCD/FSDB files, handling name mapping and time slicing. |
| **ScenarioView (SCN)** | `create_scenario_view` / `create_no_prop_scenario_view` | Consumes VCV data; generates instantaneous current demand profiles for all instances based on annotated switching events and corresponding library models (APL/CCS). |
| **AnalysisView (AV)** | `create_analysis_view` | Performs the transient RLC simulation using the currents from SCN and parasitics from SimulationView/ExtractView. Calculates time-variant voltages and stores DVD metrics. |

#### III. Critical Knowledge for VCD IR Analysis Sign-off

A power sign-off engineer must understand the nuances of VCD handling to ensure the simulation accurately reflects physical reality.

| Aspect | Detail | Signoff Consideration |
| :--- | :--- | :--- |
| **VCD Timing Accuracy** | VCD files come in types: RTL VCD, non-delay Gate VCD, and True-Time (SDF-annotated) Gate VCD. True-Time VCD is most accurate as it uses exact event times. | For non-delay VCD, the tool must propagate timing (Logic Propagation ScenarioView) or rely on STA timing window data (`event_time_precedence`) to derive event arrival times. NPV scenarios cannot propagate delays. |
| **Name Mapping** | Required to match VCD signal names (often RTL or synthesis-derived) to the final physical DEF/Gate netlist. VCV and SWA support rules for handling hierarchy, bus delimiters, and preambles. | Improper mapping leads to low switching coverage, meaning many instances are falsely deemed inactive. Automated mapping tools and custom rule files (`namemap_files`, `namemap_rules`) are critical here. |
| **Switching Coverage** | VCD coverage tracks which pins/nets are successfully annotated with switching activity. Coverage often reported per net/instance or block. | Low coverage (e.g., $<50\%$ of instances switching) means the analysis misses potential hotspots. If VCD coverage is inadequate, vectorless techniques (e.g., NPV/PCVS) may be necessary to supplement activity. |
| **Glitches (Noise)** | Glitches (transient pulses shorter than cell delay) are typically filtered out in logic propagation scenarios for vectorless events to prevent false activity. | When using VCD input in logic propagation scenarios, VCD events with glitches are *not* filtered out by default. This is generally intentional for accuracy but requires verification. |
| **Timing Window (TW)** | STA files provide timing window data (max/min arrival times). DVD parameters (e.g., $\text{min\_pg\_tw}$, $\text{avg\_pg\_tw}$) rely on these windows to check worst-case voltage stability. | The presence and quality of timing window data in the TimingView is crucial for interpreting DVD results related to performance margin. |
| **DVD Metrics** | Key metrics include: $\text{min\_pg\_sim}$ (minimum VDD-VSS across full simulation), and Effective DVD ($\text{eff\_dvd}$) (average VDD-VSS voltage calculated only during the actual current stamping window/event activity). | Effective DVD is the preferred metric as it correlates voltage drop specifically to the time the instance is actively switching. |
| **Pre-simulation (Presim)** | For simulations including package models, a long presimulation period is needed to establish stable initial conditions before the analysis window begins. | Presim helps damp package transient effects and is critical for accurate package co-analysis. It must use an appropriate scenario representing steady-state power consumption. |

### References
*   **Source:** RedHawk-SC User Manual
*   **Source:** RedHawk-SC Reference Manual
*   **Source:** RedHawk User Manual
*   **Source:** Low Power Methodology Manual
*   **Source:** Analysis of IR Drop
