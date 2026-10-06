# _system files are the single source for brand-memory and output rules

Upstream told every skill to read `_system/brand-memory.md` and `_system/output-format.md`, then restated ~1,000 lines of them inline, and the copies drifted (feedback questions differ between skills). Skills now point to `_system` and keep only what is unique to them: their Reads (with depth), Writes, a load step and a feedback step. We chose a plain shared file over a model-invoked "brand-memory" skill so it costs no always-loaded description. Do not reinline these rules for "self-contained" skills.
