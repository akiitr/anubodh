---
title: Functional Specification
---
The [[Functional Specification]] is the foundational document defining *what* a [[chip]] does from an external, black-box perspective, without detailing the internal implementation. It is the "single source of truth" that aligns all teams ([[RTL Design]], [[Functional Verification]], [[Physical Design]], software, and marketing).

### Key Components
*   **Input-to-Output Behavior**: Defines the exact output responses for any given set of input stimuli.
*   **Supported Operations**: Lists all algorithms and functions the [[ASIC]] must perform (e.g., H.264 encoding, FFT).
*   **Data Formats**: Specifies bit widths, endianness, and data structures for all inputs and outputs.
*   **Modes of Operation**: Describes all functional modes, such as active, low-power standby, diagnostic, and secure boot modes.

### Role in Verification
The [[Functional Specification]] is the primary input for the [[Functional Verification]] plan. The goal of verification is to prove that the [[RTL Design]] correctly implements every feature described.
*   **[[Functional Coverage]]**: A metric used to track how many specified scenarios have been tested. The goal is 100% [[Test Coverage]].
*   **Feature Creep**: Uncontrolled additions to the specification are a major risk, as each new feature non-linearly expands the verification effort, schedule, and cost.

### Example Black Box Data Flow
```mermaid
graph TD
    A[Input Data] --> B{Data Pre-processing Block};
    B --> C{Core Algorithm Engine};
    C --> D{Post-processing & Formatting};
    D --> E[Output Data];