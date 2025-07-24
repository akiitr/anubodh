---
title: Removal
description: Removal Time in VLSI Static Timing Analysis (STA)
date: 2025-07-24
tags:
  - VLSI
  - STA
  - Timing Violations
aliases:
  - Removal
  - Removal Time
---

# Removal Time in VLSI Static Timing Analysis (STA)

## Simple Explanation (Gist)
Removal time is a critical timing parameter in [[STA|Static Timing Analysis]] that specifies the minimum time an asynchronous control signal (like an asynchronous set or reset) must remain stable *after* the active edge of the clock to ensure the flip-flop's output does not glitch or become unpredictable.

## Detailed Breakdown

*   **Motivation**: While [[Recovery|recovery time]] ensures the flip-flop can reliably capture data after an asynchronous signal de-asserts, removal time ensures that the flip-flop's output remains stable if the asynchronous signal changes too soon *after* the clock edge. If the asynchronous signal changes too quickly after the clock, it can cause the flip-flop's output to glitch or enter an unstable state, even if the data input was stable.

*   **Concept**: Removal time is similar to [[Hold Time|hold time]] but applies to the relationship between an asynchronous control signal and the clock edge. While hold time deals with data stability *after* the clock edge, removal time deals with the asynchronous control signal's stability *after* the clock edge.

*   **Visual Representation**: 

    ```mermaid
    gantt
        dateFormat  YYYY-MM-DD HH:mm
        axisFormat %H:%M

        section Timing Diagram
        Clock       : 2025-07-24 09:00, 10s
        Async Reset : 2025-07-24 09:00, 3s
        Removal Window : 2025-07-24 09:00, 2s

        section Explanation
        Clock       : Active edge at 09:00
        Async Reset : Must remain stable until 09:02 (if removal time is 2s) after the clock edge.
        Removal Window : The period from 09:00 to 09:02. The asynchronous signal must not change within this window.
    ```

*   **Formal Definition**: For a flip-flop, removal time is the minimum time interval required between the active clock edge and the subsequent change (assertion or de-assertion) of an asynchronous set/reset signal for reliable operation.

*   **Removal Violation**: Occurs when the asynchronous control signal changes *before* the removal time requirement is met. This can lead to: 
    *   **Output Glitch**: A momentary, incorrect change in the flip-flop's output.
    *   **Metastability**: The flip-flop enters an unstable state.
    *   **Functional Failure**: Incorrect data propagation or circuit behavior.

*   **How it is Checked in STA**: 
    *   [[STA]] tools analyze all paths involving asynchronous control signals and the clock.
    *   They calculate the actual time available between the active clock edge and the change in the asynchronous signal.
    *   This available time is then compared against the removal time requirement specified in the [[Timing Library]] for the flip-flop.
    *   If the available time is less than the required removal time, a removal violation is reported.

*   **Fixing Removal Violations**: 
    *   **Increase Delay on Asynchronous Path**: Add buffers or use slower cells on the asynchronous control path to delay its change, giving the flip-flop more time to stabilize after the clock edge.
    *   **Use Faster Flip-Flops**: Select flip-flops from the [[Standard Cell Library]] with smaller removal time requirements.
    *   **Modify Asynchronous Logic**: Re-architect the asynchronous control logic to ensure sufficient time for the flip-flop to settle.

*   **Relationship to Other Timing Parameters**: 
    *   **Setup Time**: Data must be stable *before* the clock edge.
    *   **Hold Time**: Data must be stable *after* the clock edge.
    *   **Recovery Time**: Asynchronous signal must be stable *after* its de-assertion relative to the clock edge.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [CMOS VLSI Design: A Circuits and Systems Perspective](https://www.amazon.com/CMOS-VLSI-Design-Circuits-Perspective/dp/0321547748)
*   [Recovery and Removal Time in STA](https://www.vlsi-expert.com/2018/01/recovery-and-removal-time-in-sta.html)