---
title: Netlist Input
description: Netlist Input in VLSI Physical Design
date: 2025-07-24
tags:
  - VLSI
  - Physical Design
  - Design Flow
aliases:
  - Netlist Input
---

# Netlist Input in VLSI Physical Design

## Simple Explanation (Gist)
Netlist input refers to the logical description of a digital circuit, typically in the form of a [[Gate-Level Netlist]], which serves as the primary input for the [[Physical Design]] stage in VLSI ASIC design.

## Detailed Breakdown

*   **Concept**: The netlist is a textual representation of the circuit's connectivity, detailing all the instances of standard cells (e.g., AND gates, OR gates, flip-flops) and their interconnections (nets). It is the output of the [[Synthesis]] stage and the starting point for physical implementation.

*   **Types of Netlists**: 
    *   **Gate-Level Netlist**: This is the most common type of netlist used for physical design. It describes the circuit in terms of technology-specific standard cells from the [[Standard Cell Library]]. Each gate is instantiated, and its input and output pins are connected to specific nets.
    *   **RTL Netlist (for formal verification)**: While not directly used for physical design, an RTL netlist (the output of RTL elaboration) is used in [[Formal Verification]] tools for equivalence checking against the gate-level netlist.

*   **Key Information in a Netlist**: 
    *   **Module/Sub-circuit Definitions**: Defines the top-level module and any hierarchical sub-modules.
    *   **Instance Declarations**: Lists all the standard cells and macros used in the design, along with their unique instance names.
    *   **Port Connections**: Specifies how the input and output ports of each instance are connected to the nets.
    *   **Net Declarations**: Declares all the wires (nets) that connect the different instances.
    *   **Attributes**: May include various attributes for timing, power, or physical design purposes.

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

*   **Role in Physical Design**: The netlist is the blueprint for the physical layout. Physical design tools use the netlist to:
    *   **[[Floorplanning & Power Planning|Floorplan]]** the chip, determining the overall layout and placement of major blocks.
    *   **[[Placement]]** of standard cells and macros onto the silicon.
    *   **[[CTS|Clock Tree Synthesis]]**, building the clock distribution network.
    *   **[[Routing]]** the interconnections between all the cells.

*   **Sanity Checks**: Before proceeding with physical design, various [[Sanity Checks]] are performed on the netlist to ensure its integrity and correctness. These include checking for:
    *   [[Floating Nets and Pins|Floating nets and pins]].
    *   [[Multi-driven Nets]].
    *   [[Combinational Loops|Combinational loops]].
    *   Consistency with the [[Timing Library]] and [[SDC|SDC]].

## Further Reading

*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Engineering/dp/0471721426)
*   [Digital Design and Computer Architecture](https://www.amazon.com/Digital-Design-Computer-Architecture-Harris/dp/0123944244)
*   [Gate-Level Netlist on Wikipedia](https://en.wikipedia.org/wiki/Gate-level_netlist)