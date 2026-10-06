# Code Context — boring marketer skills: SKILL.md split map

Root: `/Users/david/Desktop/skills/boring marketer skills/`. Read-only; nothing edited.
Outline format: `startLine (lines) heading`. Line counts were computed with awk, with ``` fenced blocks excluded so that `#` inside templates is not counted as a heading. Branch, bulk and spine figures are **estimates** from the heading ranges; I did not classify each line by hand.

## Files Retrieved
- 11 × `<skill>/SKILL.md` (16,503 lines total, below), `_system/brand-memory.md` (472), `_system/output-format.md` (927)
- Reference/mode files (line counts): content-atomizer/references/platform-playbook.md 1130; creative/modes/{ad-creative 1723, product-photo 1519, product-video 1656, social-graphics 1510, talking-head 2207}; creative/references/{MODEL_REGISTRY 758, VISUAL_INTELLIGENCE 1233}; direct-response-copy/references/COPYWRITING_PLAYBOOK.md 1636; lead-magnet/references/{format-examples 351, info-product-magnets 199, psychology 282, saas-magnets 250, services-magnets 321}; newsletter/references/newsletter-examples.md 541; positioning-angles/references/{angle-frameworks 187, dunford 135, hormozi-offer 247, schwartz 166, unique-mechanism 162}; seo-content/references/eeat-examples.md 654.
- Skills with no references/: brand-voice, email-sequences, keyword-research, start-here.

## Key finding: broken pointers
- `creative/SKILL.md:426-427` points to `modes/product-photos.md` and `modes/product-videos.md`. The files on disk are `product-photo.md` and `product-video.md` (singular), so both pointers are **broken**.
- Every SKILL.md points to both `_system` files (lines ~12-22). Exception: positioning-angles points to output-format only at line 272.

---

## 1. brand-voice (1492)
Outline: 6(16) title · 22(4) Brand Memory Integration [26(7) Reads, 33(6) Writes, 39(20) Context Loading] · 59(5) Iteration Detection [64(60) EXISTS→Update Mode, 124(6) NOT EXIST→Mode Selection] · 130(21) Core Job · 151(2) Three Modes [153(7) Extract, 160(7) Build, 167(30) Auto-Scrape] · 197 Mode1 Extract [199(10) What to Analyze, 209(40) What to Look For, 249(7) Extract Output] · 256 Mode2 Build [258(27) Strategic Questions, 285(16) Build Process] · 301 Mode3 Auto-Scrape [306(15) Prereqs, 321(71) Process] · 392 Voice Test Loop [397(47) Step1, 444(24) Step2, 468(18) Step3] · 486(226) Voice Profile (Output Format) · 712 Formatted Output [719(119) Terminal Template] · 838-950 Example Extracted (Marc Lou, ~113) · 951-1072 Example Built (~122) · 1073-1110 Example Auto-Scraped (~38) · 1111 File Output Protocol [1116(11),1127(11),1138(12)] · 1150 Platform Adaptation Guide (56: Email/LinkedIn/X/Blog/Landing) · 1206(41) Connects · 1247(19) When to Revisit · 1266(19) Test · 1285(17)+1302(27) Feedback · 1329 Error States [1331(19) no content-Extract, 1350(25) AutoScrape insufficient, 1375(19) no web search] · 1394(56) Complete Invocation Flow · 1450(43) Impl Notes.
- **Branches:** Update mode (64-123, 60). Extract (197-255 + 1331-1349 error + 838-950 example). Build (256-300 + 951-1072 example). Auto-Scrape (167-196 detail, 301-391, 1073-1110 example, 1350-1393 errors).
- **Spine:** intro, BMI 22-58, mode selection 124-166, core job, voice test loop 392-485, profile format, file output, test, feedback, invocation flow.
- **Bulk:** profile template 226, terminal template 126, three examples ~273, platform guide 56. The invocation flow (56) repeats the step sections.
- **Pointers:** _system only; no references/ folder.

