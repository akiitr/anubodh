---
title: Microarchitecture
---
The [[Microarchitecture]] (μarch) specification bridges the abstract [[Functional Specification]] (the "what") with a concrete hardware implementation (the "how"). It serves as the master blueprint for the [[RTL Design]] team, detailing the chip's internal organization.

### Key Elements
*   **High-Level Block Diagram**: A top-down view showing major functional units ([[CPU]], [[GPU]], memory controllers, [[I-O Specification]] blocks) and how they connect via a [[NoC|system bus or Network-on-Chip (NoC)]].
*   **[[Data Path Design]]**: Defines the pathways for data movement, including bus widths, protocols (e.g., AMBA AXI), and interconnect structure.
*   **[[Control Logic]]**: Describes the logic that orchestrates operations, often using Finite State Machines ([[FSM]]), decoders, and arbiters.
*   **[[Execution Units]]**: Specifies the number and type of computational units (ALUs, FPUs, etc.) within processing blocks.
*   **Design [[Partitioning]]**: Logically divides the design into manageable modules to facilitate parallel development, design reuse, and complexity management. This aids in [[Floorplanning & Power Planning]].

### [[PPA]] Trade-offs
The [[Microarchitecture]] is the result of trade-offs made to meet the competing [[PPA]] and [[Cost Target]] constraints. For example, a high-performance requirement might be met by a deep [[Pipeline Design]] and high [[Clock Frequency]], at the cost of higher power consumption and larger [[Area]].

### Example High-Level SoC Diagram
``` mermaid
graph TD
    subgraph SoC
        CPU_Complex[CPU Core Complex]
        GPU_Core[GPU Core]
        Memory_Ctrl[Memory Hierarchy]
        PCIe_Ctrl[PCIe Controller]
        Other_IO[Other Peripherals]
        NOC[System Bus / NOC]

        CPU_Complex -- AXI Bus --> NOC;
        GPU_Core -- AXI Bus --> NOC;
        Memory_Ctrl -- AXI Bus --> NOC;
        PCIe_Ctrl -- AXI Bus --> NOC;
        Other_IO -- APB/AXI Bus --> NOC;
    end

    Memory_Ctrl -->|DFI| PHY_DDR[DDR PHY];
    PHY_DDR --> External_DRAM((DDR SDRAM));
    PCIe_Ctrl -->|PIPE| PHY_PCIe[PCIe PHY];
    PHY_PCIe --> External_PCIe((PCIe Slot));
```
