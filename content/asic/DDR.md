---
title: DDR
---
The [[DDR]] (Double Data Rate) SDRAM interface is the critical lifeline connecting the [[ASIC]] to its main system memory. The specification for this interface is vital for overall system performance and involves selecting and configuring the two key IP blocks that form the solution: the digital memory controller and the analog/mixed-signal PHY.

### Key Specification Parameters
*   **[[DDR]] Standard**: The type of [[DDR]] SDRAM supported, chosen based on the application's [[PPA]] needs.
    *   **DDR4/DDR5**: For servers, desktops, and high-performance computing.
    *   **LPDDR4/LPDDR5**: Low-Power [[DDR]] for mobile, automotive, and other power-sensitive applications.
*   **Data Rate and Width**: The speed of the interface (e.g., 6400 Mbps) and the width of the data bus (e.g., 32 or 64 bits).
*   **Controller and PHY IP**: The specification covers both components:
    *   **Controller**: A digital IP block that translates read/write requests into [[DDR]] commands and optimizes bus usage.
    *   **PHY**: A hard macro IP containing the physical-layer circuits (drivers, receivers, PLLs) for high-speed signaling.
*   **DFI (DDR PHY Interface)**: A standardized interface (e.g., DFI 5.0) between the controller and the PHY. Specifying DFI compliance allows sourcing the controller and PHY from different vendors.

### [[Physical Design]] and Integration Challenges
The [[DDR]] PHY is one of the most difficult mixed-signal blocks to integrate due to its multi-gigahertz frequencies and picosecond-level timing margins.
*   **Timing Skew**: Any uncontrolled timing difference between clock (CLK), command/address (CA), and data strobe (DQS) signals can cause catastrophic data corruption.
*   **Physical Constraints**: The specification must include strict physical implementation guidelines for the [[Physical Design]] team:
    *   The PHY macro must be placed at the edge of the die, close to the I/O pads.
    *   Signal paths from the PHY to the pads must be meticulously length-matched to minimize skew.
    *   "Keep-out" zones must be enforced around the PHY's sensitive analog circuitry to protect it from digital [[Noise]].

The decision to include a [[DDR]] interface directly imposes significant, non-negotiable constraints on the chip's [[Floorplanning & Power Planning|floorplan]].