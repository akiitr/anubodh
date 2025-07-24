---
title: UVM Agent
description: Explanation of UVM Agent in Universal Verification Methodology (UVM).
date: 2025-07-24
tags: [ASIC, Functional Verification, UVM]
aliases: [Agent, UVM Verification Component]
---

# UVM Agent

## Simple Explanation (Gist)
A UVM (Universal Verification Methodology) agent is a reusable, self-contained verification component that models the behavior of a specific interface in an ASIC design. It typically consists of a [[UVM Driver]], a [[UVM Monitor]], and a [[UVM Sequencer]], working together to generate transactions, drive them onto the interface, and observe the interface activity.

## Detailed Breakdown

*   **Context**: In [[UVM|Universal Verification Methodology]], a testbench is built using a hierarchical and modular approach. The UVM agent is a key building block for creating reusable verification intellectual property (VIP) for various interfaces (e.g., AXI, APB, PCIe, custom protocols).

*   **Purpose**: The primary purpose of a UVM agent is to encapsulate all the necessary components for verifying a particular interface. This promotes reusability, simplifies testbench development, and improves the overall efficiency of the verification process.

*   **Components of a UVM Agent**: A typical UVM agent consists of the following core components:
    1.  **[[UVM Driver]]**: Responsible for taking transactions (data packets) from the [[UVM Sequencer]] and converting them into pin-level activity (signals) that are driven onto the Design Under Test (DUT) interface.
    2.  **[[UVM Monitor]]**: Responsible for passively observing the pin-level activity on the DUT interface, converting it back into transactions, and sending these transactions to other components (like a [[UVM Scoreboard]]) for checking.
    3.  **[[UVM Sequencer]]**: Acts as a traffic cop, managing the flow of transactions from test sequences to the [[UVM Driver]]. It provides a mechanism for test sequences to generate and send transactions to the driver.
    4.  **Agent Configuration Object**: A `uvm_object` derived class that holds configuration settings for the agent (e.g., whether it's active or passive, interface details, randomization settings).

*   **Active vs. Passive Agent**: A UVM agent can be configured to operate in two modes:
    *   **Active Agent**: Contains all three components (driver, monitor, sequencer). It actively drives transactions onto the interface and monitors the activity. Used when the agent needs to generate stimulus.
    *   **Passive Agent**: Contains only the monitor. It passively observes the interface activity without driving any stimulus. Used when multiple agents need to observe the same interface, or when the interface is driven by another agent or a real hardware component.

*   **Agent Hierarchy**: Agents are typically instantiated within a UVM environment (`uvm_env`), which is then instantiated in the UVM test (`uvm_test`). This creates a hierarchical testbench structure.

*   **Benefits**:
    *   **Reusability**: Agents can be developed once and reused across multiple projects or different levels of integration (block-level, sub-system, full-chip).
    *   **Modularity**: Encapsulates interface-specific logic, making the testbench easier to understand, develop, and debug.
    *   **Scalability**: Facilitates the development of complex testbenches by breaking down the verification problem into smaller, manageable interface components.
    *   **Configurability**: The agent configuration object allows for easy customization of agent behavior without modifying the agent's code.

*   **Example**: An AXI agent would contain an AXI driver to drive AXI transactions, an AXI monitor to observe AXI bus activity, and an AXI sequencer to manage the flow of AXI transactions.

## Further Reading

*   [The UVM Primer: A Step-by-Step Introduction to the Universal Verification Methodology](https://www.amazon.com/UVM-Primer-Step-Step-Introduction/dp/098536790X)
*   [SystemVerilog for Verification: A Guide to Learning the Testbench Language Features](https://www.amazon.com/SystemVerilog-Verification-Learning-Testbench-Language/dp/0137046318)