## 2. content-atomizer (1696)
Outline: 7(14) · 21(37) BMI [58(26) Context Loading Display] · 84(30) Platform Voice Adaptation Table · 114 Web Search for Algorithm Updates [118(10),128(8),136(25),161(22) Staleness] · 183(12) Core Job · 195 Input Types [197(13),210(14)] · 224 Platform Playbooks [226(123) LinkedIn, 349(126) X, 475(153) Instagram, 628(83) TikTok, 711(111) YouTube, 822(79) Threads, 901(74) Bluesky, 975(91) Reddit] · 1066 Workflow [Steps 1-6: 32/4/4/12/10/16] · 1146 Per-Platform File Output [1150(38),1188(7),1195(15),1210(41)] · 1251 Scheduling [1253(11) Detect, 1264(28) If Scheduler, 1292(46) If None] · 1338 Content Calendar Mode [1342(10),1352(116) Output Format,1468(12)] · 1480 Anti-Patterns [1482(35),1517(13)] · 1530 Examples [1532(20),1552(23)] · 1575(17) Platform Voice Adjustments · 1592(16) Specs · 1608(15) Test · 1623(28) Feedback · 1651(24) Connects · 1675(22) What's Next.
- **Branches:** each platform playbook is used only when that platform is a target. The 8 playbooks total 842 lines (224-1065). Calendar mode is 142 lines (1338-1479). Scheduler detected vs not detected is 87 lines.
- **Spine:** BMI, algorithm search (~69), core job, inputs, workflow (~80), file output (~103), test, feedback, connects, what's next.
- **Bulk:** voice table 30, anti-patterns 50, examples 45, voice adjustments 17, specs 16. The playbooks overlap with `references/platform-playbook.md`, which covers the same platforms as "Deep Dive" sections: algorithm, hooks, creators. The voice table (84), voice adjustments (1575) and specs (1592) all restate per-platform rules, so there is duplication inside the file as well.
- **Pointers:** `references/platform-playbook.md` (line 138) is the only reference file and it is pointed to.

## 3. creative (531)
Outline: 6(16) · 22(23) What Are We Making? · 45 First-Time Setup [47(19) API key, 66(12) Test, 78(12) Models, 90(18) Stack, 108(18) Prompt-Only Mode] · 126 Brand Kit [128(46) Building, 174(10) Using] · 184 Style Exploration [188(69) 5-Direction, 257(9) When to Skip] · 266(38) Smart Model Selection · 304 Batch Generation [308(23),331(12),343(9)] · 352 File Output [356(49) Dir, 405(15) Naming] · 420(15) Mode Files · 435(9) Reference Files · 444 Quality Gate (~30) · 474 Handoff [476(14),490(20)] · 510(22) What's Next.
- **Branches:** five asset modes plus free generation, routed through the mode files. First-time setup (81) runs only when there is no token. Prompt-only mode (18) runs only when there is no API key. Building the brand kit (46) and the 5-direction exploration (78) run only on the first run.
- **Spine:** router 22-44, using the brand kit, model selection, file output, the mode/reference tables, quality gate, handoff, what's next.
- **Bulk:** model selection 38 (overlaps MODEL_REGISTRY), directory tree 49. This file is already lean, and most of the content is in modes/ (8.6k lines).
- **Pointers:** all files in modes/ and references/ are pointed to, but two of the mode pointers are broken (see above).

