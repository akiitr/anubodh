---
title: "Vectorless IR Methodology: NPV vs Logic Propagation"
date: 2025-12-08
tags: [asic, Physical_Design, PDN]
aliases: ["Vectorless IR Drop", "NPV vs Logic Propagation"]
draft: false
---
**One-Line Summary:** The No-Propagation Vectorless (NPV) scenario generates instantaneous switching events independently for each design instance without applying logic gates, prioritizing speed and coverage, while the logic-propagation scenario simulates the coherent temporal spread of switching activity across the combinational circuitry, prioritizing accuracy.

### Details:
Both No-Propagation Vectorless (NPV) and logic-propagation scenarios are types of dynamic simulations in RedHawk-SC designed to calculate instantaneous current demand at the Power/Ground (PG) pins of instances.

#### Comparison of Scenario Types in RedHawk-SC

| Feature | No-Propagation Vectorless (NPV) Scenario | Logic-Propagation (LP) Scenario |
| :--- | :--- | :--- |
| **Calculation Mechanism** | Creates events for each instance based on defined probabilities (e.g., target power, toggle rates) **without** propagating logical states through the circuit. | Creates and propagates logic-coherent events sequentially through the design's combinational circuitry based on cell functionality, internal delays, and timing constraints. |
| **Logic Coherence** | Non-coherent. The switching scenario is driven statistically based on inputs and randomization; it does not model actual functional dependence between gates. | Logic-coherent. Events accurately reflect the timing and logic function of the circuit, mimicking a gate-level simulation. |
| **Primary Goal** | Maximize switching coverage across the design in minimum time to uncover potential hot spots quickly. It excels at matching user-specified target power. | Achieve high accuracy capturing functional correlation and instantaneous current peaks that arise from coherent switching. |
| **Input VCD Type** | Supports Gate VCD (for pin event information). RTL VCD is **not** supported because it requires event propagation. | Supports both RTL VCD (using propagation to fill gaps) and Gate VCD (using propagation for accurate event timing/delay insertion). |
| **Resource/Time Cost** | Faster execution time and reduced memory usage due to lack of propagation step. | High computational complexity; generally more time-consuming, typically run for blocks rather than the entire chip. |
| **Key Inputs** | `TimingView`, `ExtractView`, explicit probability inputs (`toggle_rate`, `target_power`). | `TimingView`, `ExtractView`, activity information applied at circuit start points (e.g., sequential outputs, primary inputs). |
| **Key Output (Scenario View)** | A `ScenarioView` containing instantaneous Piece-Wise Linear (PWL) demand current values for all PG pins, accessed via `get_total_demand_currents`. | A `ScenarioView` containing instantaneous PWL demand current values for all PG pins, reflecting the propagated switching activity. |
| **Creation Command** | `SeaScapeDB.create_no_prop_scenario_view` | `SeaScapeDB.create_scenario_view` |

#### Flowchart Illustrating Key Difference

The core difference lies in how the events are generated and processed relative to the combinatorial logic.

```mermaid
graph TD
    subgraph A[Activity Inputs (VCD, Toggle Rate, Target Power)]
        A1[Start Point Definition]
        A2[Target Power/Toggle Rate]
    end

    subgraph B[NPV Scenario Flow]
        A -->|Events/Probabilities| B1[Instance Event Generation]
        B1 -->|No Logic Check| B2[Calculate Demand Current]
        B2 --> B3[Output ScenarioView]
        style B1 fill:#f9f,stroke:#333
        style B2 fill:#f9f,stroke:#333
    end

    subgraph C[Logic-Propagation Scenario Flow]
        A -->|Initial Events| C1[Sequential Event Generation]
        C1 -->|Propagate through Logic Gates/Timing| C2[Propagate Events & Calculate Delays]
        C2 --> C3[Calculate Demand Current]
        C3 --> C4[Output ScenarioView (Logic-Coherent)]
        style C1 fill:#ccf,stroke:#333
        style C2 fill:#ccf,stroke:#333
        style C3 fill:#ccf,stroke:#333
    end

    B3 & C4 --> D[Dynamic Analysis (AnalysisView)]

    style B fill:#e0e0e0
    style C fill:#e0e0e0

    A[Activity Inputs] --> B
    A --> C
```

The NPV approach bypasses the complex logic path (Step C2 in the diagram) by deriving currents directly from inputs (Step B1), making it faster for tasks like power constraint matching or analyzing long vectors. The LP approach intentionally uses the logic structure (Step C2) to ensure temporal relationships are accurately modeled.

### References
*   **Source:** Low Power Methodology Manual For System-on-Chip
*   **Source:** RedHawk-SC Reference Manual
*   **Source:** RedHawk-SC User Manual
*   **Source:** RedHawk User Manual
*   **Source:** Analysis of IR Drop
