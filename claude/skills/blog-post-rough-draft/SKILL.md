---
name: blog-post-rough-draft
description: Generate technical blog post rough drafts in Danny's style (blog.danwald.me) from bullet points, notes, or brief content. Use when the user asks to "create a blog post rough draft", "write a blog post", "draft a blog post", or similar requests for blog content creation.
---

# Blog Post Rough Draft Generator

This skill creates technical blog post rough drafts that match the style, tone, and format of Danny's published blog at https://blog.danwald.me/

## Overview

Transform raw content (bullet points, notes, links, brief paragraphs) into structured blog post drafts following Danny's established writing style:
- Short, focused technical posts (1-3 minute reads)
- Clear problem-solution structure
- Code-centric with practical explanations
- Casual but professional tone
- Always includes relevant reference links

## Workflow

### 1. Understand the Input
Analyze the user's provided content:
- Bullet points or rough notes
- Code snippets or technical concepts
- Links to documentation or resources
- Brief paragraphs or ideas

### 2. Review Style Guidelines
**MANDATORY**: Before writing, read the complete style guide to understand Danny's writing patterns:
```bash
# Read this file completely before drafting
view /mnt/skills/[skill-location]/references/blog_style_guide.md
```

### 3. Structure the Post

Follow this proven structure:

**Opening (1-2 sentences)**
- State the problem or context clearly
- Make it immediately relevant to technical readers
- Common patterns: "I needed to...", "I wanted to...", "[Technology] allows..."

**Core Content**
- Technical explanation with key concepts
- Use bullet points for features/characteristics
- Include actual, working code examples
- Show before/after or problem/solution when relevant

**Explanation**
- Explain how the solution works
- Focus on the "why" behind the "how"
- Keep explanations concise and technical

**Sign-off**
- Use "Happy hackin'!" or similar casual close

**References**
- List relevant documentation, tools, or resources
- Format: "Tool: Feature" or "Reference: Title"
- Always include links when available

### 4. Apply Writing Style

**Tone**:
- Conversational but technical
- Direct and concise (no fluff)
- Assumes reader has basic technical knowledge
- Friendly expert sharing knowledge

**Language**:
- Short sentences and paragraphs
- Active voice
- Technical terminology without over-explanation
- Show code first, then explain

**Formatting**:
- Use code blocks for all code
- Bullet points for lists of features
- Minimal header hierarchy
- Keep it scannable

### 5. Keep It Short
- Target: 1-3 minute read (200-500 words)
- One focused topic per post
- Cut unnecessary elaboration
- Get to the point quickly

## Output Format

Provide the draft as markdown with:
1. **Title** - Clear, descriptive (e.g., "CONCAT to update db text field")
2. **Body** - Following the structure above
3. **Metadata suggestion** - Estimated read time, relevant tags

## Common Patterns

### Problem-Solution Posts
```
[Problem statement: 1-2 sentences]

[Solution introduction]

[Code block]

[Explanation of how it works]

Happy hackin'!

References:
- [Tool]: [Feature]
```

### Concept Explanation Posts
```
[What it is: 1-2 sentences]

[Key characteristics - bullet points]

[Code example showing usage]

[Technical detail or gotcha]

[Casual sign-off]
```

### Process/Workflow Posts
```
[Context or background]

[Process steps or characteristics - bullet points]

[Code or implementation example]

[Why this matters or gotchas]

References:
- [Documentation links]
```

## Tips

- **Lead with code** - Show working examples, not pseudocode
- **One topic** - Don't try to cover too much
- **Real examples** - Use actual values, not placeholders like "foo/bar"
- **Credit sources** - Always link to Stack Overflow, docs, etc.
- **No fluff** - Cut introductory platitudes like "In this post, we'll explore..."
- **Technical depth** - Don't explain basics, focus on non-obvious behavior
- **Casual ending** - "Happy hackin'!" is the signature sign-off

## Note on Photos

Danny's blog includes Unsplash photos with attribution. The skill generates text content only; photo selection is handled separately in the blog platform.
