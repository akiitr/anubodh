---
title: UVM Scoreboard
description: Explanation of UVM Scoreboard in Universal Verification Methodology (UVM).
date: 2025-07-24
tags: [ASIC, Functional Verification, UVM]
aliases: [Scoreboard, UVM Checker]
---

# UVM Scoreboard

## Simple Explanation (Gist)
A UVM (Universal Verification Methodology) scoreboard is a key component in a UVM testbench responsible for checking the functional correctness of the Design Under Test (DUT). It compares the actual behavior of the DUT (observed by [[UVM Monitor|monitors]]) against its expected behavior (predicted by a reference model or golden data) and reports any mismatches.

## Detailed Breakdown

*   **Purpose**: The primary goal of a UVM scoreboard is to automate the checking process, ensuring that the DUT performs its intended function correctly. It acts as the "brain" of the verification environment, determining if the design is bug-free based on its functional outputs.

*   **Key Responsibilities**:
    1.  **Receive Transactions**: The scoreboard receives high-level transactions from one or more [[UVM Monitor|monitors]] (which observe the DUT's interfaces) and from a reference model (which predicts the expected behavior).
    2.  **Reference Model/Golden Data**: It typically contains or interacts with a reference model (also known as a golden model or predictor) that mimics the DUT's behavior. This model processes the same inputs as the DUT and generates the expected outputs.
    3.  **Comparison**: The core function of the scoreboard is to compare the actual transactions received from the DUT monitors with the expected transactions from the reference model. This comparison is usually done on a transaction-by-transaction basis.
    4.  **Error Reporting**: If a mismatch is detected during the comparison, the scoreboard reports an error, providing details about the discrepancy (e.g., expected value vs. actual value, timing mismatch). This helps in debugging the design.
    5.  **Coverage Collection (Optional)**: A scoreboard can also contribute to [[Functional Coverage]] by tracking specific scenarios or data values that have been checked.

*   **Interaction with other UVM Components**:
    *   **Subscribes to [[UVM Monitor|Monitors]]**: Scoreboards typically connect to the analysis ports (`uvm_analysis_port`) of monitors to receive observed transactions.
    *   **Interacts with Reference Model**: The reference model can be a separate UVM component or integrated directly within the scoreboard. It receives input transactions (often from the same monitors that feed the DUT) and produces expected output transactions.
    *   **Part of [[UVM Environment|UVM Environment]]**: The scoreboard is usually instantiated within the `uvm_env` (environment) component, which orchestrates the overall testbench.

*   **Typical Scoreboard Structure**:
    ```systemverilog
    class my_scoreboard extends uvm_scoreboard;
      // Analysis FIFOs to receive transactions from monitors
      uvm_tlm_analysis_fifo #(my_transaction) actual_fifo;
      uvm_tlm_analysis_fifo #(my_transaction) expected_fifo;

      // Constructor
      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction

      // Build phase: Create FIFOs and reference model (if separate)
      function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        actual_fifo = new("actual_fifo", this);
        expected_fifo = new("expected_fifo", this);
        // if (m_predictor == null) m_predictor = my_predictor::type_id::create("m_predictor", this);
      endfunction

      // Connect phase: Connect analysis ports to FIFOs
      function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        // Connect monitor's analysis port to actual_fifo.analysis_export
        // Connect predictor's analysis port to expected_fifo.analysis_export
      endfunction

      // Run phase: Main checking loop
      task run_phase(uvm_phase phase);
        my_transaction actual_tr, expected_tr;
        forever begin
          // Wait for transactions from both actual and expected streams
          actual_fifo.get(actual_tr);
          expected_fifo.get(expected_tr);

          // Perform comparison
          if (!actual_tr.compare(expected_tr))
            uvm_error(get_full_name(), $sformatf("Mismatch detected! Expected: %s, Actual: %s", expected_tr.sprint(), actual_tr.sprint()));
          else
            uvm_info(get_full_name(), $sformatf("Match! Expected: %s, Actual: %s", expected_tr.sprint(), actual_tr.sprint()), UVM_LOW);
        end
      endtask
    endclass
    ```

*   **Benefits**:
    *   **Automated Checking**: Reduces manual effort in verifying design correctness.
    *   **Early Bug Detection**: Catches functional bugs during simulation.
    *   **Improved Debugging**: Provides clear error messages and context for mismatches.
    *   **Reusability**: Can be reused across different testbenches if the interface and reference model are well-defined.
    *   **Verification Completeness**: Contributes to the overall completeness of the verification process.

## Further Reading

*   [The UVM Primer: A Step-by-Step Introduction to the Universal Verification Methodology](https://www.amazon.com/UVM-Primer-Step-Step-Introduction/dp/098536790X)
*   [SystemVerilog for Verification: A Guide to Learning the Testbench Language Features](https://www.amazon.com/SystemVerilog-Verification-Learning-Testbench-Language/dp/0137046318)
*   [UVM Scoreboard Tutorial](https://www.chipverify.com/uvm/uvm-scoreboard)
