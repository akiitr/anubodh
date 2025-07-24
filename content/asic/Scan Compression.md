---
title: Scan Compression
description: Explanation of Scan Compression in Design for Test (DFT).
date: 2025-07-24
tags: [ASIC, DFT, Testing]
aliases: [Test Compression, EDT]
---

# Scan Compression

## Simple Explanation (Gist)
Scan compression is a Design for Test (DFT) technique that reduces the volume of test data and the time required to apply tests by compressing test patterns before shifting them into [[Scan Chains]] and decompressing test responses before shifting them out.

## Detailed Breakdown

*   **Purpose**: As ASIC designs grow in complexity and size, the number of scan flip-flops and thus the length of [[Scan Chains]] increases significantly. This leads to very large test pattern volumes and long test application times, which can become a bottleneck in manufacturing testing. Scan compression addresses these challenges by:
    *   **Reducing Test Data Volume**: Fewer bits need to be stored and transferred from the Automatic Test Equipment (ATE).
    *   **Reducing Test Application Time**: Fewer clock cycles are needed to shift in patterns and shift out responses.
    *   **Reducing ATE Pin Count**: Can reduce the number of dedicated scan I/O pins required on the chip.

*   **How it Works**: Scan compression typically involves adding on-chip logic between the ATE and the internal [[Scan Chains]]. This logic consists of:
    1.  **Decompressor**: Located at the scan inputs, it takes a small number of compressed inputs from the ATE and expands them into a much larger number of scan chain inputs. This allows a few ATE channels to drive many internal scan chains simultaneously.
    2.  **Compressor**: Located at the scan outputs, it takes a large number of scan chain outputs and compacts them into a smaller number of compressed outputs that are sent back to the ATE.

*   **Common Techniques/Architectures**:
    *   **Embedded Deterministic Test (EDT)**: A popular commercial solution (Synopsys) that uses linear feedback shift registers (LFSRs) for decompression and multiple-input signature registers (MISRs) or similar structures for compression.
    *   **Illinois Scan Architecture**: An early academic proposal for scan compression.
    *   **X-tolerant Compression**: Techniques that handle unknown (X) states in the scan chain, which can arise from uninitialized flip-flops or bus contention, without corrupting the compressed output.

*   **Benefits**:
    *   **Significant Reduction**: Achieves typical compression ratios of 10x to 100x or more for both test data and test time.
    *   **Lower Test Cost**: Reduces the cost of ATE time and memory requirements.
    *   **Improved Test Quality**: Enables more thorough testing by allowing more patterns to be applied within a given test budget.
    *   **Power Management**: Can help manage power consumption during scan operations by controlling the activity within the scan chains.

*   **Design Considerations**:
    *   **Area Overhead**: The compression/decompression logic adds some area overhead to the design.
    *   **Design Complexity**: Integrating scan compression requires careful planning and can add complexity to the DFT flow.
    *   **Diagnostic Capability**: While compression is efficient for testing, it can sometimes make fault diagnosis more challenging, as the direct mapping between internal scan cells and ATE pins is lost.

*   **Integration**: Scan compression logic is typically inserted during the [[DFT|Design for Test]] stage, often after [[Scan Insertion]] and before [[ATPG|Automatic Test Pattern Generation]].

## Further Reading

*   [VLSI Test Principles and Architectures](https://www.amazon.com/VLSI-Test-Principles-Architectures-Wang/dp/0123706015)
*   [The Small Book About Design-for-Test](https://www.amazon.com/Small-Book-About-Design-Test-Juergen/dp/1732267909)