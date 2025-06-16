---
title: _ASIC Design Flow
---

# ASIC Chip Design Flow: A Comprehensive Guide

### Table of Contents
* [[Chip Specification|1. Chip Specification]]
* [[RTL Design|2. RTL Design]]
* [[Functional Verification|3. Functional Verification]]
* [[Synthesis|4. Synthesis]]
* [[DFT|5. Design for Test (DFT)]]
* [[Physical Design|6. Physical Design (Backend)]]
    * [[Pre-Placement & Sanity Checks|6.1. Pre-Placement & Sanity Checks]]
    * [[Floorplanning & Power Planning|6.2. Floorplanning & Power Planning]]
    * [[Placement|6.3. Placement]]
    * [[CTS |6.4. Clock Tree Synthesis (CTS)]]
    * [[Routing |6.5. Routing]]
* [[Sign Off|7. Sign Off]]
    * [[STA|7.1. Static Timing Analysis (STA)]]
    * [[Power Signoff|7.2. Power Signoff]]
    * [[Physical Verification|7.3. Physical Verification]]
    * [[ECO |7.4. ECO (Engineering Change Order)]]
* [[Tape Out & Manufacturing|8. Tape Out & Manufacturing]]
* [[Post-Silicon Validation|9. Post-Silicon Validation]]
* [[Recommended Resources|10. Recommended Resources]]
* [[Key File Formats|11. Key File Formats]]
* [[Key EDA Tools|12. Key EDA Tools]]
* [[Frontend Interview Questions|13. Frontend Interview Questions]]
* [[Backend Interview Questions|14. Backend Interview Questions]]

### [[ASIC Design Flow]]
*A visual representation of the entire flow, including key inputs, outputs, and iteration loops.*
```mermaid
graph TD
    A[Chip Specification] --> B[RTL Design-Verilog/HDL];
    B --> C{Functional Verification};
    C -- Fixes --> B;
    C --> D[Synthesis-Gate Level Netlist];
    D --> E[Design for Test-scandef];
    E --> F[Physical Design-def];
    
    F -- Optimization --> D;

    F --> G[Signoff-STA/PDN/PV/CLP etc.];
    G -- Iterations --> F;
    G --> H[Tape Out-GDSII];
    
    H --> I[Post-Silicon Validation];
    I -- Silicon Bugs --> A;

    style F fill:#f9f,stroke:#333,stroke-width:2px
    style G fill:#ccf,stroke:#333,stroke-width:2px
```
---
## 1. [[Chip Specification]]
*Where the idea and requirements for the ASIC are defined.*
- [[Functional Specification]]
- [[Microarchitecture]]
- [[Memory Hierarchy]]
- [[Cache Coherency]]
- [[Pipeline Design]]
- [[Clock Frequency]]
- [[PPA|PPA (Power, Performance, Area)]]
- [[Cost Target]]
- [[I-O Specification]]
- [[PCIe]]
- [[DDR]]
- [[Modem]]
- [[CPU]]
- [[GPU]]
 
---
## 2. [[RTL Design]]
*Translating the microarchitecture into a hardware description language.*
- **[[HDL|Hardware Description Language (HDL)]]**
    - [[Verilog]]
    - [[VHDL]]
    - [[SystemVerilog]]
    - [[FSM|Finite State Machines (FSM)]]
    - [[Data Path Design]]
    - [[Control Logic]]
    - [[Combinational Logic]]
    - [[Sequential Logic]]
    - [[Parameterization]]
    - [[IP Integration]]
    - [[Synthesizable vs Non-synthesizable constructs]]
    - [[Blocking vs Non-blocking assignments]]
    - [[Latch Inference]]
- **[[CDC|Clock Domain Crossing (CDC)]]**
    - [[Metastability]]
    - [[Synchronizers]]
    - [[Handshake Protocol]]
    - [[Asynchronous FIFOs]]
- **[[Reset Strategy]]**
    - [[Synchronous Reset]]
    - [[Asynchronous Reset]]
    - [[Reset Synchronizer]]
- **[[Low Power Design]]**
    - [[UPF|UPF (Unified Power Format)]]
    - [[Power Domains]]
    - [[Clock Gating]]
    - [[Operand Isolation]]
    - [[Power Gating]]
    - [[Multi-voltage Design]]
- **[[Linting]]**

---
## 3. [[Functional Verification]]
*Ensuring the RTL design behaves as intended before synthesis.*
- [[Testbench]]
- [[Simulation]]
- **[[Coverage Metrics]]**
    - [[Code Coverage]]
    - [[Functional Coverage]]
    - [[Assertion Coverage]]
