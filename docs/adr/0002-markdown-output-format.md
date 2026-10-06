# Markdown output format, not terminal box-drawing

Upstream banned markdown and drew output with Unicode box characters at a 55-character width, reasoning that terminals render markdown inconsistently (ARCHITECTURE.md §9.5). Pi and Claude Code both render markdown, so the skills now output markdown, keeping the four-section structure (Header, Content, Files Saved, What's Next) and the ✓ ✗ ★ status symbols and → next-step arrows. This drops most of `_system/output-format.md` (927 lines) and is the reason not to restore the box-drawing rules.
