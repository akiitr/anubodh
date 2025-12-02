---
title: "You SUCK at Prompting AI (Here's the secret)"
date: 2025-11-28
tags: [youtube, summary, AI]
aliases: []
draft: false
---

# Video Summary: You SUCK at Prompting AI (Here's the secret)

## The Core Thesis
**Prompting is not conversation; it is programming.** 
The "secret" to effective prompting lies in understanding that Large Language Models (LLMs) are not thinking entities but **prediction engines**. They simply predict the next logical token based on statistical probability. Therefore, a good prompt acts as a set of constraints that guides the model toward the specific pattern you want, rather than leaving it to guess.

## The 7-Step Framework for Better Prompts

### 1. The Mindset: Probability over Intellect
Understand that the AI isn't "smart"; it’s a pattern completer. If you ask a vague question, you get a generic, high-probability answer. Your goal is to narrow the probabilities to your specific use case.

### 2. Personas (The "Who")
Assign a specific role to the AI (e.g., *"You are a Senior Site Reliability Engineer with 10 years of experience"*).
*   **Why it works:** It focuses the AI's "latent space" (knowledge base) on a specific domain, filtering out irrelevant generalist information.

### 3. Context is King ("Always Be Contexting")
Adhere to the **ABC Principle: Always Be Contexting.**
*   Provide relevant background info, code snippets, or error logs.
*   The more specific the context, the lower the chance of the AI "hallucinating" (guessing) to fill in the blanks.

### 4. Few-Shot Prompting (The "How")
Instead of describing what you want, **show it.**
*   **Zero-Shot:** Asking without examples (least effective).
*   **Few-Shot:** Providing 1–3 examples of "Input -> Desired Output" pairs.
*   **Why it works:** LLMs are better at mimicking patterns they can see than following abstract instructions.

### 5. Output Constraints
Don't let the AI decide the format. Explicitly define:
*   **Format:** JSON, Markdown table, Bullet points, etc.
*   **Tone:** Professional, humorous, apologetic, dry.
*   **Length:** "Summarize in exactly 3 sentences."

### 6. Tools & External Knowledge
LLMs have a knowledge cutoff. For current events or specific docs, enable **Web Search** or external tools.
*   *Warning:* Always verify the sources, as the AI might ingest unreliable content from the web.

### 7. Permission to Fail
Explicitly tell the AI: *"If you do not know the answer, state that you do not know."*
*   **Why it works:** LLMs are designed to please the user by completing the pattern. Without this permission, they often make up convincing lies rather than admit ignorance.

---

## Case Study: The Cloudflare Apology
The video demonstrates these principles by rewriting a generic corporate apology email regarding a Cloudflare outage.
*   **The Bad Prompt:** "Write an apology email for an outage." (Result: Generic, insincere fluff).
*   **The Good Prompt:** Applied a **Senior PR Persona**, provided **Context** on exactly why the servers failed, used **Few-Shot** examples of transparent communication, and set a **Professional Tone**.
*   **The Result:** A detailed, technical, and sincere apology that actually addressed user concerns.

## Key Takeaways
*   **Treat prompting as coding:** Define inputs, constraints, and expected outputs.
*   **ABC:** Always Be Contexting.
*   **Narrow the scope:** Use personas to restrict the model's focus.
*   **Show, don't just tell:** Use Few-Shot prompting to demonstrate the desired pattern.
*   **Kill hallucinations:** explicitly allow the AI to say "I don't know."

**Source:** [You SUCK at Prompting AI (Here's the secret)](https://www.youtube.com/watch?v=pwWBcsxEoLk)