- **[[Assertions]]**
    - [[SVA|SystemVerilog Assertions (SVA)]]
- **[[Verification Methodologies]]**
  - [[UVM|UVM (Universal Verification Methodology)]]
    - [[UVM Components]]
      - [[UVM Driver]]
      - [[UVM Monitor]]
      - [[UVM Sequencer]]
      - [[UVM Agent]]
      - [[UVM Scoreboard]]    
  - [[OVM|UVM (Open Verification Methodology)]]
- **[[Advance Verification]]**
    - [[Formal Verification]]
    - [[Emulation & Prototyping & FPGA]]
- **[[Test Techniques]]**
    - [[Directed Testing]]
    - [[Constrained Random Verification]]
- **[[Low Power Verification]]**
  - [[CLP | UPF, CPF-based Verification]]
  - [[PAFV | Power-aware Simulation]]
  - [[LEC|Logical Equivalence Checking (LEC)]]
---

## 4. [[Synthesis]]
*Converting RTL code into a technology-specific gate-level netlist.*
- [[Gate-Level Netlist]]
- [[Standard Cell Library]]
- [[SDC|Synopsys Design Constraints (SDC)]]
- **[[Optimization Techniques]]**
    - [[Logic Optimization]]
    - [[Technology Mapping]]
    - [[Register Retiming]]
    - [[Clock Gating| Clock Gating Insertion]]
    - [[WLM|Wire Load Models (WLM)]]
- [[Physical Synthesis | Physical Guidance, Placement-Driven Synthesis]]
- [[Hierarchical Synthesis]]
  - [[Bottom-up Synthesis]]
  - [[Top-down Synthesis]]
  - [[Incremental Synthesis]]
- [[Low Power Synthesis | Low Power Synthesis, Power Management Features]]
  - [[Isolation Cells]]
  - [[Level Shifters]]
  - [[Retention Cells]]
  - [[Multi-Vt Cells]]
  - [[UPF|Unified Power Format (UPF)]]
---

## 5. [[DFT|Design for Test (DFT)]]
*Adding logic to the design to facilitate manufacturing testability.*
- **[[DFT Principles]]**
  - [[Controllability]]
  - [[Observability]]
  - [[Repeatability]]
  - [[Survivability]]
- **[[Fault Models]]**
    - [[Stuck-at Faults]]
    - [[Transition Faults]]
    - [[Bridging Faults]]
    - [[Open and Short Faults]]
- [[Scan Insertion]]
  - [[Scan Chains]]
  - [[Scan Compression]]
- [[ATPG|ATPG (Automatic Test Pattern Generation)]]
- [[Test Coverage]]
- **[[BIST|BIST (Built-In Self-Test)]]**
    - [[LBIST|Logic BIST (LBIST)]]
    - [[MBIST|Memory BIST (MBIST)]]
- [[JTAG|Boundary Scan (JTAG)]]

---
## 6. [[Physical Design]]
*Creating the physical layout of the chip from the netlist.*

### 6.1. [[Pre-Placement & Sanity Checks]]
- [[Netlist Input]]
- **[[Sanity Checks]]**
    - [[Floating Nets and Pins]]
    - [[Multi-driven Nets]]
    - [[Combinational Loops]]
    - [[Library Consistency]]
    - [[SDC Checks]]
- [[DFT Insertion]]

### 6.2. [[Floorplanning & Power Planning]]
- [[Partitioning]]
- [[Die Size Estimation]]
- [[Core Utilization]]
- [[Aspect Ratio]]
- [[Macro Placement]]
- [[Flylines| Flylines For Macro Placement]]
- [[Pin Assignment]]
- **[[Power Grid|Power Grid Synthesis (PGS)]]**
    - [[Power Mesh]]
    - [[Power Rings]]
    - [[Power Rails]]
- [[IR Drop]]
- **[[Placement Blockages]]**
    - [[Hard Blockage]]
    - [[Soft Blockage]]
    - [[Partial Blockage]]
    - [[Halo | Halo,Keep Out Margins]]
- **[[Files]]**
    - [[DEF|DEF (Design Exchange Format)]]
    - [[LEF|LEF (Library Exchange Format)]]

### 6.3. [[Placement]]
- [[Standard Cell Placement]]
- **[[Placement Optimization]]**
    - [[Timing-driven Placement]]
    - [[Power-driven Placement]]
    - [[Congestion-driven Placement]]
