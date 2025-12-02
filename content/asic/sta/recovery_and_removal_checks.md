---
title: "Recovery and Removal Timing Checks"
date: 2025-12-01
tags: [asic, VLSI, STA, cheatsheet]
alias: []
draft: false
---
**One-Line Summary:** This note explains Recovery and Removal timing checks for asynchronous signals (like resets), detailing their definitions and their equivalence to synchronous Setup and Hold checks.

You correctly grasped the core concept of the check—it verifies the stability of an asynchronous signal relative to the clock's active edge—but the precise definition relates to the signal's transition from **active to inactive**.

Here is a detailed breakdown of the recovery check, followed by its counterpart, the removal check.

### 1. Recovery Time (The "Setup" of Async Signals)

The key distinction lies in the state change of the asynchronous control signal (like a reset or clear pin).

*   **Definition:** The **recovery time** is the minimum time required between an asynchronous signal **becoming inactive** (de-asserted) and the next active clock edge.
*   **Purpose:** This check ensures that, after the asynchronous signal becomes inactive, there is adequate time for the sequential element to **recover** so that the next active clock edge can be effective. If the active clock edge occurs too soon after the release of the asynchronous signal, the state of the flip-flop may be unknown or enter a metastable state.
*   **Analogy:** Your initial answer used the phrasing "stable *before* the active clock edge", which is a general description similar to the concept of **setup time** for data inputs. Recovery is essentially a setup check for the de-assertion of asynchronous signals.

### 2. Removal Time (The "Hold" of Async Signals)

The **removal check** is the counterpart to the recovery check.

*   **Definition:** The **removal time** is the minimum amount of time that an asynchronous control signal must remain active *after* the active clock edge before it can be de-asserted. In other words, it is the minimum time required between the active clock edge and the asynchronous signal **becoming inactive**.
*   **Purpose:** This ensures that the active clock edge does not interfere with the release of the asynchronous control. If the reset is removed too quickly after the clock edge, the internal storage element might not have time to stabilize in its reset state (or might latch data incorrectly if the clock edge was meant to be ignored).
*   **Analogy:** Removal is essentially a **hold check** for the de-assertion of asynchronous signals. It ensures the "reset state" is held long enough after the clock edge.

### 3. Comparison: Async vs. Sync Checks

The Recovery and Removal checks are conceptually identical to Setup and Hold checks, but they apply specifically to the **de-assertion** (release) of asynchronous pins (Reset/Preset) rather than data inputs (D).

| Feature | Recovery Check | Removal Check |
| :--- | :--- | :--- |
| **Target Signal** | Asynchronous Pin (e.g., Reset, Clear) | Asynchronous Pin (e.g., Reset, Clear) |
| **Event Sequence** | Async Release $\to$ Clock Edge | Clock Edge $\to$ Async Release |
| **Constraint** | Signal must release **before** clock (with margin). | Signal must release **after** clock (with margin). |
| **Synchronous Equivalent** | **Setup Check** (Max Path) | **Hold Check** (Min Path) |
| **Typical Violation Fix** | Fix by speeding up the reset path or slowing down the clock. | Fix by slowing down the reset path (adding buffers) or speeding up the clock. |

### Summary

The correct definition emphasizes the state transition:
*   **Recovery:** Time required *after* the asynchronous signal **becomes inactive** and *before* the next active clock edge.
*   **Removal:** Time required *after* the active clock edge *before* the asynchronous signal **becomes inactive**.

## Quiz Context
> [!QUESTION] Recovery Timing Check
> **Question:** Which of the following describes a recovery timing check?
>
> **Incorrect Answer:** The minimum time an asynchronous signal must be stable before the active clock edge arrives.
> **Correct Answer:** The minimum time required between an asynchronous signal becoming inactive and the next active clock edge.

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.
