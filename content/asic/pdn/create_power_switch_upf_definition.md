---
title: "create_power_switch in UPF: Definition and Ports"
date: 2025-12-08
tags: [asic, Physical_Design, PDN]
aliases: []
draft: false
---
**One-Line Summary:** In the `create_power_switch` definition, the input supply port connects the switch to the fixed external supply network, while the output supply port defines the virtual supply net that is actively controlled (switched ON or OFF) to power the logic within the specified power domain.

### Details:
The `create_power_switch` UPF command defines the logical relationship and control signals for implementing a power switch network, typically composed of high-VT transistors (sleep transistors), which govern the power state of a logic block (power domain).

#### Roles of Power Switch Ports

| Port Type | Function in Power Gating | Associated Supply Net Type | Relationship to Power Domain |
| :--- | :--- | :--- | :--- |
| **Input Supply Port** (`-input_supply_port`) | Connects the switch to the always-on (external) supply rail (e.g., permanent VDD or VSS). | Primary Power or Ground. | Receives power from the global, unscheduled Power Delivery Network (PDN). |
| **Output Supply Port** (`-output_supply_port`) | Connects the switch to the switched (virtual or internal) supply net that delivers power to the gated logic cells. | Internal Power or Ground (Virtual Rail). | Supplies the power necessary for the logic elements within the targeted power domain when the switch is ON. |
| **Control Port** (`-control_port`) | Receives the control signal (e.g., `SLEEP` or `WAKE`) that dictates whether the switch should be in the ON or OFF state. | Logic Signal (Typically Always-On). | Determines the activation state of the output supply net via a defined Boolean function. |

**Switch Activation and Supply Nets:**

1.  **Supply Net Creation:** The `-output_supply_port` argument specifies both the port name on the conceptual switch instance and the name of the switched supply net (virtual net). This virtual net becomes the primary power source for the entire power domain's logic elements.
2.  **Control Mechanism:** The status of the switch (ON or OFF) is determined by the control port and the associated Boolean function defined in `-on_state`. If the condition for ON is met, the switch enables the flow of current from the input supply net to the output (virtual) supply net.
3.  **OFF State Integrity:** When the switch is OFF, the output supply net of the power switch is intentionally shut down and carries no power, isolating the power domain.

## Reference:
*   **Source:** Synopsys Multivoltage Flow User Guide
*   **Source:** Low Power Methodology Manual
*   **Source:** RedHawk User Manual