- [[Congestion Analysis]]
- [[Cell Density]]
- [[Legalization]]
- [[HFNS|High-Fanout Net Synthesis (HFNS)]]
- [[Scan Chain Reordering]]
- **[[Physical-Only Cells]]**
    - [[Tap Cells]]
    - [[Endcap Cells]]
    - [[Decaps|Decoupling Capacitors (Decaps)]]
    - [[Tie Cells]]

### 6.4. [[CTS|Clock Tree Synthesis (CTS)]]
- [[Clock Skew]]
- [[Insertion Delay]]
- [[Clock Latency]]
- [[Clock Uncerainity | Clock Uncertainty, Clock Jitter]]
- [[Useful Skew |Useful Skew, CCD (Concurrent Clock and Data Optimization)]]
- [[NDR|Non-Default Rules (NDR)]]
- [[Clock Shielding]]
- [[Clock Gating]]
- [[Clock Buffers and Inverters]]
- **[[Clock Tree Architectures]]**
    - [[H-Tree]]
    - [[Conventional CTS]]
    - [[Clock Mesh]]
    - [[MSCTS]]

### 6.5. [[Routing]]
- [[Global Routing]]
- [[Detailed Routing]]
- **[[Routing Optimizations]]**
    - [[Timing-Driven Routing]]
    - [[Signal Integrity]]
    - [[Crosstalk]]
    - [[Antenna Effect]]
- [[Metal Fill]]

---
## 7. [[Sign Off]]
*Final verification checks before manufacturing.*

### 7.1. [[STA|Static Timing Analysis (STA)]]
*Analyzing timing paths to ensure the design meets timing and frequency requirements across all PVT conditions.*
- **[[STA Tools]]**
  - [[PrimeTime]]
  - [[Tempus]]
  - [[Tweaker]]
- **[[Inputs]]**
  - [[Netlist]]
  - [[Timing Library]]
  - [[SPEF|Parasitic Files]]
  - [[SDF|Standard Delay Format]]
  - [[Timing Window File]]
  - [[Constraints]]
- **[[Timing Reports | Key outputs, Timing Reports]]**
  - [[report_qor]]
  - [[report_timing]]
  - [[report_clock_timing]]
  - [[report_delay_calculation]]
  - [[report_noise]]
- **[[Constraint Verification]]**
  - [[check_timing]]
  - [[report_constraint]]
  - [[report_exceptions]]
  - [[report_annotated_parasitics]]
  - [[report_analysis_coverage]]
  - [[Linking Checks]]
  - [[Unclocked Flops]]
  - [[Unconstrained Endpoints]]
- **[[Timing Analysis]]**
  - [[Graph-Based Analysis]]
  - [[Path-Based Analysis]]
  - [[Clocks]]
    - [[Clock Groups]]
    - [[Clock Types | Clock Type, Generated, Virtual etc.]]
    - [[Clock Insertion Delay]]
    - [[CDC| Clock Domain Crossing, Clock Muxing]]
  - [[Timing Paths]]
    - [[Data and clock Path]]
    - [[Launch and Capture Path]]
    - [[Timing Paths | reg2reg, in2reg, reg2out, in2out]]
  - [[Timing Exceptions]]
    - [[False Paths]]
    - [[Multicycle Paths]]
    - [[Half cyle paths]]
    - [[Delay Exceptions | set_max_delay,set_min_delay]]
  - [[Operating Modes]]
    - [[Functional Mode]]
    - [[Test Mode | Test Mode, Scan, Shift, and Capture]]
  - [[PVT Corners | Multi-Mode Multi-Corner Analysis]]
  - [[Hierarchical vs. Flat STA]]
  - [[DVFS | Dynamic Voltage and Frequency Scaling]]
  - [[SMVA|Simultaneous Multivoltage Analysis]]
  - [[Timing Violations]]
      - [[Setup|Setup Time]]
      - [[Hold|Hold Time]]
      - [[Recovery|Recovery Time]]
      - [[Removal|Removal Time]]
      - [[MPW|Minimum Pulse Width]]
      - [[Min Period|Minimum Period]]
      - [[DCD|Duty Cycle Degradation]]
      - [[Clock Gating Setup|Clock Gating Setup]]
      - [[Clock Gating Hold|Clock Gating Hold]]
      - [[Delay Exception|Max-Min Path Delay]]
      - [[Skew Checks|Maximum Skew]]
    - [[Timing Design Rule Violations]]
      - [[Transition|Transition Time]]
      - [[Capacitance|Capacitance]]
      - [[Max Fanout|Max Fanout]]
    - [[Signal Integrity Analysis]]
      - [[Crosstalk Delay]]
      - [[Noise|Crosstalk-Glitch-Noise]]
      - [[SI Double Switching|SI Double Switching]]
  - [[Delay Models]]
    - [[NLDM | Non-Linear Delay Model]]
    - [[CCS | Composite Current Source]]
    - [[ECSM | Effective Current Source Model]]

