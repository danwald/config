**Golden rule**: When unsure about implementation details or requirements, ALWAYS consult the developer rather than making assumptions.

---

##  Non-negotiable golden rules

| #: | AI *may* do                                                            | AI *must NOT* do                                                                    |
|---|------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| G-0 | Whenever unsure about something that's related to the project, ask the developer for clarification before making changes.    |  ❌ Write changes or use tools when you are not sure about something project specific, or if you don't have context for a particular feature/decision. |
| G-1 | Generate code **only inside** relevant source directories  | ❌ Touch `tests/`, `SPEC.md`, or any `*_spec.py` / `*.ward` files (humans own tests & specs). |
| G-2 | Add/update **`AIDEV-NOTE:` anchor comments** near non-trivial edited code. | ❌ Delete or mangle existing `AIDEV-` comments.                                     |
| G-3 | Follow lint/style configs (`pyproject.toml`, `.ruff.toml`, `.pre-commit-config.yaml`). Use the project's configured linter, if available, instead of manually re-formatting code. | ❌ Re-format code to any other style.                                               |
| G-4 | For changes >300 LOC or >3 files, **ask for confirmation**.            | ❌ Refactor large modules without human guidance.                                     |
| G-5 | Stay within the current task context. Inform the dev if it'd be better to start afresh.                                  | ❌ Continue work from a prior prompt after "new task" – start a fresh session.      |

---

## Build, test & utility commands

Use `uv` for running applications with project context

```bash
uv run ruff                         # Run format
uv run mypy                         # Run typecheck
uv run pytest                       # Run tests
uv run pytest -k "pattern"          # Run specific tests pattern
```
For simple, quick Python script tests: `PYTHONPATH=$PWD python tests/test_file.py` (ensure correct CWD).

---

## Coding standards

*   **Python**: 3.12+, FastAPI, `async/await` preferred.
*   **Formatting**: `ruff` enforces 96-char lines, double quotes, sorted imports. Standard `ruff` linter rules.
*   **Typing**: Strict (Pydantic v2 models preferred); `from __future__ import annotations`.
*   **Naming**: `snake_case` (functions/variables), `PascalCase` (classes), `SCREAMING_SNAKE` (constants).
*   **Error Handling**: Typed exceptions; context managers for resources.
*   **Documentation**: Google-style docstrings for public functions/classes.
*   **Testing**: Separate test files matching source file patterns.

**Error handling patterns**:
- Use typed, hierarchical exceptions defined in `exceptions.py`
- Catch specific exceptions, not general `Exception`
- Use context managers for resources (database connections, file handles)
- For async code, use `try/finally` to ensure cleanup

Example:
```python
from agents_api.common.exceptions import ValidationError

async def process_data(data: dict) -> Result:
    try:
        # Process data
        return result
    except KeyError as e:
        raise ValidationError(f"Missing required field: {e}") from e
```

---

## Anchor comments

Add specially formatted comments throughout the codebase, where appropriate, for yourself as inline knowledge that can be easily `grep`ped for.

### Guidelines:

- Use `AIDEV-NOTE:`, `AIDEV-TODO:`, or `AIDEV-QUESTION:` (all-caps prefix) for comments aimed at AI and developers.
- Keep them concise (≤ 120 chars).
- **Important:** Before scanning files, always first try to **locate existing anchors** `AIDEV-*` in relevant subdirectories.
- **Update relevant anchors** when modifying associated code.
- **Do not remove `AIDEV-NOTE`s** without explicit human instruction.
- Make sure to add relevant anchor comments, whenever a file or piece of code is:
  * too long, or
  * too complex, or
  * very important, or
  * confusing, or
  * could have a bug unrelated to the task you are currently working on.

Example:
```python
# AIDEV-NOTE: perf-hot-path; avoid extra allocations (see ADR-24)
async def render_feed(...):
    ...
```

---

## Commit discipline

*   **Granular commits**: One logical change per commit.
*   **Tag AI-generated commits**: e.g., `feat: optimise feed query [AI]`.
*   **Clear commit messages**: Explain the *why*; link to issues/ADRs if architectural.
*   **Use `git worktree`** for parallel/long-running AI branches (e.g., `git worktree add ../wip-foo -b wip-foo`).
*   **Review AI-generated code**: Never merge code you don't understand.

---

## Python expressions in tasks (agents-api)

*   Evaluated using `simpleeval` in a sandboxed environment.
*   Use `validate_py_expression()` from `agents_api.activities.task_steps.base_evaluate` for static checks (syntax, undefined names, safety).
*   Expressions have access to `_` (current input) and standard library modules.
*   Test expressions: `PYTHONPATH=$PWD python -c "from agents_api.activities.task_steps.base_evaluate import validate_py_expression; print(validate_py_expression('$ your_expr_here'))"`
*   Task validation handles raw task dictionaries and Pydantic models (after `task_to_spec` conversion).
*   In `task_to_spec` converted tasks, `kind_` field denotes step type. Raw tasks use step type keys.
*   For "if_else" steps, condition is in `if_` field (aliased as "if").

