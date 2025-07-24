---
title: Tape Out & Manufacturing
description: Explanation of Tape Out and Manufacturing in ASIC design flow.
date: 2025-07-24
tags: [ASIC, Manufacturing, Tape Out]
aliases: [Tapeout, Chip Manufacturing]
---

# Tape Out & Manufacturing

## Simple Explanation (Gist)
Tape out is the final stage in ASIC design where the completed, verified design data is sent to a semiconductor [[Foundry]] for physical fabrication. Manufacturing then involves a series of complex steps to transform this design into a functional silicon chip.

## Detailed Breakdown

*   **Tape Out**: This is the point of no return in the ASIC design flow. It signifies that the design is complete, has passed all [[Sign Off|sign-off]] checks (timing, power, physical verification), and is ready to be handed over to the foundry.

    *   **Deliverables**: The primary deliverable at tape out is the **[[GDSII or OASIS]]** file (or a similar layout database format). This file contains the complete physical layout of the chip, including all layers of transistors, interconnects, vias, and pads. Other deliverables might include:
        *   Final [[Netlist]]
        *   [[SDC|Timing constraints]]
        *   Test patterns (for manufacturing test)
        *   Design documentation

    *   **Final Checks**: Before tape out, an exhaustive set of checks are performed, including:
        *   Final [[Physical Verification]] (DRC, LVS, ERC)
        *   Full-chip [[STA|Static Timing Analysis]]
        *   Full-chip [[Power Signoff]]
        *   Design for Manufacturability (DFM) checks

*   **Manufacturing Process**: Once the design data is received by the foundry, the manufacturing process begins, which involves several key stages:

    1.  **[[Mask Generation]]**: The GDSII/OASIS data is used to create a set of **photomasks**. Each mask corresponds to a specific layer of the chip (e.g., polysilicon, metal layers, diffusion). These masks are essentially stencils used to transfer the design patterns onto silicon wafers.

    2.  **Wafer Fabrication**: This is the core of the manufacturing process, performed in a cleanroom environment. It involves a series of repetitive steps to build up the chip layer by layer on a silicon **wafer**:
        *   **Deposition**: Adding thin films of material (e.g., silicon dioxide, metal) onto the wafer.
        *   **Photolithography**: Using UV light and the photomasks to transfer the circuit patterns onto the wafer.
        *   **Etching**: Removing unwanted material to define the circuit features.
        *   **Doping**: Introducing impurities to create P-type and N-type regions for transistors.
        *   **Planarization (CMP)**: Chemical Mechanical Planarization to create a flat surface for subsequent layers.
        *   These steps are repeated hundreds of times to build up the complex 3D structure of the chip.

    3.  **[[Wafer Sort]] (Electrical Test)**: After fabrication, each individual chip (die) on the wafer undergoes electrical testing. Probes make contact with the pads of each die, and functional and structural tests are run to identify defective chips. Defective dies are marked (e.g., with an ink dot).

    4.  **Dicing**: The wafer is cut into individual dies (chips) using a high-precision saw.

    5.  **[[Packaging]]**: The good dies are then mounted into a protective package. This package provides electrical connections to the outside world (pins or balls) and protects the delicate silicon die from environmental damage.

    6.  **Final Test**: After packaging, the individual packaged chips undergo a final, more comprehensive electrical test to ensure they meet all specifications and are fully functional. This is often performed using [[ATE|Automatic Test Equipment]].

    7.  **Binning**: Based on the final test results, chips are sorted into different bins according to their performance (e.g., speed grade, power consumption) and yield.

## Further Reading

*   [CMOS VLSI Design: A Circuits and Systems Perspective](https://www.amazon.com/CMOS-VLSI-Design-Circuits-Perspective/dp/0321547748)
*   [The Essential Guide to Semiconductors](https://www.amazon.com/Essential-Guide-Semiconductors-Jim-Turley/dp/013046404X)