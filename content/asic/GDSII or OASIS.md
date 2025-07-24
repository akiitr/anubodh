---
title: GDSII or OASIS
description: GDSII and OASIS in VLSI Tape Out & Manufacturing
date: 2025-07-24
tags:
  - VLSI
  - Tape Out
  - Manufacturing
aliases:
  - GDSII
  - OASIS
---

# GDSII and OASIS in VLSI Tape Out & Manufacturing

## Simple Explanation (Gist)
GDSII (Graphic Data System II) and OASIS (Open Artwork System Interchange Standard) are industry-standard file formats used to represent the physical layout of an integrated circuit, serving as the final blueprint for chip manufacturing.

## Detailed Breakdown

*   **Purpose**: These formats contain all the geometric information (shapes, layers, coordinates) necessary to fabricate an integrated circuit. They are the ultimate output of the physical design flow and the input for the [[Foundry]] to create the photomasks used in the manufacturing process.

*   **GDSII (Graphic Data System II)**:
    *   **Legacy Standard**: GDSII has been the de facto standard for IC layout data exchange for decades, developed by Calma (now part of Cadence).
    *   **Structure**: It is a binary file format that stores hierarchical data, including cell definitions, polygons, paths, and text labels, organized by layers and data types.
    *   **Limitations**: Despite its widespread use, GDSII has limitations, particularly with increasing design complexity and file sizes. It can be inefficient for very large designs due to its flat, repetitive data representation.

*   **OASIS (Open Artwork System Interchange Standard)**:
    *   **Modern Standard**: OASIS is a newer, more efficient, and more compact alternative to GDSII, standardized by SEMI (Semiconductor Equipment and Materials International).
    *   **Advantages**: OASIS offers significant advantages over GDSII, including:
        *   **Smaller File Sizes**: Achieves much higher data compression, leading to significantly smaller file sizes (often 5-10x smaller than GDSII for the same design).
        *   **Faster Data Transfer**: Smaller files mean faster transfer times between design houses and foundries.
        *   **Improved Performance**: Faster loading and processing times in EDA tools.
        *   **Enhanced Features**: Supports more advanced features like explicit array definitions and more flexible data structures.
    *   **Adoption**: While GDSII is still prevalent, OASIS is increasingly adopted for advanced technology nodes due to its efficiency benefits.

*   **Role in Tape Out**: During [[Tape Out & Manufacturing|tape out]], the final, verified physical layout data is converted into either GDSII or OASIS format. This file is then sent to the foundry for [[Mask Generation|mask generation]] and subsequent wafer fabrication.

*   **Data Integrity**: Ensuring the integrity and correctness of the GDSII/OASIS file is paramount, as any errors at this stage can lead to costly manufacturing defects and yield loss.

## Further Reading

*   [GDSII on Wikipedia](https://en.wikipedia.org/wiki/GDSII)
*   [OASIS (Open Artwork System Interchange Standard) on SEMI](https://www.semi.org/standards-technologies/standards/oasis-open-artwork-system-interchange-standard)
*   [VLSI Physical Design: From Graph Partitioning to Timing Closure](https://www.amazon.com/VLSI-Physical-Design-Partitioning-Engineering/dp/0471721426)