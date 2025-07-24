---
title: UVM Driver
description: Explanation of UVM Driver in Universal Verification Methodology (UVM).
date: 2025-07-24
tags: [ASIC, Functional Verification, UVM]
aliases: [Driver, UVM Driver Component]
---

# UVM Driver

## Simple Explanation (Gist)
A UVM (Universal Verification Methodology) driver is a component within a [[UVM Agent]] that takes transactions (high-level data packets) from a [[UVM Sequencer]] and translates them into pin-level signals that are then driven onto the Design Under Test (DUT) interface.

## Detailed Breakdown

*   **Purpose**: The primary role of the UVM driver is to interact directly with the pins of the Design Under Test (DUT) or the interface connecting to the DUT. It acts as the active stimulus generator for the interface, converting abstract transaction-level data into concrete signal toggles that the DUT can understand.

*   **Key Responsibilities**:
    1.  **Transaction to Pin-Level Conversion**: Takes a high-level transaction object (e.g., an AXI write transaction, a PCIe packet) and breaks it down into the individual signal assignments and timing sequences required to drive that transaction on the physical interface.
    2.  **Driving Signals**: Applies the generated pin-level signals to the virtual interface connected to the DUT. This involves controlling the timing and values of signals like clock, data, control, and handshake lines.
    3.  **Synchronization**: Synchronizes its operations with the DUT's clock and handshake signals to ensure proper data transfer.
    4.  **Error Injection (Optional)**: Can be designed to inject specific errors (e.g., protocol violations, timing errors) onto the interface to test the DUT's error handling capabilities.

*   **Interaction with other UVM Components**:
    *   **Receives from [[UVM Sequencer]]**: The driver gets its transactions from the sequencer. The sequencer determines *what* transactions to send, and the driver determines *how* to send them at the pin level.
    *   **Part of [[UVM Agent]]**: The driver is typically instantiated within a [[UVM Agent]], which encapsulates all components related to a specific interface.

*   **Typical Driver Structure**:
    ```systemverilog
    class my_driver extends uvm_driver #(my_transaction);
      // Virtual interface handle
      virtual my_interface vif;

      // Constructor
      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction

      // Build phase: Get virtual interface handle
      function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual my_interface)::get(this, "", "vif", vif))
          uvm_fatal("NOVIF", "Virtual interface not set for driver");
      endfunction

      // Run phase: Main driving loop
      task run_phase(uvm_phase phase);
        forever begin
          // Get a transaction from the sequencer
          seq_item_port.get_next_item(req);

          // Drive the transaction onto the interface (pin-level activity)
          // Example: drive_write_transaction(req);
          // Example: drive_read_transaction(req);

          // Inform the sequencer that the transaction is done
          seq_item_port.item_done();
        end
      endtask

      // Specific tasks for driving different types of transactions
      // task drive_write_transaction(my_transaction tr);
      //   // Implement pin-level driving logic here
      // endtask

      // task drive_read_transaction(my_transaction tr);
      //   // Implement pin-level driving logic here
      // endtask

    endclass
    ```

*   **Design Considerations**:
    *   **Protocol Adherence**: The driver must strictly adhere to the timing and protocol rules of the interface it is driving.
    *   **Error Handling**: Robust drivers should be able to handle unexpected responses from the DUT or inject errors for negative testing.
    *   **Configurability**: Drivers should be configurable (e.g., through the agent's configuration object) to support different modes of operation or variations in the interface protocol.

## Further Reading

*   [The UVM Primer: A Step-by-Step Introduction to the Universal Verification Methodology](https://www.amazon.com/UVM-Primer-Step-Step-Introduction/dp/098536790X)
*   [SystemVerilog for Verification: A Guide to Learning the Testbench Language Features](https://www.amazon.com/SystemVerilog-Verification-Learning-Testbench-Language/dp/0137046318)