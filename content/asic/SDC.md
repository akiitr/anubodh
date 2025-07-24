---
title: SDC
description: Explanation of Synopsys Design Constraints (SDC) in ASIC design.
date: 2025-07-24
tags: [ASIC, STA, Constraints]
aliases: [Synopsys Design Constraints]
---

# SDC (Synopsys Design Constraints)

## Simple Explanation (Gist)
SDC (Synopsys Design Constraints) is a standard format used in ASIC design to specify timing, power, and area requirements for a circuit. It tells the EDA tools how the design should behave and what performance targets it needs to meet, guiding synthesis, placement, routing, and [[STA|Static Timing Analysis]].

## Detailed Breakdown

*   **Purpose**: SDC commands are used to communicate the design intent and performance goals to various EDA tools throughout the ASIC design flow. Without proper constraints, tools cannot optimize the design effectively or accurately verify its timing.

*   **Key Functions of SDC**:
    1.  **Define Clocks**: Specifies clock characteristics such as period, waveform, and clock sources. This is fundamental for all timing analysis.
    2.  **Define Input/Output Delays**: Describes the timing relationship between the chip's external pins and internal logic, accounting for delays in the external circuitry.
    3.  **Specify Timing Exceptions**: Allows designers to override default timing analysis for specific paths that do not need to meet standard timing requirements (e.g., [[False Paths in STA|false paths]], [[Multicycle Paths|multicycle paths]]).
    4.  **Set Design Rules**: Defines maximum transition times, maximum capacitance loads, and other physical design rules that cells and nets must adhere to.
    5.  **Manage Operating Conditions**: Specifies the PVT (Process, Voltage, Temperature) corners under which the design must operate and meet timing.
    6.  **Define Power Intent**: With extensions like UPF (Unified Power Format), SDC can also specify power management strategies.

*   **Common SDC Commands**:
    *   `create_clock`: Defines a clock on a port or pin.
    *   `create_generated_clock`: Defines a clock derived from an existing clock.
    *   `set_input_delay`: Specifies the delay of a signal arriving at an input port.
    *   `set_output_delay`: Specifies the delay of a signal leaving an output port.
    *   `set_false_path`: Excludes a path from timing analysis.
    *   `set_multicycle_path`: Specifies that a path can take more than one clock cycle.
    *   `set_max_delay`, `set_min_delay`: Sets explicit maximum or minimum delays for specific paths.
    *   `set_max_transition`: Sets the maximum allowed transition time (slew) on a net.
    *   `set_max_capacitance`: Sets the maximum allowed capacitance load on a cell output.
    *   `set_driving_cell`: Models the driving strength of an external pin.
    *   `set_load`: Models the capacitance load on an output pin.
    *   `set_case_analysis`: Specifies constant values for certain pins or nets for specific analysis modes.

*   **Importance in the Flow**:
    *   **[[Synthesis]]**: Guides the synthesis tool in optimizing the RTL into a gate-level netlist that meets timing goals.
    *   **[[Physical Design]]**: Informs placement and routing tools about critical paths, helping them make decisions that improve timing closure.
    *   **[[STA|Static Timing Analysis]]**: Provides the necessary constraints for the STA tool to perform accurate timing verification and report violations.
    *   **[[SDC Checks|SDC Checks]]**: Essential for validating the correctness and completeness of the constraints themselves.

*   **Format**: SDC is a Tcl-based format, making it scriptable and flexible.

## Further Reading

*   [Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)](https://www.amazon.com/Constraining-Designs-Synthesis-Timing-Analysis/dp/1461404990)
*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs-J-Bhasker/dp/0387719257)