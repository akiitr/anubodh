---
title: Modem
---
A [[Modem]] (modulator-demodulator) IP block is a core component for ASICs in wireless communication systems, such as satellite terminals or 5G access points. The specification defines its communication standards, performance, and integration requirements.

### Key Specification Details
*   **Communication Standard**: The industry standard the [[Modem]] must comply with (e.g., DVB-S2X for satellite, 5G NR).
*   **Performance Metrics**: Key performance targets, including:
    *   Maximum channel bandwidth (e.g., 1 GHz).
    *   Maximum data throughput (e.g., 5 Gbps).
    *   Figures of merit like spectral efficiency and Error Vector Magnitude (EVM).
*   **Modulation and Coding**: Lists all supported modulation schemes (e.g., QPSK, 16-APSK) and Forward Error Correction (FEC) codes (e.g., LDPC, Reed-Solomon).
*   **IP Core Interface**: Describes the IP's ports and configuration registers. Data I/O often uses a standard like AXI or JESD204B.

### Mixed-Signal Integration Challenges
The [[Modem]] bridges the digital domain of the [[ASIC]] with the analog domain of radio waves. This presents unique integration challenges.
*   **Analog/RF Sensitivity**: The [[Modem]] contains sensitive analog components (ADCs, DACs, mixers) that interface with the antenna.
*   **Digital [[Noise]] Coupling**: Fast-switching digital logic in the [[ASIC]] is a significant source of [[Noise]]. This noise can couple through the power grid or silicon substrate into the analog/RF circuits, severely degrading performance (e.g., increasing bit error rate).

### Physical Implementation Mandates
To ensure [[Signal Integrity]], the specification for a communication [[ASIC]] must include strict physical layout directives:
*   **Domain Isolation**: Mandate physical isolation between digital and analog domains.
*   **Separate Power Grids**: Require separate power and ground planes for digital and analog circuits to prevent noise coupling.
*   **Guard Rings**: Use guard rings in the silicon layout to block substrate [[Noise]].
*   **[[Floorplanning & Power Planning]]**: Maximize the physical distance between noisy digital blocks (like the [[CPU]]) and the sensitive analog front-end of the [[Modem]].