- **[[Variability Analysis]]**
  - [[BC-WC|Best-Case - Worst-Case Analysis]]
  - [[OCV|On-Chip Variation, PVT Variation]]
  - [[AOCV|Advanced OCV]]
  - [[POCV|Parametric OCV]]
  - [[CRPR Or CPPR|Clock Reconvergence Pessimism Removal]]
  
- **[[Timing ECO]]**
  - [[Manual ECO]]
  - [[Tool Assisted ECO]]
  - [[Fixing Techniques]]
    - [[Cell Sizing]]
    - [[Buffer Insertion]]
    - [[Clock Path ECO | Clock Skew Optimization, Clock Pushing and Pulling]]
    - [[Vt Swapping]]
    - [[Metal ECO | Wire Optimization]]
    - [[Frequency Optimization]]
    - [[Common Path Optimization ]]
    - [[Logic Cloning]]

### 7.2. [[Power Signoff]]
*Ensuring power integrity, reliability, and compliance in low-power, multi-voltage designs.*

- **[[Power Fundamentals]]**
  - [[Power Types]]
    - [[Dynamic Power | Dynamic Power - Switching, Internal]]
    - [[Static Power | Static Power - Leakage]]
  - [[Power Metrics & Calculation]]
    - [[Total Power | Total Power , Switching, Internal, Leakage]]
    - [[Early Power Estimation]]
- **[[Power Delivery Network (PDN)]]**
  - [[PDN Components]]
    - [[Power Grid | Power Grid, Straps, Vias, Decaps]]
    - [[PCB Power Grid | Voltage Regulators, Supply Sets]]
- **[[Power Integrity Analysis]]**
  - [[Resistance Limits]]
  - [[IR Drop Analysis]]
    - [[Static IR Drop]]
    - [[Dynamic IR Drop | Dynamic IR Drop - Vectorless or VCD]]
    - [[DFT Power Signoff]]
  - [[Electromigration | EM Analysis - Power, Signal]]
  - [[Decap Planning]]
  - [[IR Drop Aware Timing Signoff]]
  - [[ESD Checks | ESD Checks - B2B, C2I]]
  - [[Package Modeling | Package or Board Modeling and Signoff]]
- **[[Power Management Techniques]]**
  - [[In-rush Current | In-rush Current, Wakeup Latency]]
  - [[Power Gating | Power Gating Switches, Control & Sequencing]]
  - [[State Retention]]
    - [[Retention Registers | Retention Registers, Partial or Full Retention]]
    - [[Power Muxing]]
- **[[Tool Flow & Signoff]]**
  - [[PDN Tools | PDN Tools - RedHawk-SC, Voltus, PrimeRail]]
  - [[PDN Inputs | PDN Inputs LEF, DEF, LIB, SPEF, VCD, etc.]]
  - [[Package Tools | Package Tools - SiWave, Totem, etc.]]
  - [[Low Power Signoff]]
  

### 7.3. [[Physical Verification]]
- [[DRC | DRC - Design Rule Check]]
- [[LVS | LVS - Layout Versus Schematic]]
- [[Antenna Effect]]
- [[ERC | ERC - Electrical Rule Check]]
- [[DFM | DFM - Design for Manufacturability]]
- [[Density_Checks]]
- [[Metal_Fill_verification]]
- [[Double_Patterning_Check]]
- [[ESD_Checks]]
- [[PV_Tools | PV_Tools - Calibre, ICV, PVS]]

### 7.4. [[ECO|ECO - Engineering Change Order]]
- [[Functional ECO]]
- [[Timing ECO]]
- [[Metal-Only ECO]]
- [[Spare Cells]]

---
## 8. [[Tape Out & Manufacturing]]
*Sending the final design to the foundry.*
- [[GDSII or OASIS]]
- [[Foundry]]
  - [[TSMC]]
  - [[Samsung]]
  - [[Intel]]
