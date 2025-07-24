---
title: Blocking vs Non-blocking Assignments
description: A detailed explanation of blocking and non-blocking assignments in Verilog, their behavior, use cases, and best practices in VLSI design.
date: 2025-07-23
tags: ["Verilog", "SystemVerilog", "HDL", "Digital Design", "VLSI"]
---

# Blocking vs Non-blocking Assignments

In [[Verilog]] and [[SystemVerilog]], understanding the difference between blocking (`=`) and non-blocking (`<=`) assignments is fundamental for correctly modeling hardware behavior. This distinction is crucial for avoiding simulation-synthesis mismatches and ensuring the intended functionality of your [[RTL Design|RTL]].

## 1. Blocking Assignments (`=`)

Blocking assignments execute sequentially, meaning each statement completes and updates its Left-Hand Side (LHS) before the next statement in the `always` block begins.

*   **Execution:** Statements are executed in the order they appear. The value on the Right-Hand Side (RHS) is evaluated, and the LHS is updated immediately.
*   **Behavior:** They "block" the execution of subsequent statements until the current assignment is complete.
*   **Use Case:** Primarily used for modeling [[Combinational Logic]] within `always` blocks, where the output depends solely on the current inputs.

**Example:**
```verilog
always @(a or b) begin
    x = a;
    y = x; // y gets the *new* value of x immediately
end
```
In this example, if `a` changes, `x` is updated, and then `y` is updated using the newly assigned value of `x`.

## 2. Non-blocking Assignments (`<=`)

Non-blocking assignments schedule updates to the LHS to occur at the end of the current simulation time step, after all RHS expressions in the current time step have been evaluated. They do not block the execution of subsequent statements within the same `always` block.

*   **Execution:** The RHS is evaluated at the beginning of the time step, and the LHS is updated at the end of the time step. This allows for parallel execution of assignments.
*   **Behavior:** They are "non-blocking" because they do not prevent other statements in the same block from being evaluated.
*   **Use Case:** Essential for modeling [[Sequential Logic]] (e.g., flip-flops, latches) where updates should appear to happen simultaneously on a clock edge. Using non-blocking assignments helps avoid [[Race Conditions]].

**Example:**
```verilog
always @(posedge clk) begin
    x <= a;
    y <= x; // y gets the *old* value of x from before this clock edge
end
```
In this example, `x` and `y` are updated concurrently. `y` receives the value `x` had *before* the current clock edge, not the new value `x` is receiving.

## 3. Key Differences & Best Practices

| Feature             | Blocking Assignments (`=`)                               | Non-blocking Assignments (`<=`)                               |
| :------------------ | :------------------------------------------------------- | :------------------------------------------------------------ |
| **Execution**       | Sequential; immediate update                             | Scheduled; update at end of time step                         |
| **Hardware Model**  | [[Combinational Logic]]                                  | [[Sequential Logic]] (e.g., flip-flops)                       |
| **Race Conditions** | Prone to race conditions if used for sequential logic    | Helps prevent race conditions                                 |
| **Behavior**        | "Blocking"                                               | "Non-blocking"                                                |

**Rule of Thumb:**
*   Use blocking assignments (`=`) for [[Combinational Logic]].
*   Use non-blocking assignments (`<=`) for [[Sequential Logic]].

Avoid mixing them for the same variable within the same `always` block. Non-blocking assignments more accurately represent the behavior of real hardware, where all register updates happen simultaneously on a clock edge.

## 4. Conclusion

The choice between blocking (`=`) and non-blocking (`<=`) assignments in [[Verilog]] is crucial for correctly modeling hardware behavior. Blocking assignments provide immediate, sequential updates suitable for [[Combinational Logic]], while non-blocking assignments schedule updates to occur concurrently at the end of a simulation time step, which is vital for accurately representing [[Sequential Logic]] like flip-flops and avoiding [[Race Conditions]]. Adhering to these best practices ensures robust and predictable [[RTL Design|RTL]] that translates correctly to physical hardware.

## Further Reading

*   **Digital Design: With an Introduction to the Verilog HDL, VHDL, and SystemVerilog** by M. Morris Mano & Michael D. Ciletti
*   **RTL Modeling with SystemVerilog for Simulation and Synthesis** by Stuart Sutherland
*   [Nandland - Blocking vs. Non-Blocking Assignments](https://www.nandland.com/blocking-vs-nonblocking-assignments.html)
*   [VLSI Verify - Blocking vs. Non-Blocking Assignments](https://www.vlsiverify.com/blocking-vs-non-blocking-assignments/)