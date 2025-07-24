---
title: Recovery
description: Recovery Time in VLSI Static Timing Analysis (STA)
date: 2025-07-24
tags:
  - VLSI
  - STA
  - Timing Violations
aliases:
  - Recovery
  - Recovery Time
---

# Recovery Time in VLSI Static Timing Analysis (STA)

## Simple Explanation (Gist)
Recovery time is a critical timing parameter in [[STA|Static Timing Analysis]] that specifies the minimum time a control signal (like an asynchronous set or reset) must be stable *after* the active edge of the clock before the next active clock edge arrives, to ensure the flip-flop captures data reliably.

## Detailed Breakdown

*   **Motivation**: Flip-flops have internal circuitry that needs a certain amount of time to stabilize after an asynchronous control signal (like `SET` or `RESET`) becomes inactive. If the clock edge arrives too soon after the asynchronous signal de-asserts, the flip-flop might enter a metastable state or capture incorrect data. Recovery time ensures that the flip-flop has enough time to recover from the asynchronous event before the next synchronous event (clock edge) occurs.

*   **Concept**: Recovery time is similar to [[Setup|setup time]] but applies to the relationship between an asynchronous control signal and the clock edge. While setup time deals with data stability *before* the clock edge, recovery time deals with the asynchronous control signal's stability *after* its de-assertion relative to the clock edge.

*   **Visual Representation**: 

    ```mermaid
    gantt
        dateFormat  YYYY-MM-DD HH:mm
        axisFormat %H:%M

        section Timing Diagram
        Clock       : 2025-07-24 09:00, 10s
        Async Reset : 2025-07-24 09:02, 3s
        Recovery Window : 2025-07-24 09:05, 2s

        section Explanation
        Clock       : Active edge at 09:00, 09:10
        Async Reset : De-asserts at 09:05
        Recovery Window : The period from 09:05 to 09:07 (if recovery time is 2s). The next clock edge (at 09:10) must fall outside this window.
    ```

*   **Formal Definition**: For a flip-flop, recovery time is the minimum time interval required between the de-assertion of an asynchronous set/reset signal and the subsequent active clock edge for reliable operation.

*   **Recovery Violation**: Occurs when the active clock edge arrives *before* the recovery time requirement is met. This can lead to: 
    *   **Metastability**: The flip-flop enters an unstable state, where its output is neither a clear logic 0 nor 1, potentially propagating unknown values (`X`) throughout the design.
    *   **Functional Failure**: The flip-flop might not correctly capture the data on the next clock edge, leading to incorrect circuit behavior.

*   **How it is Checked in STA**: 
    *   [[STA]] tools analyze all paths involving asynchronous control signals and the clock. 
    *   They calculate the actual time available between the de-assertion of the asynchronous signal and the next clock edge.
    *   This available time is then compared against the recovery time requirement specified in the [[Timing Library]] for the flip-flop.
    *   If the available time is less than the required recovery time, a recovery violation is reported.

*   **Fixing Recovery Violations**: 
    *   **Increase Delay on Asynchronous Path**: Add buffers or use slower cells on the asynchronous control path to delay its de-assertion, giving the flip-flop more time to recover.
    *   **Reduce Clock Frequency**: If possible, reducing the clock frequency can increase the time available between the asynchronous de-assertion and the next clock edge.
    *   **Use Faster Flip-Flops**: Select flip-flops from the [[Standard Cell Library]] with smaller recovery time requirements.
    *   **Modify Asynchronous Logic**: Re-architect the asynchronous control logic to ensure sufficient time for recovery.

*   **Relationship to Other Timing Parameters**: 
    *   **Setup Time**: Data must be stable *before* the clock edge.
    *   **Hold Time**: Data must be stable *after* the clock edge.
    *   Recovery and removal times are similar to setup and hold but apply to asynchronous control signals.

## Further Reading

*   [Static Timing Analysis for Nanometer Designs: A Practical Approach](https://www.amazon.com/Static-Timing-Analysis-Nanometer-Designs/dp/0387257027)
*   [CMOS VLSI Design: A Circuits and Systems Perspective](https://www.amazon.com/CMOS-VLSI-Design-Circuits-Perspective/dp/0321547748)
*   [Recovery and Removal Time in STA](https://www.vlsi-expert.com/2018/01/recovery-and-removal-time-in-sta.html)