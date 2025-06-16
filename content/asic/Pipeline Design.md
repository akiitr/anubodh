---
title: Pipeline Design
---
Pipelining is a core [[Microarchitecture]] technique that breaks the execution of an instruction into a sequence of smaller, independent "stages". By overlapping the execution of multiple instructions, with each stage working on a different instruction simultaneously, it dramatically increases instruction throughput.

### Key Specification Elements
*   **Pipeline Stages**: The number of stages and the function of each. Deeper pipelines (more stages) allow for a higher [[Clock Frequency]] but increase complexity and hazard penalties.
*   **Pipeline Registers**: Registers between each stage that hold intermediate results and control signals, isolating the stages.
*   **Hazard Handling Mechanisms**: Hardware to resolve conflicts:
    *   **Data Hazards**: An instruction depends on a result from a previous, unfinished instruction. Resolved with *forwarding* or *bypassing*.
    *   **Control Hazards**: Occur from branch instructions. Mitigated by *pipeline stalls* and *branch prediction*.
*   **[[Handshake Protocol]]**: For data-flow pipelines, defines signaling (e.g., valid/ready) to manage data transfer between stages.

### Classic 5-Stage RISC Pipeline
A common model for a [[CPU]] pipeline is:
1.  **Instruction Fetch (IF)**
2.  **Instruction Decode (ID)**
3.  **Execute (EX)**
4.  **Memory Access (MEM)**
5.  **Register Write-back (WB)**

### Pipeline Flow with Forwarding
The choice of pipeline depth is a critical trade-off. Deeper pipelines enable higher [[Clock Frequency]] but suffer a greater performance penalty on branch mispredictions, requiring a more sophisticated branch prediction unit.

```mermaid
graph TD
    subgraph "Pipeline Stages"
        direction LR
        IF[Instruction Fetch] --> ID[Instruction Decode];
        ID --> EX[Execute];
        EX --> MEM[Memory Access];
        MEM --> WB[Write-back];
    end

    subgraph "Hazard Forwarding Paths"
        MEM -- Result --> EX;
        WB -- Result --> ID;
    end
