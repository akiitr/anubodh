---
title: Memory Hierarchy
---
The [[Memory Hierarchy]] specification defines the tiered structure of all memory and storage elements. It is designed to bridge the speed gap between fast processors and slow main memory by balancing access speed, capacity, and cost. This architecture exploits the *locality of reference* principle in program behavior.

### Levels of the Hierarchy
The hierarchy is structured like a pyramid, with faster, smaller, more expensive memory at the top.

*   **On-Chip Memory**:
    *   **Processor Registers**: Fastest level, inside the [[CPU]] core, holding immediate operands.
    *   **L1 [[Cache Coherency|Cache]]**: Small (e.g., 32-64 KB), fastest cache, private to each [[CPU]] core, often split for instructions (I-Cache) and data (D-Cache).
    *   **L2 [[Cache Coherency|Cache]]**: Larger (e.g., 256 KB - 4 MB) and slower than L1, can be private or shared by a cluster of cores.
    *   **L3 [[Cache Coherency|Cache]]**: Largest on-die cache (e.g., 8-64 MB), shared by all cores, acting as a last-level cache before going off-chip.

*   **Off-Chip Memory**:
    *   **Main Memory**: The system's primary memory, typically external [[DDR]] SDRAM, accessed via the chip's memory controller.
    *   **Secondary Storage**: Slowest and largest tier, such as SSDs or HDDs (not part of the [[ASIC]] itself but accessed via I/O).

### Design Principle
The specification for cache sizes, associativity, and policies is based on analyzing the target application's memory access patterns to maximize cache hits and minimize high-latency accesses to main memory.

### Hierarchy Pyramid
```mermaid
graph TD
    direction TB
    subgraph "Speed & Cost (High to Low)"
        A(CPU Registers) --> B(L1 Cache - SRAM);
        B --> C(L2 Cache - SRAM);
        C --> D(L3 Cache - SRAM);
        D --> E(Main Memory - DDR SDRAM);
        E --> F(Secondary Storage - SSD/HDD);
    end
    subgraph "Capacity (Low to High)"
        A_C(Smallest) --> B_C --> C_C --> D_C --> E_C --> F_C(Largest);
    end