**Expression example**:
```python
# Simple expression example
"$_['customer']['total_orders'] > 5"  # Checks if customer has more than 5 orders

# More complex example with dict access and function calls
"$len([x for x in _['items'] if x['category'] == 'electronics']) > 0"
```

---

## Ward testing framework

*   Use descriptive test names: `@test("Descriptive name of what is being tested")`.
*   Activate virtual environment: `uv run pytest`.
*   Filter tests: `uv run pytest --search "pattern_to_match"` (do NOT use `-p`).
*   Limit failures for faster feedback: `uv run test --fail-limit 1 --search "pattern_to_match"`.

---

## Directory-Specific AGENTS.md Files

*   **Always check for `AGENTS.md` files in specific directories** before working on code within them. These files contain targeted context.
*   If a directory's `AGENTS.md` is outdated or incorrect, **update it**.
*   If you make significant changes to a directory's structure, patterns, or critical implementation details, **document these in its `AGENTS.md`**.
*   If a directory lacks a `AGENTS.md` but contains complex logic or patterns worth documenting for AI/humans, **suggest creating one**.

---

## Common pitfalls

*   Mixing pytest & ward syntax (ward uses `@test()` decorator, not pytest fixtures/classes).
*   Forgetting to `source .venv/bin/activate`.
*   Wrong current working directory (CWD) or `PYTHONPATH` for commands/tests (e.g., ensure you are in `agents-api/` not root for some `agents-api` tasks).
*   Large AI refactors in a single commit (makes `git bisect` difficult).
*   Delegating test/spec writing entirely to AI (can lead to false confidence).
*   **Note about `src/`**: Only the `cli` component has a `src/` directory. For `src/agents-api`, code is directly in `agents_api/`. Follow the existing pattern for each component.

---

## Versioning conventions

Semantic Versioning (SemVer: `MAJOR.MINOR.PATCH`) is generally followed, as specified in each component's `pyproject.toml` file.

*   **MAJOR** version update: For incompatible API changes.
*   **MINOR** version update: For adding functionality in a backward-compatible manner.
*   **PATCH** version update: For backward-compatible bug fixes.

---

## Meta: Guidelines for updating AGENTS.md files

### Elements that would be helpful to add:

1. **Decision flowchart**: A simple decision tree for "when to use X vs Y" for key architectural choices would guide my recommendations.
2. **Reference links**: Links to key files or implementation examples that demonstrate best practices.
3. **Domain-specific terminology**: A small glossary of project-specific terms would help me understand domain language correctly.
4. **Versioning conventions**: How the project handles versioning, both for APIs and internal components.

### Format preferences:

1. **Consistent syntax highlighting**: Ensure all code blocks have proper language tags (`python`, `bash`, etc.).
2. **Hierarchical organization**: Consider using hierarchical numbering for subsections to make referencing easier.
3. **Tabular format for key facts**: The tables are very helpful - more structured data in tabular format would be valuable.
4. **Keywords or tags**: Adding semantic markers (like `#performance` or `#security`) to certain sections would help me quickly locate relevant guidance.

[^1]: This principle emphasizes human oversight for critical aspects like architecture, testing, and domain-specific decisions, ensuring AI assists rather than fully dictates development.

---
---

## AI Assistant Workflow: Step-by-Step Methodology

When responding to user instructions, the AI assistant (Claude, Cursor, GPT, etc.) should follow this process to ensure clarity, correctness, and maintainability:

1. **Consult Relevant Guidance**: When the user gives an instruction, consult the relevant instructions from `AGENTS.md` files (both root and directory-specific) for the request.
2. **Clarify Ambiguities**: Based on what you could gather, see if there's any need for clarifications. If so, ask the user targeted questions before proceeding.
3. **Break Down & Plan**: Break down the task at hand and chalk out a rough plan for carrying it out, referencing project conventions and best practices.
4. **Trivial Tasks**: If the plan/request is trivial, go ahead and get started immediately.
5. **Non-Trivial Tasks**: Otherwise, present the plan to the user for review and iterate based on their feedback.
6. **Track Progress**: Use a to-do list (internally, or optionally in a `TODOS.md` file) to keep track of your progress on multi-step or complex tasks.
7. **If Stuck, Re-plan**: If you get stuck or blocked, return to step 3 to re-evaluate and adjust your plan.
8. **Update Documentation**: Once the user's request is fulfilled, update relevant anchor comments (`AIDEV-NOTE`, etc.) and `AGENTS.md` files in the files and directories you touched.
9. **User Review**: After completing the task, ask the user to review what you've done, and repeat the process as needed.
10. **Session Boundaries**: If the user's request isn't directly related to the current context and can be safely started in a fresh session, suggest starting from scratch to avoid context confusion.
