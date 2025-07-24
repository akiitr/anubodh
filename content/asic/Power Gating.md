---
title: Power Gating
description: Power Gating in VLSI Low Power Design
date: 2025-07-24
tags:
  - VLSI
  - Low Power Design
  - Power Management
aliases:
  - Power Gating
---

# Power Gating in VLSI Low Power Design

## Simple Explanation (Gist)
Power gating is a [[Low Power Design]] technique that reduces static (leakage) power consumption by selectively turning off the power supply to inactive blocks or modules of a chip during idle periods.

## Detailed Breakdown

*   **Motivation**: As technology nodes shrink, leakage current (static power) becomes a significant portion of the total power consumption, even when the circuit is not actively switching. Power gating addresses this by completely cutting off the power supply to non-essential blocks when they are not in use.

*   **Concept**: Instead of simply clock gating (which only reduces dynamic power by stopping switching activity), power gating physically disconnects the power supply (Vdd) or ground (Vss) to a block, effectively turning it off and eliminating its leakage power.

*   **Implementation**: 
    *   **Power Switches**: Special transistors (header switches for Vdd, footer switches for Vss) are inserted between the main power/ground rails and the power/ground rails of the gated block. These switches are controlled by a power-gating enable signal.
    *   **Retention Cells**: Flip-flops and latches within the gated domain that need to retain their state during the power-off period are replaced with special [[Retention Cells]]. These cells have a separate, always-on power supply to hold their data.
    *   **Isolation Cells**: When a block is powered down, its outputs can float or drive invalid logic levels into the always-on domain. [[Isolation Cells]] are inserted at the boundary between the power-gated domain and the always-on domain to prevent this, ensuring stable inputs to the active logic.
    *   **Power Gating Controller**: Dedicated control logic is required to manage the power-up and power-down sequences, including asserting/de-asserting the power switches, enabling/disabling retention, and controlling isolation cells.

    ```mermaid
    graph TD
        A[Main VDD] --> B{Header Switch};
        B --> C[Power Gated Block VDD];
        C --> D[Power Gated Block];
        D --> E{Isolation Cells};
        E --> F[Always-On Logic];
        G[Power Gating Enable] --> B;
        G --> E;
        H[Retention Power] --> I[Retention Cells in Gated Block];
    ```

*   **Power-Down Sequence**: 
    1.  Save state (if necessary) to retention registers.
    2.  Assert isolation cells.
    3.  Turn off power switches.

*   **Power-Up Sequence**: 
    1.  Turn on power switches.
    2.  De-assert isolation cells.
    3.  Restore state from retention registers.

*   **Advantages**: 
    *   **Significant Leakage Power Reduction**: The most effective technique for reducing static power consumption.
    *   **Improved Battery Life**: Crucial for portable and battery-powered devices.

*   **Disadvantages/Challenges**: 
    *   **Area Overhead**: Power switches, retention cells, and isolation cells add to the chip area.
    *   **Delay Overhead**: The power switches introduce resistance, leading to IR drop and increased delay during power-up/power-down transitions.
    *   **Power-Up/Power-Down Latency**: There is a time penalty associated with turning blocks on and off, which must be managed.
    *   **Design Complexity**: Requires careful planning, implementation, and [[Functional Verification]] to ensure correct operation and avoid functional errors.
    *   **In-rush Current**: A large current surge can occur during power-up as capacitors in the powered-down domain charge up. This needs to be managed to prevent power supply droop.

*   **Unified Power Format (UPF)**: Power gating intent is typically specified using [[UPF|Unified Power Format]], which guides EDA tools through the design flow.

## Further Reading

*   [Low Power Design in VLSI](https://www.vlsi-expert.com/2018/01/low-power-design-in-vlsi.html)
*   [CMOS VLSI Design: A Circuits and Systems Perspective](https://www.amazon.com/CMOS-VLSI-Design-Circuits-Perspective/dp/0321547748)
*   [Power Gating for Leakage Power Reduction](https://www.synopsys.com/glossary/what-is-power-gating.html)