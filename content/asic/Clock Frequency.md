---
title: Clock Frequency
---
The target [[Clock Frequency]] (e.g., 2.0 GHz) is a primary performance metric in the [[Chip Specification]]. Its inverse, the clock period, defines the absolute timing budget for every [[Combinational Logic]] path between registers in the design. Meeting this budget is the central goal of "timing closure" in [[Physical Synthesis]] and [[STA]].

### Specification Details
*   **Target Frequency**: The primary operating frequency for the chip's main performance domains.
*   **Clock Domains**: Complex SoCs are multi-clock designs. The specification must define all distinct domains (e.g., [[CPU]] at 3 GHz, interconnect at 1.5 GHz, peripherals at 100 MHz) to enable [[Low Power Design]].
*   **Clock Generation**: Describes how clocks are created, typically using an external crystal oscillator as a reference for on-chip Phase-Locked Loops (PLLs) to generate high-speed internal clocks.
*   **Clock Distribution Strategy**: High-level requirements for the clock network. For high-frequency designs, this may mandate a specific topology like a balanced [[H-Tree]] or a [[Clock Mesh]] to minimize clock skew. This is implemented during [[CTS]].

### Impact on Design
An aggressive [[Clock Frequency]] target creates immense pressure on the entire [[ASIC Design Flow]]:
*   **Shrinks Timing Budget**: A higher frequency means a shorter clock period, leaving less time for signals to propagate through logic paths.
*   **Creates Critical Paths**: Logic paths that were acceptable at a lower frequency may now violate timing ([[Setup]] time) and become "critical paths".
*   **Increases [[PPA]]**: To fix timing violations, synthesis and [[Placement]] tools use larger, faster, and more power-hungry [[Standard Cell Library|standard cells]], increasing both [[Area]] and [[Power]].
*   **Forces [[Microarchitecture]] Changes**: If timing closure is not achievable, the architecture may need to be revised, for example, by adding a [[Pipeline Design]] stage to break a long critical path.
