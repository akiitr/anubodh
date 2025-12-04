---
title: "Clock Gating Timing Checks"
date: 2025-12-03
tags: [asic, STA, tutorial]
aliases: []
draft: false
---
**One-Line Summary:** Clock gating, a power-saving technique, requires strict Static Timing Analysis (STA) setup and hold checks on the enable signal to prevent glitches and ensure clock pulse integrity.

Clock gating is a fundamental power optimization mechanism in high-speed digital designs. It reduces **dynamic power dissipation** by blocking clock toggling to inactive sequential elements. While essential for power saving, it introduces specific timing integrity challenges that must be strictly enforced through Static Timing Analysis (STA) checks. The common method involves using an **AND gate** (or an equivalent cell structure, such as a special Integrated Clock Gating or ICG cell) where one input is the original clock signal and the other is the **enable signal** (the gating signal). The primary purpose of performing timing checks on the clock gating structure is to ensure the **integrity of the clock pulse** is maintained, preventing glitches or clipped pulses.

### I. Comprehensive Clock Gating Timing Checks

STA performs two complementary sequential checks—setup (maximum delay) and hold (minimum delay)—on the control path (the enable signal) relative to the clock signal itself. These checks guarantee that the clock pulse shape is maintained and **no glitches or clipped pulses are introduced**.

| Check Type | Required Timing Relationship (Enable vs. Clock) | Critical Failure Point | Objective / Consequence of Violation |
| :--- | :--- | :--- | :--- |
| **Clock-Gating Setup Check** (or `clock gating default max check`) | The **enable signal must arrive and be stable in advance** of the **active edge** (e.g., rising) of the clock signal arriving at the gating cell. | The clock's active edge. | Prevents the active clock edge from being **clipped** or **chopped**, thus avoiding glitches or corrupted pulses. Failure leads to **functional failures**. |
| **Clock-Gating Hold Check** (or `clock gating default min check`) | The turning off (or tuning on) edge of the **enable signal must occur well past the turning off** (trailing) edge of the clock signal. | The clock's trailing edge. | Ensures the clock pulse **doesn't get chopped off**, preventing the introduction of glitches or clipped pulses. Failure leads to **functional failures**. |

Both setup and hold clock-gating checks ensure that the clock's shape is **not changed** and **no glitches** are introduced during the enabling or disabling process. If a check fails, the sequential element might enter a **metastable state** or capture an incorrect value.

### II. Mechanism and Glitch Prevention (AND Gate / ICG Cells)

When an AND gate (implying active-high enabling) or a dedicated Integrated Clock Gating (ICG) cell is used for clock gating, the enable signal must be stable during the clock's active phase for proper operation. The risk of introducing a corrupted pulse depends entirely on whether the enable signal transitions during the clock's active phase.

| Enable Signal State (for Active-High AND Gate) | Output Clock Net State | Glitch/Clipping Risk |
| :--- | :--- | :--- |
| **Stable Logic 0** (Inactive) | The output clock net is held stable at logic 0. | **No glitch risk.** This is the desired power-saving state with no clock toggling. |
| **Stable Logic 1** (Active) | The input clock pulses pass directly through to the output. | **Minimal glitch risk**, assuming the clock integrity is otherwise sound. |
| **Transitioning (0→1 or 1→0) During Clock Pulse** | The output clock integrity is compromised. | **High Glitch Risk:** If the enable signal switches state while the clock is active (high), it violates setup or hold timing. This results in a clipped or corrupted pulse, potentially causing functional failures or leading downstream elements into a **metastable state**. |

The critical condition that leads to functional corruption is the **late or early change of the enable signal** relative to the clock edges. For example, if the enable signal attempts to transition from 0 to 1 slightly *after* the clock has already risen, the resulting partial pulse may incorrectly trigger downstream sequential logic.

> [!INFO] Related Note
> For specific details on stability requirements for AND-gate based gating, see [[active_high_clock_gating_check|Active-High Clock Gating Check]].

### III. Key Timing and Analysis Points

Clock-gating circuits are typically implemented using standard combinational gates or dedicated **Integrated Clock Gating (ICG) cells**. These are generally combinational cells designed for clock control.

| Feature/Concept | Details and Key Points |
| :--- | :--- |
| **Violation Consequence** | Failing either the setup or hold clock-gating check means the intended clock waveform integrity is lost, which can lead to **functional failures** (latching unintended data or metastability). |
| **STA Path Group** | All clock-gating checks belong to the implicit path group named **`clock_gating_default`**. This differentiates them from standard data paths (which belong to clock groups) and asynchronous reset paths (`async_default`). |
| **Latching/Propagation Requirement** | Clock gating checks are only inferred if the output of the gating cell is ultimately **used as a clock downstream** (e.g., connected to a sequential element's clock pin or used as a master for a generated clock). STA generally checks the timing of the enable signal only under this condition. |
| **Automatic Detection** | PrimeTime automatically checks for setup and hold violations on gating inputs for combinational gates where one signal is a clock and the gating signal is not a clock. A value of 0.0 is used as the default setup and hold time unless the library specifies otherwise. |
| **Enable Signal Generation** | The common structure for reliable clock gating often involves generating the enable signal using a flip-flop clocked by the **opposite clock edge** (e.g., using a negative-edge triggered flop to generate an enable signal for a positive-edge controlled clock gate). This ensures the enable signal transition occurs during the clock's inactive (low) period, making setup and hold requirements easier to meet. |
| **Checked Element** | Clock Gating Checks verify the timing of the **control (enable) path** at the input of a **Combinational Gate/ICG**, distinguishing it from sequential checks (data path at D pin) and asynchronous checks (reset/clear pin). |
| **Primary Goal** | The primary goal of CGCs is to ensure **Clock Signal Integrity** (prevent clipping/glitches), whereas standard sequential checks aim for **Data Stability and Capture**, and asynchronous checks for **Device Recovery**. |

## References
*   **Source:** *Static Timing Analysis for Nanometer Designs* by Rakesh Chadha.
