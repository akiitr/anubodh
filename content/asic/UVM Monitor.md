---
title: UVM Monitor
description: Explanation of UVM Monitor in Universal Verification Methodology (UVM).
date: 2025-07-24
tags: [ASIC, Functional Verification, UVM]
aliases: [Monitor, UVM Monitor Component]
---

# UVM Monitor

## Simple Explanation (Gist)
A UVM (Universal Verification Methodology) monitor is a component within a [[UVM Agent]] that passively observes the pin-level activity on a Design Under Test (DUT) interface, converts this activity into high-level transactions, and then sends these transactions to other verification components for analysis and checking.

## Detailed Breakdown

*   **Purpose**: The primary role of the UVM monitor is to provide visibility into the DUT's behavior on a specific interface without actively driving any signals. It acts as a passive listener, capturing all relevant activity and translating it into a format that is easier for other testbench components (like a [[UVM Scoreboard]]) to consume and analyze.

*   **Key Responsibilities**:
    1.  **Passive Observation**: The monitor connects to the virtual interface of the DUT and continuously samples the pin-level signals (e.g., data, address, control, handshake signals) without affecting them.
    2.  **Pin-Level to Transaction-Level Conversion**: It reconstructs high-level transactions (e.g., read/write operations, packets) from the observed pin-level activity. This involves understanding the protocol timing and signal relationships.
    3.  **Transaction Collection**: Once a transaction is successfully reconstructed, the monitor typically sends it out through an analysis port (`uvm_analysis_port`) to any connected subscribers, such as a scoreboard or a functional coverage collector.
    4.  **Error Detection (Optional)**: While primarily passive, a monitor can also include checks for basic protocol violations (e.g., incorrect handshake sequences, unexpected signal states) and report them.

*   **Interaction with other UVM Components**:
    *   **Part of [[UVM Agent]]**: The monitor is a core component of a [[UVM Agent]]. An agent can be configured as passive (containing only a monitor) or active (containing a monitor, [[UVM Driver]], and [[UVM Sequencer]]).
    *   **Sends to [[UVM Scoreboard]]**: The transactions collected by the monitor are typically sent to a scoreboard for comparison against expected results.
    *   **Sends to Coverage Collectors**: Transactions can also be sent to functional coverage groups to track which scenarios have been exercised.

*   **Typical Monitor Structure**:
    ```systemverilog
    class my_monitor extends uvm_monitor;
      // Virtual interface handle
      virtual my_interface vif;

      // Analysis port to send transactions out
      uvm_analysis_port #(my_transaction) ap;

      // Constructor
      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction

      // Build phase: Get virtual interface handle and create analysis port
      function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual my_interface)::get(this, "", "vif", vif))
          uvm_fatal("NOVIF", "Virtual interface not set for monitor");
        ap = new("ap", this);
      endfunction

      // Run phase: Main monitoring loop
      task run_phase(uvm_phase phase);
        forever begin
          // Wait for protocol activity on the interface
          // Example: @(posedge vif.clk) wait(vif.valid && vif.ready);

          // Sample signals and reconstruct a transaction
          my_transaction tr = my_transaction::type_id::create("tr");
          // Populate tr with sampled data

          // Send the transaction out through the analysis port
          ap.write(tr);
        end
      endtask

    endclass
    ```

*   **Design Considerations**:
    *   **Non-Intrusive**: The monitor must not affect the DUT's behavior in any way.
    *   **Accuracy**: It must accurately capture and reconstruct transactions according to the interface protocol.
    *   **Completeness**: It should capture all relevant information for verification, including data, control signals, and timing.
    *   **Configurability**: Monitors should be configurable to support different modes of operation or variations in the interface protocol.

## Further Reading

*   [The UVM Primer: A Step-by-Step Introduction to the Universal Verification Methodology](https://www.amazon.com/UVM-Primer-Step-Step-Introduction/dp/098536790X)
*   [SystemVerilog for Verification: A Guide to Learning the Testbench Language Features](https://www.amazon.com/SystemVerilog-Verification-Learning-Testbench-Language/dp/0137046318)