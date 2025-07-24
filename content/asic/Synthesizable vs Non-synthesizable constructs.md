---
title: Synthesizable vs Non-synthesizable constructs
description: Explanation of Synthesizable vs Non-synthesizable constructs in HDL.
date: 2025-07-24
tags: [ASIC, RTL Design, Synthesis]
aliases: [Synthesizable HDL, Non-synthesizable HDL]
---

# Synthesizable vs Non-synthesizable constructs

## Simple Explanation (Gist)
In [[HDL|Hardware Description Languages]] like [[Verilog]] or [[VHDL]], synthesizable constructs are those that can be directly translated by a [[Synthesis]] tool into physical hardware (logic gates and flip-flops), while non-synthesizable constructs are primarily for [[Simulation]] and cannot be implemented in actual silicon.

## Detailed Breakdown

*   **Synthesizable Constructs**: These are HDL constructs that have a direct hardware equivalent. A synthesis tool can interpret these constructs and map them to a [[Gate-Level Netlist]] using cells from a [[Standard Cell Library]].

    *   **Examples of Synthesizable Constructs**:
        *   **Combinational Logic**: `assign` statements (Verilog), `always @(*)` or `always @(posedge clk or negedge rst)` blocks (Verilog) that infer combinational logic (e.g., `if-else`, `case` statements without memory).
        *   **Sequential Logic**: `always @(posedge clk)` or `always @(negedge clk)` blocks that infer flip-flops (e.g., `q <= d;`).
        *   **Basic Gates**: Explicit instantiation of logic gates (e.g., `and`, `or`, `xor`).
        *   **Arithmetic Operators**: `+`, `-`, `*`, `/` (though division and multiplication can be complex to synthesize).
        *   **Comparison Operators**: `==`, `!=`, `<`, `>`.
        *   **Bitwise Operators**: `&`, `|`, `^`, `~`.
        *   **Concatenation and Replication**: `{ }`.
        *   **Parameters and Localparams**: For design configurability.

*   **Non-synthesizable Constructs**: These constructs are useful for modeling complex behavior, creating [[Testbench|testbenches]], or for verification purposes. However, they do not have a direct hardware equivalent and cannot be translated into physical gates by a synthesis tool. Attempting to synthesize them will result in errors or unexpected hardware.

    *   **Examples of Non-synthesizable Constructs**:
        *   **Timing Control**: `#delay` (e.g., `assign #5 out = in;`). Synthesis tools do not understand absolute delays; they rely on timing libraries.
        *   **File I/O Operations**: `display`, `monitor`, `fopen`, `fwrite`, `readmemb`, `readmemh`. These are for simulation output and input.
        *   **Initial Blocks**: `initial` blocks are executed only once at the beginning of simulation and do not represent hardware that can be reset or clocked.
        *   **`force` and `release`**: Used to override signal values during simulation for debugging.
        *   **`wait` statements**: Used to pause simulation until a condition is met.
        *   **`fork-join`**: For parallel execution in simulation.
        *   **`specify` blocks**: Used for specifying timing delays for simulation, not for synthesis.
        *   **`real` data type**: Floating-point numbers are not directly implementable in digital hardware.

*   **Why the Distinction is Important**:
    *   **Correct Hardware Implementation**: Using only synthesizable constructs ensures that the hardware built matches the intended design.
    *   **Predictable Behavior**: Synthesizable code leads to predictable timing and functionality after implementation.
    *   **Tool Compatibility**: Adhering to synthesizable subsets ensures compatibility with synthesis tools.
    *   **Verification**: Non-synthesizable constructs are vital for creating robust [[Testbench|testbenches]] and verification environments, allowing designers to thoroughly test the synthesizable [[RTL Design|RTL]].

*   **Coding Guidelines**: Designers often follow specific coding guidelines (e.g., always use `always @(posedge clk)` for flip-flops, avoid `initial` blocks in RTL) to ensure their code is synthesizable and produces the desired hardware.

## Further Reading

*   [Digital Design: With an Introduction to the Verilog HDL, VHDL, and SystemVerilog](https://www.amazon.com/Digital-Design-Introduction-SystemVerilog-International/dp/013446027X)
*   [RTL Modeling with SystemVerilog for Simulation and Synthesis](https://www.amazon.com/Modeling-SystemVerilog-Simulation-Synthesis-Sutherland/dp/1461404990)