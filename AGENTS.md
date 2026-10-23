# AGENTS.md — Master AI Instructions & Project Configuration

> [!NOTE]
> This repository uses the **Universal AI Operating System**. Any AI assistant (Antigravity, Cursor, Claude Code, Windsurf, Kiro) MUST read this file upon startup.

---

## 1. Project Overview & Tech Stack (Configure for your project)
- **Project Name:** [Your Project Name Here]
- **Language & Runtime:** [e.g., Go 1.23 / Java 21 / TypeScript / Python 3.12]
- **Framework:** [e.g., Gin / Spring Boot 3 / Next.js / FastAPI]
- **Database / Infrastructure:** [e.g., PostgreSQL 16, Redis, Docker Compose]
- **Primary Architecture:** [e.g., Clean Architecture, Hexagonal, Modular Monolith]

---

## 2. Core Execution Protocol (Mandatory for all AI)
1. **Always Check State First:** Read [`STATE.md`](STATE.md) to discover what was completed last and what the immediate next step is.
2. **Obey the 4 Golden Rules:** Follow [`.ai/rules/behavior.md`](.ai/rules/behavior.md):
   - *Think Before Coding:* Surface assumptions and tradeoffs explicitly.
   - *Simplicity First:* Minimum code that solves the problem. Nothing speculative.
   - *Surgical Changes:* Touch only what you must.
   - *Goal-Driven Verification:* Never claim completion without automated tests passing.
3. **Use Slash Commands:** When working on tasks, trigger the standardized workflows:
   - `/feature`: For adding new capabilities.
   - `/refactor`: For safe code improvements without breaking behavior.
   - `/review`: For code quality, security, and test coverage audit.
   - `/knowledge-review`: For extracting lessons learned after solving complex bugs.
4. **Handover Duty:** Always update [`STATE.md`](STATE.md) before concluding your turn or when handing over to another tool.
