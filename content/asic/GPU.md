---
title: GPU
---
A Graphics Processing Unit ([[GPU]]) is a massively parallel processor integrated into an [[SoC]] for two main purposes: traditional graphics rendering or, increasingly, as a compute accelerator for Artificial Intelligence (AI) and Machine Learning (ML) workloads.

### Key Specification Elements
*   **Primary Function**: The spec must state if the [[GPU]] is for graphics, compute (AI), or both. This choice dictates required features and API support.
*   **Performance Targets**:
    *   **Graphics**: Measured in pixel/texel fill rate (GPixels/sec) or the ability to render an application at a target frame rate/resolution.
    *   **AI Compute**: Measured in raw throughput, like Tera-Operations Per Second (TOPS) or Tera-FLOPs (TFLOPS).
*   **Degree of Parallelism**: Defines the number of parallel processing units (often called "shader cores" or "compute units"), which directly determines the [[GPU]]'s processing power.
*   **[[Memory Hierarchy|Memory Interface]]**: GPUs are extremely hungry for memory bandwidth. The specification must define a high-bandwidth path to memory, often a wide bus to high-speed [[DDR]] or an on-package High Bandwidth Memory (HBM) subsystem.
*   **Software and API Support**: A critical non-functional requirement.
    *   **Graphics**: Support for APIs like OpenGL ES or Vulkan.
    *   **Compute**: Support for APIs like OpenCL or CUDA (for the NVIDIA ecosystem).

### Architectural Trade-off: [[GPU]] vs. Custom AI Accelerator
For AI applications, a fundamental architectural choice exists between a general-purpose [[GPU]] and a custom-designed AI accelerator.

*   **[[GPU]] (General-Purpose)**:
    *   **Pro**: Flexible; can run a wide variety of evolving AI models.
    *   **Con**: Inefficient for any single task. A significant portion of the silicon is not optimally used, leading to a [[PPA]] penalty.

*   **Custom AI Accelerator [[ASIC]]**:
    *   **Pro**: A "physical embodiment of the algorithm." Vastly more efficient in performance-per-watt and performance-per-dollar for a *specific, fixed* algorithm.
    *   **Con**: Inflexible. If the AI algorithm changes, the [[ASIC]] may become obsolete.

The specification choice is strategic: specify a [[GPU]] for flexibility in a rapidly evolving field, or a custom accelerator for the best [[PPA]] in a high-volume, cost-sensitive application with a stable algorithm.
