---
title: Scan Insertion
description: Explanation of Scan Insertion in Design for Test (DFT).
date: 2025-07-24
tags: [ASIC, DFT, Testing]
aliases: [Scan Stitching]
---

# Scan Insertion

## Simple Explanation (Gist)
Scan insertion is the process of modifying a digital design by replacing standard sequential elements (flip-flops and latches) with their scan-enabled equivalents and then connecting these scan flip-flops into [[Scan Chains]], making the design testable.

## Detailed Breakdown

*   **Purpose**: The primary goal of scan insertion is to transform a functional design into a testable design by providing a mechanism to easily control and observe the internal states of the circuit. This is a crucial step in the [[DFT|Design for Test]] flow, enabling efficient manufacturing testing.

*   **Inputs**: The main inputs to the scan insertion process are:
    *   **[[Gate-Level Netlist]]**: The synthesized netlist of the design.
    *   **[[Timing Library]]**: Contains information about the scan flip-flops and their timing characteristics.
    *   **[[SDC|Synopsys Design Constraints (SDC)]]**: Specifies clock definitions, scan chain requirements, and other test-related constraints.
    *   **DFT Specifications**: Defines the number of scan chains, scan chain order, and other DFT-specific rules.

*   **Process/Steps**:
    1.  **Scan Flip-Flop Replacement**: All or a subset of the sequential elements (flip-flops and latches) in the design are replaced with their scan-equivalent versions. These scan flip-flops have an additional scan data input (SI) and a scan enable (SE) control signal.
    2.  **Scan Chain Stitching**: The scan flip-flops are then connected serially to form one or more [[Scan Chains]]. The scan output (SO) of one flip-flop is connected to the scan input (SI) of the next, creating a shift register.
    3.  **Scan I/O Connection**: Dedicated scan input (SI) and scan output (SO) pins are added to the chip, and the scan chains are connected to these pins.
    4.  **Scan Enable (SE) Signal Routing**: A global scan enable signal (SE) is routed to all scan flip-flops, controlling whether they operate in functional mode or scan mode.
    5.  **Clocking and Reset Handling**: Proper handling of clocks and resets during scan operations is ensured. This might involve adding test clocks or modifying reset logic.
    6.  **DFT Rule Checking**: After insertion, various DFT rules are checked to ensure the scan chains are correctly formed, free of violations, and meet testability requirements.

*   **Key Considerations**:
    *   **Area Overhead**: Scan insertion adds area due to the additional multiplexers in scan flip-flops and the routing of scan chains and the SE signal. This overhead is typically justified by the testability benefits.
    *   **Timing Impact**: The added multiplexer introduces a small delay in the functional path, which must be considered during [[STA|timing analysis]]. Scan chains also introduce new timing paths that need to be constrained and verified.
    *   **Power Impact**: Shifting data through long scan chains can lead to high power consumption during test mode, which needs to be managed (e.g., using [[Scan Compression]] or low-power scan techniques).
    *   **Test Point Insertion**: In some cases, additional test points (e.g., observation points, control points) might be inserted to improve testability of hard-to-test logic.

*   **Tools**: Automated EDA tools (e.g., Synopsys TestMAX, Cadence Modus, Siemens Tessent) perform scan insertion. These tools are highly sophisticated and can handle complex designs with multiple clocks, power domains, and hierarchical structures.

## Further Reading

*   [VLSI Test Principles and Architectures](https://www.amazon.com/VLSI-Test-Principles-Architectures-Wang/dp/0123706015)
*   [The Small Book About Design-for-Test](https://www.amazon.com/Small-Book-About-Design-Test-Juergen/dp/1732267909)