- [[Mask Generation]]
- [[Wafer Sort]]
- [[Packaging]]

---
## 9. [[Post-Silicon Validation]]
*Testing the manufactured chip in a lab environment.*
- [[Bring-Up]]
- [[Characterization]]
- [[Shmoo Plots]]
- [[ATE | ATE - Automated Test Equipment]]
- [[Failure Analysis | FA - Failure Analysis]]
- [[Yield Analysis]]

---
## 10. [[Recommended Resources]]

### Books
- **Digital Design & Computer Architecture**
    - *Computer Architecture: A Quantitative Approach* by John L. Hennessy & David A. Patterson
    - *Digital Design and Computer Architecture* by David Money Harris & Sarah L. Harris
    - *Computer Organization and Design* by David A. Patterson & John L. Hennessy
- **HDL (Verilog/VHDL/SystemVerilog)**
    - *Digital Design: With an Introduction to the Verilog HDL, VHDL, and SystemVerilog* by M. Morris Mano & Michael D. Ciletti
    - *RTL Modeling with SystemVerilog for Simulation and Synthesis* by Stuart Sutherland
    - *The Designer's Guide to VHDL* by Peter J. Ashenden
- **Functional Verification & UVM**
    - *SystemVerilog for Verification: A Guide to Learning the Testbench Language Features* by Chris Spear
    - *The UVM Primer: A Step-by-Step Introduction to the Universal Verification Methodology* by Ray Salemi
    - *Cracking Digital VLSI Verification Interview* by Ramdas Mozhikunnath
- **Synthesis & Static Timing Analysis (STA)**
    - *Advanced ASIC Chip Synthesis: Using Synopsys® Design Compiler™ and PrimeTime®* by Himanshu Bhatnagar
    - *Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)* by Sridhar Gangadharan & Sanjay Churiwala
    - *Static Timing Analysis for Nanometer Designs: A Practical Approach* by J. Bhasker & Rakesh Chadha
    - *Logic Synthesis and Verification* by Soha Hassoun & Tsutomu Sasao
- **Physical Design**
    - *Physical Design Essentials: An ASIC Design Implementation Perspective* by Khosrow Golshan
    - *CMOS VLSI Design: A Circuits and Systems Perspective* by Neil Weste & David Harris
- **Power Integrity**
    - *Power Integrity Analysis and Management for Integrated Circuits* by Raj Nair & Donald Bennett
    - *The Printed Circuit Designer's Guide to Power Integrity by Example* by Fadi Deek
- **Design for Test (DFT) & Post-Silicon Validation**
    - *Post-Silicon Validation and Debug* by Prabhat Mishra & Farimah Farahmandi
    - *The Small Book About Design-for-Test* by Juergen Alt
    - *VLSI Test Principles and Architectures* by Laung-Terng Wang, Cheng-Wen Wu, & Xiaoqing Wen