## 4. direct-response-copy (1238)
Outline: 7(12) · 19(36) BMI · 55(49) What Are We Writing? · 104 Iteration [108(17) campaign exists, 125(6) none] · 131(8) core principle · 139 Headlines (~59: master 10, story 10, specificity 10, question 8, transformation 8, fail 9) · 198 Opening lines (~56) · 254 Curiosity gaps (~44) · 298 Flow/slippery slide (~71: bucket brigades 21, stutter 10, short sentences 12, paragraph 12, momentum 10) · 369(22) Pain quant · 391(20) So What chain · 411(29) Rhythm · 440(17) Founder story · 457(17) Testimonials · 474(22) Disqualification · 496(19) CTAs · 515(23) Internet-native voice · 538(19) Full sequence · 557(56) AI tells · 613(20) Example transformation · 633(18) Test · 651(13) Reference Material · **664 # Variant Generation** [670(65) Headlines 5-10, 735 Body A/B/C (~60), 795(17) Email subjects] · **812 # Scoring Rubric** (78) · **890 # A/B Testing** (108, incl. 954(44) examples) · **998 # File Output** (76) · **1074 # Output Formatting** (91: Header/Content/Files/What's Next) · **1165 # Feedback** (46) · **1211 # Appendix Checklists** (28).
- **Branches:** the asset type router (landing page, sales page, email, ad, and so on) has no asset-specific sections. Update vs new is 17 lines. Variant generation, scoring and A/B testing are all optional add-ons (~334).
- **Spine:** BMI, router, iteration, core principle, full sequence, test, file output, what's next.
- **Bulk:** the craft library (lines 139-632, ~494) **duplicates COPYWRITING_PLAYBOOK.md**. The playbook has the same headline types, the same opening lines (direct challenge, story, confession, specific result, question, short sentence, "to avoid"), and the same open loops, seeds of curiosity, bucket brigade, stutter, short first sentences, paragraph variation and momentum killers. The SKILL.md even notes at line 651 that the playbook is the deep version. Checklists 28. Output Formatting (91) restates the 4-section structure from output-format.md.
- **Pointers:** `references/COPYWRITING_PLAYBOOK.md` (653), the only reference file, is pointed to and comes with load conditions.

## 5. email-sequences (1720)
Outline: 7(12) · 19(41) BMI [60(26) display] · 86 ESP Detection [90(11),101(36)] · 137 Iteration [141(25),166(6)] · 172(12) Core Job · 184(13) Sequence Types · 197(17) Gather Context · 214 Welcome (270: framework 12, Emails 1-7 47/47/28/15/50/30/30) · 484 Conversion (23) · 507 Launch (42) · 549 Re-engagement (22) · 571 Subject Formulas (46) · 617 Subject A/B (58) · 675 Copy Principles (~36) · 711 Architecture (23) · 734 Send Timing (61) · 795 Individual File Output [799(15),814(25),839(56)] · 895(46) Campaign Brief · 941 Summary [945(88)] · 1033-1256 Example Welcome sequence (224) · 1257-1342 Example Subject A/B (86) · 1343(72) Example file · 1415(155) Full Output Template · 1570(32) Connects/atomizer · 1602-1643 Recording Feedback (42) · 1644(20) Test · 1664 Appendix Checklists (56).
- **Branches:** sequence type: Welcome 270, Conversion 23, Launch 42, Re-engagement 22. Welcome is much more detailed than the other three. ESP detection output differs by ESP (~36). Update vs new is 25 lines.
- **Spine:** BMI, ESP detection, iteration, core job, types router, gather context, copy principles, file output, summary, connects, feedback, test.
- **Bulk:** examples 382 (1033-1414), full template 155, subject formulas/A-B 104, send timing 61, architecture 23, checklists 56, file format 56. Campaign Brief (46) restates brand-memory "Campaign Brief Format" (brand-memory.md:171).
- **Pointers:** _system only; no references/ folder.

## 6. keyword-research (1486)
Outline: 6(17) · 23 BMI [27(8),35(8),43(28)] · 71 Iteration [75(64) Refresh Mode, 139(6) Full] · 145(15) Core Job · 160(17) Process · 177(36) Gather Context · 213(25) Phase1 Seeds · 238 Phase2 6 Circles (~66 incl. 272(32) techniques) · 304 Phase3 Web Validation (~149: autocomplete 22, PAA 23, SERP 29, competitor 33, output 37) · 453 Phase4 Cluster (55) · 508(85) Phase5 Pillar Validation · 593 Phase6 Prioritize (70) · 663 Phase7 Map (53) · 716 Phase8 Briefs [721(66) template, 787(6), 793(9)] · 802(67) Plan File Format · 869 Formatted Output [876(164) Terminal Template] · 1040(32) Chain to /seo-content · 1072-1189 Example (118) · 1190(14) NOT do · 1204(15) Free Tools · 1219(16) Connects · 1235(71) Invocation Flow · 1306(16) Test · 1322-1361 Feedback (40) · 1362 Error States (70: no web 27, no context 18, competitor URLs 23) · 1432(55) Impl Notes.
- **Branches:** Refresh vs full research (64 vs 6). Web search available vs not: Phase 3 (149) applies only with web search, and the "no web search" error state (27) only without it.
- **Spine:** Phases 1-8 make up most of the file (~590), plus BMI, chain, test and feedback.
- **Bulk:** terminal template 164, example 118, brief template 66, plan format 67, free tools 15. The invocation flow (71) and impl notes (55) repeat the phases.
- **Pointers:** _system only. The brief/plan formats would fit `_system/schemas/{content-brief,keyword-plan}.schema.json`.

