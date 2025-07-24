---
title: Synthesis
description: Explanation of Synthesis in ASIC design flow.
date: 2025-07-24
tags: [ASIC, Frontend, Synthesis]
aliases: [Logic Synthesis]
---

# Synthesis

## Simple Explanation (Gist)
Synthesis is the process in ASIC design where the high-level behavioral description of a digital circuit (written in [[RTL Design|RTL]] using [[HDL|Hardware Description Languages]]) is automatically translated into a technology-specific [[Gate-Level Netlist]] composed of standard cells from a [[Standard Cell Library]].

## Detailed Breakdown

*   **Purpose**: Synthesis bridges the gap between the abstract functional description of a chip and its physical implementation. It transforms the RTL code into a netlist of logic gates and flip-flops that can be physically laid out on silicon, while optimizing for performance, power, and area (PPA).

*   **Inputs**: The primary inputs to the synthesis process are:
    1.  **[[RTL Design|RTL Code]]**: The behavioral description of the digital circuit (e.g., [[Verilog]], [[VHDL]], [[SystemVerilog]]).
    2.  **[[Standard Cell Library]]**: Contains the functional, timing, and physical characteristics of all available logic gates and sequential elements for a specific technology node.
    3.  **[[SDC|Synopsys Design Constraints (SDC)]]**: Specifies the design goals, including clock definitions, input/output delays, timing exceptions, and design rules (e.g., max transition, max capacitance).
    4.  **Technology File**: Provides information about the manufacturing process.

*   **Key Steps in Synthesis**:
    1.  **Translation/Parsing**: The synthesis tool reads the RTL code and translates it into an internal representation, often a generic Boolean network.
    2.  **Logic Optimization**: This is the core of synthesis. The tool applies various algorithms to optimize the Boolean network for PPA targets. This includes:
        *   **Boolean Optimization**: Simplifying logic expressions.
        *   **Technology Mapping**: Replacing generic logic gates with specific standard cells from the target library that implement the same function.
        *   **Gate Sizing**: Selecting appropriate drive strengths for cells to meet timing and power goals.
        *   **[[Register Retiming]]**: Moving flip-flops across combinational logic to balance delays and improve clock frequency.
        *   **[[Clock Gating|Clock Gating Insertion]]**: Adding clock gating cells to reduce dynamic power consumption.
        *   **[[WLM|Wire Load Models (WLM)]]**: Estimating wire delays based on fanout and distance to account for interconnect parasitics (though less accurate than post-layout extraction).
    3.  **Design Rule Checking (DRC)**: Ensures that the generated netlist adheres to basic design rules (e.g., maximum fanout, maximum transition time).
    4.  **Output Generation**: The primary output is the [[Gate-Level Netlist]] (e.g., in Verilog or EDIF format), which describes the instantiated standard cells and their interconnections. Other outputs include timing reports, power reports, and area reports.

*   **Types of Synthesis**:
    *   **Logical Synthesis**: Focuses purely on logical optimization and mapping to standard cells, without considering physical placement.
    *   **[[Physical Synthesis]]**: Integrates some physical awareness (e.g., placement information) into the synthesis process to make more accurate timing and congestion predictions, leading to better correlation with post-layout results.
    *   **[[Hierarchical Synthesis]]**: Breaking down a large design into smaller, manageable blocks that are synthesized independently and then integrated.
        *   **[[Bottom-up Synthesis]]**: Synthesizing sub-blocks first and then integrating them into the top-level.
        *   **[[Top-down Synthesis]]**: Synthesizing the top-level first, then breaking down and synthesizing sub-blocks.
        *   **[[Incremental Synthesis]]**: Re-synthesizing only the modified parts of a design to reduce turnaround time during iterations.

*   **Low Power Synthesis**: Modern synthesis tools incorporate techniques to reduce power consumption, such as [[Power Gating|power gating]], [[Multi-voltage Design|multi-voltage design]], and insertion of [[Isolation Cells]] and [[Level Shifters]].

*   **Tools**: Leading synthesis tools include Synopsys Design Compiler (and Fusion Compiler), Cadence Genus, and Siemens Tessent Synthesis.

## Further Reading

*   [Advanced ASIC Chip Synthesis: Using Synopsys® Design Compiler™ and PrimeTime®](https://www.amazon.com/Advanced-ASIC-Chip-Synthesis-Compiler/dp/0387719257)
*   [Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC)](https://www.amazon.com/Constraining-Designs-Synthesis-Timing-Analysis/dp/1461404990)