---
title: UVM Sequencer
description: Explanation of UVM Sequencer in Universal Verification Methodology (UVM).
date: 2025-07-24
tags: [ASIC, Functional Verification, UVM]
aliases: [Sequencer, UVM Sequencer Component]
---

# UVM Sequencer

## Simple Explanation (Gist)
A UVM (Universal Verification Methodology) sequencer is a component within a [[UVM Agent]] that acts as a traffic cop, managing the flow of transactions (high-level data packets) from test sequences to the [[UVM Driver]]. It ensures that transactions are sent to the driver in the correct order and at the appropriate time.

## Detailed Breakdown

*   **Purpose**: The primary role of the UVM sequencer is to provide a flexible and powerful mechanism for generating and delivering stimulus to the Design Under Test (DUT). It decouples the creation of test scenarios (sequences) from the actual driving of pin-level signals (driver), promoting reusability and modularity.

*   **Key Responsibilities**:
    1.  **Transaction Management**: The sequencer is responsible for getting transactions from a sequence and providing them to the driver. It handles the `get_next_item()`, `item_done()`, and `put()` calls that facilitate this communication.
    2.  **Arbitration**: If multiple sequences try to send transactions to the same driver simultaneously, the sequencer arbitrates between them, ensuring that only one sequence has control of the driver at any given time.
    3.  **Sequence Execution**: It executes sequences, which are procedural blocks of code that define the test stimulus. Sequences can be simple (sending a single transaction) or complex (sending a series of transactions, including randomization and layering).
    4.  **Randomization Control**: Works closely with [[SystemVerilog]]'s randomization features to generate constrained-random transactions.

*   **Interaction with other UVM Components**:
    *   **Communicates with [[UVM Driver]]**: The sequencer is connected to the driver via a `seq_item_port` (on the sequencer) and a `seq_item_export` (on the driver). This port/export pair is used to send transactions from the sequencer to the driver and receive responses back.
    *   **Executes Sequences**: Sequences are `uvm_sequence` objects that contain the logic for generating transactions. A sequence calls methods on the sequencer to request and send transactions.
    *   **Part of [[UVM Agent]]**: The sequencer is typically instantiated within a [[UVM Agent]], which encapsulates all components related to a specific interface.

*   **Typical Sequencer Structure**:
    ```systemverilog
    class my_sequencer extends uvm_sequencer #(my_transaction);
      // Constructor
      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction

      // Factory registration
      `uvm_component_utils(my_sequencer)
    endclass
    ```

*   **Typical Sequence Structure**:
    ```systemverilog
    class my_sequence extends uvm_sequence #(my_transaction);
      // Constructor
      function new(string name = "my_sequence");
        super.new(name);
      endfunction

      // Factory registration
      `uvm_object_utils(my_sequence)

      // Main body of the sequence
      virtual task body();
        my_transaction tr;
        // Create a new transaction
        tr = my_transaction::type_id::create("tr");
        // Randomize the transaction (if it has random variables)
        if (!tr.randomize()) `uvm_error("RAND_FAIL", "Transaction randomization failed");

        // Send the transaction to the driver via the sequencer
        start_item(tr);
        finish_item(tr);
      endtask
    endclass
    ```

*   **Benefits**:
    *   **Stimulus Generation Flexibility**: Allows for easy creation of complex and varied test scenarios using sequences.
    *   **Reusability**: Sequences and sequencers can be reused across different testbenches and projects.
    *   **Decoupling**: Separates the stimulus generation logic from the pin-level driving logic, making both more modular and easier to maintain.
    *   **Layering**: Enables layering of sequences, where a higher-level sequence can call lower-level sequences, building complex test scenarios from simpler ones.

## Further Reading

*   [The UVM Primer: A Step-by-Step Introduction to the Universal Verification Methodology](https://www.amazon.com/UVM-Primer-Step-Step-Introduction/dp/098536790X)
*   [SystemVerilog for Verification: A Guide to Learning the Testbench Language Features](https://www.amazon.com/SystemVerilog-Verification-Learning-Testbench-Language/dp/0137046318)