## 7. lead-magnet (1126)
Outline: 7(12) · 19(36) BMI [55(23) display] · 78 Competitive Research [82(37), 119(9) no web] · 128 Iteration [132(23),155(6)] · 161(15) Core Job · 176 Context [178(25),203(8),211(11)] · 222 Framework (~62: specificity, bridge, quick win, value eq) · 284 Format Selection [286(52)] · 338 Hook Generators (34, 7 types) · 372(89) Concept Output Format · 461 Build Mode [465(7),472(10),482(115) Output by Format] · 597 File Output [601(8),609(7),616(21),637(40) Campaign Brief] · 677(97) Build Mode Output Template · 774 Funnel Chain (45) · 819-867 Example concepts (49) · 868-931 Example build (64) · 932(17) Invocation · 949(31) What it does · 980(28) Test · 1008-1040 Feedback (33) · 1041(23) Connects · 1064(12) References · 1076 Checklists [1078(11),1089(12),1101(17) Build,1118(9)].
- **Branches:** Ideation (concepts) vs Build mode. The build-only sections are 461-596 (136), the build template (97), the build example (64) and the build checklist (17), ~314 total. Within build, the 115 lines at 482 split by format type (checklist, guide, quiz, ...). Update vs new is 23 lines. No-web-search fallback is 9 lines.
- **Spine:** BMI, research, iteration, core job, context, framework, hooks, concept output, file output, funnel chain, test, feedback.
- **Bulk:** format selection 52 (overlaps `references/format-examples.md`), concept output template 89, concept example 49, checklists ~49. Campaign Brief Format (40) restates brand-memory.md:171.
- **Pointers:** the References section (1064-1075) names all 5 reference files by bare filename, without the `references/` prefix. All are mentioned, but there are no load conditions saying when to read which one, e.g. saas/services/info by business type.

