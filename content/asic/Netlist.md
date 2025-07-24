---
title: Netlist
description: Netlist in VLSI Static Timing Analysis (STA)
date: 2025-07-24
tags:
  - VLSI
  - STA
  - Design Flow
aliases:
  - Netlist
---

# Netlist in VLSI Static Timing Analysis (STA)

## Simple Explanation (Gist)
A netlist is a textual description of a digital circuit's connectivity, listing all the components (gates, flip-flops) and how they are interconnected. In [[STA|Static Timing Analysis]], the netlist provides the structural information of the design to be analyzed.

## Detailed Breakdown

*   **Concept**: The netlist is a fundamental representation of a digital circuit. It is essentially a list of instances (components) and their connections (nets). It describes the logical and physical connectivity of the design.

*   **Types of Netlists in VLSI Design Flow**: 
    *   **RTL Netlist**: This is the output of the RTL elaboration phase, representing the design in terms of high-level behavioral constructs and instantiated modules. It is primarily used for [[Functional Verification]] and as input to [[Synthesis]].
    *   **[[Gate-Level Netlist]]**: This is the output of the [[Synthesis]] stage. It describes the design in terms of technology-specific standard cells (e.g., AND gates, OR gates, flip-flops) from the [[Standard Cell Library]]. Each gate is instantiated, and its input and output pins are connected to specific nets. This is the primary netlist used for [[Physical Design]] and [[STA|Static Timing Analysis]].
    *   **Post-Layout Netlist**: After physical design (placement and routing), the netlist may be updated to reflect any changes made during optimization (e.g., buffer insertions, cell sizing). This netlist, along with extracted parasitics, is used for final timing signoff.

*   **Key Information in a Netlist**: 
    *   **Module/Sub-circuit Definitions**: Defines the top-level module and any hierarchical sub-modules.
    *   **Instance Declarations**: Lists all the standard cells, macros, and other components used in the design, along with their unique instance names.
    *   **Port Connections**: Specifies how the input and output ports of each instance are connected to the nets.
    *   **Net Declarations**: Declares all the wires (nets) that connect the different instances.
    *   **Attributes**: May include various attributes for timing, power, or physical design purposes (e.g., `dont_touch`, `dont_use`).

*   **Format**: Netlists are typically represented in [[Verilog]] or [[VHDL]] format, even though they describe a gate-level implementation rather than behavioral RTL.

    ```verilog
    // Example snippet of a gate-level netlist
    module top (
        input  in1,
        input  in2,
        output out1
    );

        // Instance of an AND gate
        AND2X1 U1 (.A(in1), .B(in2), .Y(net_0));

        // Instance of an Inverter
        INVX1 U2 (.A(net_0), .Y(out1));

    endmodule
    ```

*   **Role in STA**: In [[STA|Static Timing Analysis]], the netlist provides the structural information of the design. The STA tool traverses the netlist to identify all possible timing paths (e.g., register-to-register, input-to-register, register-to-output, input-to-output). It then combines this structural information with timing data from the [[Timing Library]] and parasitic information (from [[SPEF]]) to calculate delays and check for timing violations.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [VLSI Design and Test](https://www.amazon.com/VLSI-Design-Test-S-K-Kataria/dp/818527403X)
*   [Gate-Level Netlist on Wikipedia](https://en.wikipedia.org/wiki/Gate-level_netlist)