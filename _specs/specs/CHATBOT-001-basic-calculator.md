---
id: CHATBOT-001
title: "Basic browser calculator"
status: draft
branch: chatbot-001-basic-calculator
created: 2026-06-24
updated: 2026-06-24
---

# CHATBOT-001 - Basic browser calculator

## Intent

Learn the SDD workflow by shipping a minimal calculator app: issue → spec → implementation → PR → review.

## Scope

**In scope:**
- `calculator/index.html`, `calculator/style.css`, `calculator/app.js`
- Buttons 0–9, decimal, +, −, ×, ÷, equals, clear
- Chained operations (e.g. `3 + 4 × 2` evaluated left-to-right)
- Divide-by-zero handling

**Out of scope:**
- Scientific functions, keyboard input, mobile polish, build tools, backend

**Do not touch:**
- SDD workflow files (`_specs/`, `.cursor/skills/`)

## Task Breakdown

- [ ] Task 1 — HTML layout: display + button grid
- [ ] Task 2 — CSS: readable dark-theme calculator UI
- [ ] Task 3 — JS: input handling, evaluate, clear, divide-by-zero
- [ ] Task 4 — README section: how to open the calculator locally

## Acceptance Criteria

- [ ] AC1 — User can enter numbers and operators via on-screen buttons
- [ ] AC2 — Equals shows the correct result for chained expressions (left-to-right)
- [ ] AC3 — Divide by zero shows `Error`, not a crash or `Infinity` on screen
- [ ] AC4 — Clear resets display and internal state

## AC ↔ Task Coverage

| Acceptance Criterion | Covered By Task(s) |
|---|---|
| AC1 | Task 1, Task 3 |
| AC2 | Task 3 |
| AC3 | Task 3 |
| AC4 | Task 3 |

## Open Questions

- [ ] None

## Implementation Notes

- Linked issue: https://github.com/DanComanescu/Chatbot/issues/1
- E2E assessment: open `calculator/index.html` in browser and click through AC1–AC4
- Tests: manual browser check (no test framework in repo yet)
