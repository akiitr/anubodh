---
title: Finite State Machines (FSM)
description: Explanation of Finite State Machines (FSM) in digital design.
date: 2025-07-24
tags: [ASIC, RTL Design, Digital Circuits]
aliases: [FSM, Finite State Machine]
---

# Finite State Machines (FSM)

## Simple Explanation (Gist)
A Finite State Machine (FSM) is a mathematical model of computation used to design digital circuits that can be in one of a finite number of states at any given time, transitioning between these states based on inputs and producing outputs.

## Detailed Breakdown

*   **Concept**: An FSM is a sequential logic circuit whose output depends not only on the current inputs but also on its past inputs, represented by its current "state." It has a finite number of states, and at any given moment, it can only be in one of these states. The FSM transitions from one state to another based on specific input conditions.

*   **Components of an FSM**:
    1.  **States**: A finite set of distinct conditions or modes the system can be in. Each state represents a unique combination of past inputs that influences future behavior.
    2.  **Inputs**: Signals that cause transitions between states or influence outputs.
    3.  **Outputs**: Signals produced by the FSM, which can depend on the current state, current inputs, or both.
    4.  **Transitions**: Rules that define how the FSM moves from one state to another based on the current state and inputs.
    5.  **Start State**: The initial state of the FSM when it is reset or powered on.

*   **Types of FSMs**:
    1.  **Mealy Machine**: The outputs of a Mealy machine depend on both the current state and the current inputs. Outputs can change immediately when inputs change, even within a clock cycle.
        *   **Characteristics**: Outputs are associated with transitions.
        *   **Example**: A sequence detector where the output is asserted only when the specific sequence is detected *and* the current input matches the last element of the sequence.
    2.  **Moore Machine**: The outputs of a Moore machine depend only on the current state. Outputs are stable throughout the clock cycle and change only after a state transition.
        *   **Characteristics**: Outputs are associated with states.
        *   **Example**: A traffic light controller where the light (output) changes only when the state (e.g., Red, Yellow, Green) changes.

*   **FSM Design Process**:
    1.  **State Diagram**: A graphical representation showing states as nodes and transitions as directed edges, labeled with input conditions and outputs.
    2.  **State Table**: A tabular representation of the state diagram, listing current state, inputs, next state, and outputs.
    3.  **State Encoding**: Assigning unique binary codes to each state (e.g., binary encoding, Gray encoding, one-hot encoding).
    4.  **Next State Logic**: Deriving combinational logic equations for the next state based on the current state and inputs.
    5.  **Output Logic**: Deriving combinational logic equations for the outputs based on the current state (Moore) or current state and inputs (Mealy).
    6.  **Implementation**: Realizing the FSM using flip-flops (for state memory) and combinational logic gates.

*   **Applications in VLSI**: FSMs are fundamental building blocks in digital design and are used extensively for:
    *   **Control Units**: Managing the flow of data and operations in processors, peripherals, and complex digital systems.
    *   **Protocol Handlers**: Implementing communication protocols (e.g., UART, SPI, I2C).
    *   **Sequence Detectors**: Recognizing specific patterns in input streams.
    *   **Arbiters**: Managing access to shared resources.
    *   **Traffic Light Controllers**: Simple control systems.

*   **HDL Implementation**: FSMs are typically implemented in HDLs like [[Verilog]] or [[SystemVerilog]] using `always` blocks for sequential logic (state register) and `always @(*)` or `assign` for combinational logic (next state and output logic).

## Further Reading

*   [Finite-state machine on Wikipedia](https://en.wikipedia.org/wiki/Finite-state_machine)
*   [Digital Design and Computer Architecture](https://www.amazon.com/Digital-Design-Computer-Architecture-Harris/dp/0123944244)
*   [Designing with State Machines](https://www.fpga4fun.com/StateMachines.html)