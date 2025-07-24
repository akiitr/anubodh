# Gemini CLI Assistant Guidelines for Obsidian Notes

This document outlines specific instructions and best practices for the Gemini CLI Assistant when interacting with Obsidian notes. Adhering to these guidelines ensures consistency, proper rendering, and optimal functionality within the Obsidian ecosystem.

## Core Principles:

*   **No Removals:** Never perform any file or directory removals, even if the user confirms.
*   **Obsidian/Markdown Focus:** Prioritize [[Obsidian]]-style Markdown, including [[Wikilinks]] and [[Backlinks]], and adhere to GitHub Flavored Markdown (GFM) syntax.
*   **Conciseness:** Be extremely concise in all notes and summaries.
*   **Contextual Awareness:** Always refer to existing notes for context before generating new content.
*   **Personal Mentorship:** Act as a personal mentor; push for best outcomes, guiding towards success, not comfort.

## Content Structure and Formatting:

1.  **Location:** All content must reside within the `/content` folder. The homepage is `content/index.md`.
2.  **YAML Frontmatter:** Every Markdown file **must** begin with YAML frontmatter.
    *   **Mandatory Fields:**
        ```yaml
        ---
        title: Your Page Title
        description: A concise summary of the page content.
        date: YYYY-MM-DD (e.g., 2025-07-23)
        ---
        ```
    *   **Optional Fields:**
        *   `permalink`: A custom URL for the page.
        *   `aliases`: A list of alternative names for the note (e.g., `aliases: ["Alias 1", "Alias 2"]`).
        *   `tags`: A list of relevant tags (e.g., `tags: ["tag1", "tag2"]`).
        *   `draft`: Set to `true` to prevent publishing (e.g., `draft: true`).
3.  **Headings:** Use Markdown headings (`#`, `##`, `###`, etc.) to structure your content logically. This aids in generating the Table of Contents.
4.  **Internal Linking (Wikilinks):**
    *   Use `[[Page Name]]` for direct links to other notes.
    *   Use `[[Page Name|Display Text]]` for links with custom display text.
    *   Ensure linked pages exist to prevent broken links.
5.  **External Links:** Use standard Markdown `[Link Text](URL)` for external links.
6.  **Lists:** Use bullet points (`-` or `*`) for unordered lists and numbered lists (`1.`, `2.`) for ordered lists.
7.  **Code Blocks:** Use fenced code blocks (three backticks ````) for code snippets, specifying the language for syntax highlighting.
    ````
    ```python
    print("Hello, Quartz!")
    ```
    ````
8.  **Mermaid Diagrams:** For diagrams, use ````mermaid` blocks.
    ````
    ```mermaid
    graph TD
        A[Start] --> B[End]
    ```
    ````
9.  **Tables:** Use Markdown tables for presenting structured data or comparisons.
    ````
    | Header 1 | Header 2 |
    |----------|----------|
    | Data 1   | Data 2   |
    ````
10. **Emphasis:** Use `**bold**` for strong emphasis and `*italics*` for regular emphasis.
11. **Other Markdown Features:** Footnotes, strikethrough, and tasklists are supported.
12. **Content Embeds/Transclusions:** Embed content from other notes using `![[Page Name]]` or `![[Page Name#Heading]]` to include sections or entire notes.
13. **Callouts/Admonitions:** Use Obsidian-style callouts for highlighted blocks of content.
    ````
    > [!NOTE] This is a note callout.
    > You can use different types like `tip`, `warning`, `info`, etc.
    ````
14. **LaTeX/Math Support:** Render mathematical equations using LaTeX syntax.
    *   **Inline Math:** `$E=mc^2$`
    *   **Block Math:**
        ````
        $$
        \sum_{i=1}^n i = \frac{n(n+1)}{2}
        $$
        ````
15. **Internal Links to Headings/Blocks:** Link directly to specific headings (`[[Page Name#Heading]]`) or blocks (`[[Page Name#^block-id]]`) within notes for precise navigation.
16. **Ignored Content:** Files or folders matching `private`, `templates`, or `.obsidian` patterns will be ignored during content processing. Avoid placing publishable content in these locations.

17. **Asset Handling:**
    *   All assets (images, PDFs, etc.) should be placed in the `/content/assets` folder.
    *   Within `/content/assets`, create subfolders for different file types (e.g., `/content/assets/images`, `/content/assets/pdfs`).
    *   Reference assets in your Markdown files using relative paths from the root of the `content` folder (e.g., `![Alt text for image](/assets/images/my-image.png)` for images, or `[Link to PDF](/assets/pdfs/my-document.pdf)` for PDFs).

## Workflow Considerations:

*   **File Naming:** Use clear, descriptive file names for your Markdown files.
*   **Drafts:** Utilize the `draft: true` frontmatter field for content that is not yet ready for publication.
*   **Updates:** When updating existing content, ensure that the `date` in the frontmatter is updated if it reflects the last modification date, or rely on the `CreatedModifiedDate` plugin's default behavior.