---
title: Finite State Machines (FSM)
description: Finite State Machines (FSM) in VLSI RTL Design
date: 2025-07-24
tags:
  - VLSI
  - RTL Design
  - Digital Logic
aliases:
  - FSM
---

# Finite State Machines (FSM) in VLSI RTL Design

## Simple Explanation (Gist)
A Finite State Machine (FSM) is a mathematical model of computation used to design digital circuits that behave differently based on their current state and input, transitioning between a finite number of states.

## Detailed Breakdown

*   **Definition**: An FSM is a model of computation that can be in exactly one of a finite number of states at any given time. It can change from one state to another in response to some inputs; the change from one state to another is called a transition. An FSM is defined by a list of its states, its initial state, and the conditions for each transition.

*   **Components of an FSM**: 
    *   **States**: A finite set of distinct conditions or modes in which the system can exist.
    *   **Inputs**: Signals that cause transitions between states.
    *   **Outputs**: Signals produced by the FSM, which can depend on the current state, inputs, or both.
    *   **Transitions**: Rules that define how the FSM moves from one state to another based on current state and inputs.
    *   **Initial State**: The state in which the FSM begins operation.

*   **Types of FSMs**: 
    *   **[[Mealy Machine]]**: The outputs of a Mealy machine depend on both the current state and the current inputs. Outputs can change as soon as inputs change.
    *   **[[Moore Machine]]**: The outputs of a Moore machine depend only on the current state. Outputs change only when the state changes.

*   **FSM Design Flow in RTL**: 
    1.  **State Diagram**: Define the behavior of the FSM using a state diagram, which graphically represents states, transitions, and outputs.
    2.  **State Encoding**: Assign unique binary codes to each state (e.g., one-hot, binary, Gray encoding).
    3.  **Next State Logic**: Implement combinational logic that determines the next state based on the current state and inputs.
    4.  **Output Logic**: Implement combinational logic that determines the outputs based on the current state (Moore) or current state and inputs (Mealy).
    5.  **State Register**: Use flip-flops to store the current state, synchronized by a clock signal.

*   **RTL Implementation**: FSMs are commonly implemented in [[Verilog]], [[VHDL]], or [[SystemVerilog]] using a three-process (or two-process) model:
    *   **Combinational Next State Logic**: A `always_comb` (SystemVerilog) or `always @(*)` (Verilog) block for next state logic.
    *   **Sequential State Register**: A `always_ff` (SystemVerilog) or `always @(posedge clk or negedge rst_n)` (Verilog) block for state updates.
    *   **Combinational Output Logic**: A `always_comb` or `assign` statement for outputs (for Mealy, this might also depend on inputs).

*   **Applications**: FSMs are fundamental building blocks in digital design and are used extensively in:
    *   **Control Units**: Managing the sequence of operations in a processor or data path.
    *   **Protocol Handlers**: Implementing communication protocols (e.g., UART, SPI, I2C).
    *   **Arbiters**: Managing access to shared resources.
    *   **Sequence Detectors**: Recognizing specific input patterns.

## Further Reading

*   [Digital Design and Computer Architecture](https://www.amazon.com/Digital-Design-Computer-Architecture-Fifth/dp/0128200642)
*   [Finite-state machine on Wikipedia](https://en.wikipedia.org/wiki/Finite-state_machine)