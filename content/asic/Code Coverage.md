---
title: Code Coverage
description: A detailed explanation of Code Coverage in VLSI verification, its purpose, types, and limitations.
date: 2025-07-23
tags: ["VLSI", "Verification", "ASIC", "Coverage", "RTL"]
---

# Code Coverage

## 1. What is Code Coverage?

[[Code Coverage]] in [[VLSI Design|VLSI]] (Very Large Scale Integration) is a metric used in the [[Functional Verification|verification process]] to determine how much of the [[RTL Design|Register-Transfer Level (RTL)]] design code has been exercised by [[Simulation|simulation]] test cases. It helps identify unverified parts of the design.

## 2. Purpose

[[Code Coverage]] assesses the quality of [[RTL Design|RTL code]] execution during [[Simulation|simulation]]. It indicates how thoroughly the design has been executed by the simulator using the tests in the regression. It helps verification engineers identify uncovered areas in the design and ensures comprehensive verification.

## 3. Automatic Collection

[[Code Coverage]] is typically collected automatically by [[Simulation|simulation tools]].

## 4. Limitations

While crucial for identifying unexercised code, [[Code Coverage]] does not guarantee the correctness of the design or that all necessary code is present. It cannot identify missing features or whether all possible values of a feature are tested.

## 5. Types of Code Coverage

*   **Statement/Line Coverage:** Measures the percentage of executable statements or lines of code that have been executed at least once during [[Simulation|simulation]]. This is often targeted for 100% coverage for verification closure.
*   **Block Coverage:** Checks if groups of statements (e.g., within `begin-end`, `if-else`, `case` blocks) have been covered. It helps find dead code.
*   **Branch/Decision Coverage:** Evaluates whether all possible branches (true and false cases) in conditional statements (like `if-else`, `case`, ternary operators) have been taken.
*   **Conditional/Expression Coverage:** Indicates how well variables and expressions within conditional statements are evaluated, ensuring all combinations of inputs are driven.
*   **Toggle Coverage:** Reports how many times signals and ports in the [[RTL Design|RTL design]] have changed their state (toggled from 0 to 1 and vice-versa) during [[Simulation|simulation]]. It can help identify unused signals.
*   **[[FSM|FSM (Finite State Machine) Coverage]]:** Measures whether all states and all possible transitions within a [[FSM|finite state machine]] have been visited or traversed during [[Simulation|simulation]].

## 6. Conclusion

[[Code Coverage]] is a vital metric in [[Functional Verification|VLSI verification]] that quantifies the extent to which the design's [[RTL Design|RTL code]] has been exercised by [[Testbench|testbenches]]. By analyzing various types of code coverage, such as statement, branch, and toggle coverage, verification teams can pinpoint unverified sections of the design, although it does not confirm functional correctness or the absence of bugs in unwritten code.

## Further Reading

*   **SystemVerilog for Verification: A Guide to Learning the Testbench Language Features** by Chris Spear
*   **Verification Methodology Manual for SystemVerilog** by Janick Bergeron, Eduard Cerny, Alan Hunter, and Andy Nightingale
*   [VLSI Pro - Code Coverage](https://vlsi.pro/code-coverage/)
*   [VLSI Verify - Code Coverage](https://www.vlsiverify.com/code-coverage/)
*   [SemiEngineering - Code Coverage](https://semiengineering.com/code-coverage/)