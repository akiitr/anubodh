---
title: Logical Equivalence Checking (LEC)
description: Explanation of Logical Equivalence Checking (LEC) in VLSI verification.
date: 2025-07-24
tags: [ASIC, Verification, Formal Verification]
aliases: [LEC, Logical Equivalence Checking]
---

# Logical Equivalence Checking (LEC)

## Simple Explanation (Gist)
Logical Equivalence Checking (LEC) is a formal verification technique used in VLSI to mathematically prove that two different representations of a digital design (e.g., RTL and gate-level netlist) are functionally identical, ensuring that no unintended changes were introduced during synthesis or other design transformations.

## Detailed Breakdown

*   **Motivation**: As a digital design progresses through various stages (e.g., [[RTL Design|RTL]] to [[Synthesis|gate-level netlist]], or gate-level netlist to optimized gate-level netlist after [[Timing ECO|ECOs]]), transformations are applied. These transformations are complex and can inadvertently introduce functional bugs. Simulation alone cannot guarantee that two designs are functionally identical across all possible input sequences. LEC provides a formal, exhaustive proof.

*   **Concept**: LEC tools compare two designs, typically a "golden" reference design (e.g., the pre-synthesis RTL) and a "revised" design (e.g., the post-synthesis gate-level netlist). The tool mathematically proves whether the output behavior of both designs is identical for all possible input combinations and sequences. If they are not identical, the tool identifies the point of divergence, making debugging much easier.

*   **How it Works (Simplified)**:
    1.  **Design Abstraction**: Both the golden and revised designs are converted into a common internal representation, often Boolean functions or Binary Decision Diagrams (BDDs).
    2.  **Correspondence Mapping**: The tool automatically (or with user guidance) maps equivalent points (e.g., primary inputs, primary outputs, sequential elements like flip-flops) between the two designs.
    3.  **Equivalence Proof**: For each corresponding output and sequential element, the tool attempts to prove that the Boolean function representing that point in the golden design is identical to the Boolean function representing the corresponding point in the revised design. This is typically done by creating an "XOR tree" between the two points and proving that the output of the XOR tree is always zero (i.e., the two points are always equal).
    4.  **Mismatch Detection**: If the tool cannot prove equivalence, it reports a mismatch and provides a counterexample (a sequence of inputs that causes the two designs to behave differently), which is invaluable for debugging.

*   **Key Applications**:
    *   **RTL-to-Gate-Level Equivalence**: The most common use case, ensuring that the synthesis process did not alter the design's functionality.
    *   **Gate-Level-to-Gate-Level Equivalence**: Verifying the functional correctness of optimizations applied after initial synthesis (e.g., during physical synthesis, clock tree synthesis, or post-layout optimizations).
    *   **ECO Verification**: Ensuring that Engineering Change Orders (ECOs) only implement the intended changes and do not introduce new bugs.
    *   **Low Power Design Verification**: Used to verify that power-saving techniques (like [[Power Gating|power gating]] or [[Clock Gating|clock gating]]) do not alter the design's functional behavior.

*   **Advantages**:
    *   **Exhaustive Proof**: Provides 100% functional verification, unlike simulation which can only cover a subset of possible scenarios.
    *   **Faster than Simulation**: For equivalence checking, LEC is significantly faster than running extensive simulations.
    *   **Early Bug Detection**: Can catch functional bugs introduced by synthesis or other transformations much earlier in the design flow.
    *   **Automated Debugging**: Provides counterexamples for mismatches, greatly speeding up the debug process.

*   **Limitations**:
    *   **Sequential Depth**: Can be computationally intensive for very deep sequential logic, though modern tools are highly optimized.
    *   **Black Boxes**: Requires the ability to compare internal logic; if parts of the design are treated as black boxes, their internal equivalence cannot be checked.

*   **Tools**: Major EDA vendors offer LEC tools (e.g., Synopsys Formality, Cadence Conformal LEC, Siemens Tessent Formal).

## Further Reading

*   [Formal verification on Wikipedia](https://en.wikipedia.org/wiki/Formal_verification)
*   [Logical Equivalence Checking (LEC) in VLSI](https://www.vlsi-expert.com/2018/01/logical-equivalence-checking-lec-in-vlsi.html)
*   [Formal Verification: An Essential Toolkit for Modern VLSI Design](https://www.amazon.com/Formal-Verification-Essential-Toolkit-Modern/dp/0123743615)