### Websites & Blogs
- [ChipEdge](https://chipedge.com/)
- [Wilson Snyder's Verilator Page](https://www.veripool.org/verilator/)
- [Sutherland HDL](https://www.sutherland-hdl.com/)
- [SemiEngineering](https://semiengineering.com/)
- [Signoff Semiconductor](https://signoffsemiconductors.com/)
- [IEEE Xplore](https://ieeexplore.ieee.org/)
- [VLSI System Design](https://www.vlsisystemdesign.com/)
- [VLSI Expert](https://www.vlsiexpert.com/)
- [Team VLSI](https://teamvlsi.com/)

---
## 11. [[Key File Formats]]
| Extension(s) | Full Name | Description |
|---|---|---|
| `.v`, `.vh`, `.sv`, `.svh` | [[Verilog]] / [[SystemVerilog]] | [[RTL]] or [[Gate-Level Netlist]] |
| `.vhd`, `.vhdl` | [[VHDL]] | [[RTL]] or [[Gate-Level Netlist]] |
| `.sdc` | [[SDC|Synopsys Design Constraints]] | Timing, power, and area constraints |
| `.lib`, `.db` | Liberty [[Timing Library]] | Standard cell timing and power models |
| `.lef` | [[LEF|Library Exchange Format]] | Physical abstract view of cells/macros |
| `.def` | [[DEF|Design Exchange Format]] | Physical layout data (placement, routing) |
| `.spef` | [[SPEF|Standard Parasitic Exchange Format]] | Extracted parasitic R and C values |
| `.gds`, `.gdsii`, `.oas` | [[GDSII or OASIS]] | Final layout database for manufacturing |
| `.upf`, `.cpf` | [[UPF|Unified]]/[[CPF|Common Power Format]] | Low-power design intent |
| `.tf` | [[Technology File]] | Foundry process layer information |
| `.vcd`, `.saif` | [[Activity Vectors]], Value Change Dump , SAIF | Switching activity for power analysis |

---
## 12. [[Key EDA Tools]]
| Design Stage | Synopsys | Cadence | Siemens EDA |
|---|---|---|---|
| **[[RTL Design]]** | VCS | Xcelium | Questa |
| **[[Synthesis]]** | Fusion Compiler, Design Compiler | Genus | Tessent Synthesis |
| **[[Functional Verification | Formal Verification (LEC)]]** | Formality | Conformal LEC | Tessent Formal |
| **[[STA|Static Timing Analysis (STA)]]** | PrimeTime (PT) | Tempus | Tessent Shell with STA |
| **[[DFT|Design for Test (DFT)]]** | TestMAX | Modus | Tessent |
| **[[Physical Design]]** | IC Compiler II (ICC2) | Innovus | Aprisa |
| **[[SPEF|Parasitic Extraction]]** | StarRC | Quantus | Calibre xACT |
| **[[Physical Verification]] (DRC/LVS)** | IC Validator (ICV), Hercules | Pegasus | Calibre |
| **[[Power Signoff]]** | PrimePower, RedHawk (Ansys) | Voltus | Calibre PERC, mPower |

---
## 13. [[Frontend Interview Questions]]
*Basic Questions for each topic for checking the knowledge level. Do you know them all?*
- **[[RTL Design]]**
    - Explain the difference between [[Verilog]] and [[SystemVerilog]].
    - Design a synchronous [[Asynchronous FIFOs|FIFO]].
    - How do you handle [[CDC|Clock Domain Crossing (CDC)]]?
    - What is the difference between [[Blocking vs Non-blocking assignments|blocking and non-blocking assignments]]?
    - Design a Mealy Machine and a Moore Machine for a given sequence detector.
- **[[Verification]]**
    - What are the main components of a [[UVM|UVM testbench]]?
    - Explain the difference between [[Functional Coverage]] and [[Code Coverage]].
    - What is an [[SVA|assertion]]? Give an example.
    - What is [[Constrained Random Verification]]?
- **[[Synthesis]]**
    - What happens during [[Logic Optimization|Logic Synthesis]]?
    - What is a [[WLM|wire load model]]? Why is it inaccurate?
    - Explain what a [[critical path]] is.
    - How can you reduce [[Dynamic Power]] in your RTL code?

---
## 14. [[Backend Interview Questions]]
- **[[Physical Design]]**
    - What are the inputs and outputs of the [[Floorplanning & Power Planning|floorplanning]] stage?
    - What is [[Congestion Analysis|routing congestion]] and how do you fix it?
    - Explain the goals of [[CTS|Clock Tree Synthesis (CTS)]].
    - What is the difference between [[Global Routing]] and [[Detailed Routing]]?
- **[[STA|Static Timing Analysis (STA)]]**
    - Explain [[Setup]] and [[Hold]].
    - How do you fix a [[Setup|setup violation]]? How do you fix a [[Hold|hold violation]]?
    - Why is [[Hold]] independent of the clock period?
    - What is the difference between [[BC-WC|Best-Case - Worst-Case Analysis]] analysis and [[OCV|OCV]]?
    - Explain the concept of [[PVT Corners]]. Why do we need to close timing on all of them?
    - Explain [[Crosstalk Delay]] and [[Noise|Crosstalk Glitch]]. How does crosstalk affect setup and hold?
    - What is [[Useful Skew]] and how can it be used to help fix setup violations?
    - What are Max [[Transition]] and Max [[Capacitance]] violations, and how do you fix them?
    - What is the difference between [[AOCV|AOCV]] and [[POCV|POCV]]?
    - Describe how you would debug a [[Timing Paths|timing path]]. What information do you look for in the report?
- **[[Power Signoff]] & [[Physical Verification]]**
    - What is [[IR Drop]]? Differentiate between static and dynamic IR drop.
    - What is [[Electromigration|electromigration (EM)]]?
    - What is the difference between [[DRC|DRC]] and [[LVS|LVS]]?
    - What is the [[Antenna Effect]] and how is it fixed?
- **[[ECO]]**
    - When would you perform an [[ECO|ECO]]?
    - What is a [[Metal-Only ECO]] and why is it preferred?