## 8. newsletter (1562)
Outline: 7(14) · 21(40) BMI [61(24)] · 85(10) core job · 95 Type? (6 types, ~54) · 149 Templates [151(64) Deep-dive, 215(68) News, 283(63) Curated, 346(58) Essay, 404(64) Builder, 468(58) Irreverent] · 526 Voice & Tone (51) · 577 Subject Formulas (29) · 606(15)+621(6) Scannability · 627 Hook Patterns (22) · 649 Curation vs Original (28) · 677 Web Search Sourcing (65) · 742 Platform Guidance [746(26) Beehiiv, 772(30) Substack, 802(29) Kit, 831(32) Ghost, 863(17) select, 880(11) formatting] · 891 Growth (139) · 1030 Monetization (158) · 1188 Workflow (~37) · 1225(18) Best-in-Class Examples · 1243 File Output (~74) · 1317(25) Connects · 1342 Chain to atomizer (57) · 1399(14) Test · 1413(24) Feedback · 1437(46) Execution Flow · 1483(80) Output Format.
- **Branches:** newsletter type × template, 377 lines (one template per run). Per-platform guidance is 149 lines (one platform per run). Growth (139) and monetization (158) are situational strategy and are not used in a normal issue-writing run. Web-search sourcing (65) mainly applies to the news and curated types.
- **Spine:** BMI, core job, type router (54), voice, subjects, hooks, workflow, file output, connects, test, feedback, output format.
- **Bulk:** voice 51, subjects 29, scannability 21, hooks 22, curation 28, best-in-class 18, atomization by type 26, output format 80 plus file format 45. The 6 types and templates overlap heavily with `references/newsletter-examples.md`, which has the same 6 exemplars (Lenny, Morning Brew, Ben's Bites, Sahil Bloom, Greg Isenberg, The Hustle) plus The Rundown AI.
- **Pointers:** `references/newsletter-examples.md` (1239), the only reference file, is pointed to.

## 9. positioning-angles (767)
Outline: 6(8) · 14(33) Brand memory · 47(15) core job · 62 Process [64(14) Step1, 78(16) Step2, 94(62) Step2.5 web search, 156(19) Step3 mechanism, 175(23) Step4 sophistication, 198(72) Step5 angle generators] · 270 Output format [274(12),286(4),290(11),301(58) Angle Options,359(18) Files,377(21) Next] · 398(56) File output protocol · 454(60) 12-ad matrix seed (optional) · 514-649 Example (136) · 650(15) Invocation · 665(13) NOT · 678(16) Test · 694 Iteration/update [698(14),712(13) Refine,725(6) Fresh] · 731(29) Feedback · 760(8) References.
- **Branches:** First run vs update mode (Display/Refine/Fresh, 37 lines). Note that update mode comes after the main flow even though it is the entry decision. The ad matrix is optional (60). Web search is optional (62).
- **Spine:** Steps 1-5, output format, file output, test, feedback. Total ~400.
- **Bulk:** angle generators 72 (overlaps `angle-frameworks.md`, `hormozi-offer.md`), Step 4 (overlaps `schwartz-sophistication.md`), Step 3 (overlaps `unique-mechanism.md`), example 136. The output format section (128) restates parts of output-format.md.
- **Pointers:** the References section (760-767) names all 5 reference files by bare filename, with no load triggers.

## 10. seo-content (1732)
Outline: 6(18) · 24 BMI [28(11),39(8),47(32)] · 79 Iteration [83(64) Refresh, 147(6) Full] · 153(13) Core · 166(14)+180(24) Inputs/prefill · 204(8) Workflow · 212 Phase1 Research [230(71) SERP, 301(36) PAA, 337(13) Gap] · 350(54) Phase2 Brief · 404 Phase3 Outline [408(31) Pillar, 439(26) How-To, 465(30) Comparison, 495(27) Listicle] · 522 Phase4 Draft (~76) · 598 Phase5 Humanize [604(61) AI patterns, 665(24) before/after, 689(22), 711(13), 724(17) checklist, 741(6)] · 747 Phase6 Optimize (~96) · 843 Phase7 Schema [848(28) Article, 876(29) FAQ, 905(25) HowTo, 930(16)] · 946 Phase8 Quality Review (56, 4 checklists) · 1002 File Output (~79) · 1081 Terminal [1086(92)] · 1178 Refresh Mode Detailed (71) · 1249 Chain to atomizer (37) · 1286-1387 Example (102) · 1388(25) Connects · 1413(26) EEAT ref · 1439(88) Invocation Flow · 1527 Error States (78) · 1605(19) Test · 1624-1665 Feedback (42) · 1666(67) Impl Notes.
- **Branches:** Refresh (83-146 + 1178-1248, ~135) vs Full creation. Content type picks one of 4 outline structures (114). The HowTo schema (25) applies only to how-to content. Error states (78) are conditional.
- **Spine:** Phases 1-8 core, file output, chain, test, feedback.
- **Bulk:** Humanize phase 143 (AI-pattern lists overlap direct-response-copy "AI tells" at 557), schema templates 82, quality checklists 56 plus on-page checklist 15, terminal template 92, example 102. Invocation flow (88) and impl notes (67) repeat the phases.
- **Pointers:** `references/eeat-examples.md` (1415), the only reference file, is pointed to.

## 11. start-here (1753)
Outline: 7(19) · 26(26) Skill Registry · 52(36) Dependency Tree · 88 Mode Detection [93(7),100(17),117(18),135(7)] · 142 FIRST-RUN [147(33) Scan, 180(50) Questions, 230(49) Init+Build, 279(74) Report, 353(59) Step 6 Recs — no Step 5] · 412 RETURNING [418(36),454(20),474(35)] · 509 Decision Tree [514(65) Router, 579(18) Compound] · 597 Workflows [603(25) confirm, W1 20, W2 23, W3 33, W4 32, W5 41, W6 33, W7 35] · 845 Quick Routing (58) · 903 Invocation Protocol [907(44),951(7),958(10)] · 968 Context Paradox [974(22),996(5),1001(87) Matrix,1088(18),1106(23),1129(37) Handoff Block,1166(31)] · 1197 State Tracking [1202(41),1243(30)] · 1273 Handoff [1277(27),1304(24)] · 1328 Gap Detection [1332(32),1364(22)] · 1386 Output Formatting (42) · 1428 Operating Rules (118, 10 rules) · 1546 Campaign Mgmt (37) · 1583(31) MCP Detection · 1614(23) Feedback · 1637(32) Session Memory · 1669 Edge Cases (~50) · 1719(35) Init Checklist.
- **Branches:** First-run (270) vs Returning (97). Each run picks one of the 7 workflows (~217 + 25 confirm). Edge cases (~50) and campaign management (37) are conditional.
- **Spine:** registry, mode detection, router, invocation protocol, handoff block, state, operating rules (compressible).
- **Bulk:** context matrix 87, quick routing 58 (overlaps the decision tree 514), dependency tree 36, state format 41, gap detection 54, init checklist 35. Output Formatting (42) restates output-format.md templates (Project Scan, Numbered Options, Error).
- **Pointers:** _system only; no references/ folder.

---

## _system/brand-memory.md (472)
1(7) title · 8(14) Overview · 22(15) ./brand/ dir [37(4) ownership, 41(10) categories] · 51 READ [53(7) check dir, 60(18) load only needed, 78(8) missing, 86(11) visible, 97(9) stale] · 106 WRITE [108(16) profile, 124(10) append-only, 134(8) conventions] · 142(25) Campaign Dir [167(4) naming, 171(29) Brief Format, 200(9) cross-ref] · 209(24) Assets Registry [233(8)] · 241(23) Learnings [264(9)] · 273 Feedback [277(15) prompt, 292(23) processing] · 315(32) Stack [347(13) detection] · 360 Research Signal [364(9),373(30),403(9)] · 412 Voice Injection [416(18),434(9)] · 443(15) Schemas · 458(15) Principles.

## _system/output-format.md (927)
1(10) · 11(36) Design Principles · 47(43) Character Palette · 90 Required Structure [96(31) Header, 127(13) Content, 140(26) Files Saved, 166(33) What's Next, 199(17) Quick Mode, 216(29) Visual Checkpoint] · 245 Template Library [Project Scan 31, Numbered Options 37, Quick Pick 32, Campaign Completion 51, On/Off-Brand 25, Progress 26, Tool Detection 20, Single Asset 33, Content Preview 32, Data Table 28, Sequence Overview 43, Error 27] · 635 Formatting Rules (~51) · 686 Anti-Patterns (~109) · 795(38) Spacing Reference · 833(74) Complete Example: Brand Voice · 907(21) Skill Author Checklist.

### Restatement of _system rules in the 11 SKILL.md files (estimate ~1,000-1,100 lines)
- **"Brand Memory Integration" blocks** (reads/writes/context-loading display; they restate brand-memory.md §READ/§WRITE/Voice Injection): bv 37, ca 63, dr 36, es 67, kr 48, lm 59, nl 64, pa 33, seo 55. Total **≈462**. Creative and start-here have none. Each block has a skill-specific reads/writes list (~10-15 lines) that should stay in SKILL.md.
- **Feedback Collection/Recording** (restates brand-memory.md:273-314): bv 44, ca 28, dr 46, es 42, kr 40, lm 33, nl 24, pa 29, seo 42, sh 23. Total **≈351**.
- **Output-structure restatements** of the output-format.md 4-section/templates: dr 91, sh 42, pa ~60 of 128. Total **≈190**. The skill-specific terminal templates (bv 126, kr 164, seo 92, es 155, lm 97, nl 80) follow output-format but are skill-specific bulk, not restatements.
- **Campaign brief format** (restates brand-memory.md:171): es 46, lm 40 (**≈86**). Asset/learnings append instructions: nl 14, sh 10, plus scattered mentions.

---

## Summary table (estimates)

| skill | total | spine | branch-only | bulk ref | est. spine-only SKILL.md |
|---|---|---|---|---|---|
| brand-voice | 1492 | ~490 | ~320 (Update 60, Extract ~80, Build ~45, AutoScrape ~135) | ~680 (profile tmpl 226, terminal 126, 3 examples 273, platform 56) | ~400 after removing ~80 _system restatement |
| content-atomizer | 1696 | ~470 | ~1070 (8 platforms 842, calendar 142, scheduler 87) | ~160 (+playbooks dup platform-playbook.md) | ~380 |
| creative | 531 | ~190 | ~255 (setup 81, prompt-only 18, brand kit build 46, 5-direction 78, batch 48 — partly overlapping) | ~90 (model selection 38, dir tree 49) | ~190 |
| direct-response-copy | 1238 | ~350 | ~350 (variants 148, A/B 108, scoring 78, update 17) | ~540 (craft library ~494 dup COPYWRITING_PLAYBOOK, checklists 28) | ~220 after removing output fmt 91/feedback 46 |
| email-sequences | 1720 | ~505 | ~435 (welcome 270, conversion 23, launch 42, re-engage 22, ESP 36, update 25) | ~780 (examples 382, full tmpl 155, subjects 104, timing 61, checklists 56, file fmt 56) | ~380 |
| keyword-research | 1486 | ~915 | ~140 (refresh 64, web-only/error states ~76) | ~430 (terminal 164, example 118, brief tmpl 66, plan fmt 67, tools 15) | ~700 (further ~125 if invocation flow/impl notes are cut) |
| lead-magnet | 1126 | ~485 | ~345 (build mode ~314, update 23, no-web 9) | ~295 (format sel 52, hooks 34, concept tmpl 89, example 49, checklists ~49, brief 40) | ~400 |
| newsletter | 1562 | ~380 | ~890 (6 templates 377, platforms 149, growth 139, monetization 158, web sourcing 65) | ~295 (voice/subjects/hooks/scannability/curation ~150, output fmt 125, examples 18) | ~320 |
| positioning-angles | 767 | ~400 | ~160 (update 37, ad matrix 60, web search 62) | ~210 (example 136, generators 72 overlapping refs) | ~340 |
| seo-content | 1732 | ~890 | ~350 (refresh ~135, 4 outlines 114, HowTo 25, errors 78) | ~490 (humanize 143, schema 82, checklists 71, terminal 92, example 102) | ~650 (further ~155 if invocation flow/impl notes are cut) |
| start-here | 1753 | ~750 | ~700 (first-run 270, returning 97, 7 workflows ~242, edge cases ~50, campaigns 37) | ~300 (context matrix 87, quick routing 58, dep tree 36, state 41, gap 54, checklist 35) | ~550 |

The spine, branch-only and bulk columns are rough and do not sum exactly to the total, because some sections were partly assigned to more than one category.

## Architecture
Every SKILL.md says "read `_system/brand-memory.md` and `_system/output-format.md`" near the top, and then restates large parts of both. Skill-specific deep material is in `references/`. In creative, it is in `modes/`, which is the only skill already split by branch. Creative is the model to follow: a 531-line router plus mode files.

## Start Here
Open `creative/SKILL.md` first. It is the existing router-plus-modes pattern to copy, and the two broken mode pointers are at lines 426-427. After that, `content-atomizer` and `newsletter` give the biggest branch-only savings, and `direct-response-copy` has the most duplication with its reference file.

## Residual risks
- The line classifications are heading-level estimates, and some sections mix spine and bulk content.
- I compared duplication with the reference files by heading only. I did not diff the text.
- I did not check frontmatter descriptions or the separate `ARCHITECTURE.md`/`CLAUDE.md` conventions.
