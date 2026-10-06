# Changes from the original v2.0

Edited against Matt Pocock's `/writing-for-agents` (see `../mattpocock-skills`).

- **Descriptions trimmed** from 25–184 words to ~25 each (~1,300 → ~280 always-loaded words). Trigger-synonym lists and Reads/Writes/Chains lists removed; each skill body already carries them.
- **`/start-here` is user-invoked** (`disable-model-invocation: true`). Type `/start-here` to use it; the other 10 skills stay model-invoked so it can still route to them.
- **Dead skill references removed**: `/audience-research`, `/competitive-intel`, `/paid-ads`, `/landing-page`, `/cro`. `audience.md` and `competitors.md` are still read; write them by hand.
- **`_system` paths fixed**: `_system/…` → `../_system/…` in every SKILL.md, so they resolve from the skill's folder. Copy `_system/` alongside any skills you move.
- **`/start-here` anti-patterns rewritten as Operating Rules**: positive instructions, WRONG examples dropped.
- **ARCHITECTURE.md** corrected: install path, rules list, known gaps.

Not changed: skill bodies' length, the Unicode output format, the `/creative` model registry (Feb 2026).
