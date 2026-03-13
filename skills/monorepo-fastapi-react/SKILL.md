---
name: monorepo-fastapi-react
description: Design, bootstrap, refactor, or document opinionated monorepos that use pnpm workspaces, a FastAPI REST API, and one or more React web apps. Use when Codex needs to define stack defaults, app boundaries, API/frontend ownership, AGENTS.md guidance, CRUD architecture, auth/authz flow, or initial project structure for authenticated dashboard-style products. This skill is for architectural conventions and project setup guidance, not for deep framework internals or large code boilerplates.
---

# Monorepo FastAPI React

Use this skill as the architecture and conventions layer for your default stack.

Assume these defaults unless the repo or user says otherwise:

- `pnpm` workspaces
- `apps/api` for FastAPI
- `apps/web-*` for React web apps
- FastAPI + SQLAlchemy + Alembic + psycopg
- React + Vite
- TanStack Router + TanStack Query
- `shadcn/ui` primitives
- Clerk for identity
- PostgreSQL
- Docker Compose for local/MVP environments

Do not include mobile technology in the default plan unless the user explicitly asks for it.

## Use This Skill To

Use this skill when the task is about:

- defining a new monorepo structure
- writing or rewriting `AGENTS.md`
- deciding boundaries between backend and frontend
- setting stack defaults for CRUD/dashboard products
- choosing where auth, authorization, validation, and lifecycle logic should live
- aligning project docs with your preferred architecture

Do not use this skill as the main source for:

- detailed FastAPI internals
- detailed `shadcn/ui` component usage
- advanced TanStack framework specifics
- generating large code boilerplates by default

## Follow This Workflow

When using this skill, work in this order:

1. Confirm the repo is a monorepo or should become one.
2. Lock the app layout and responsibilities.
3. Define backend ownership of business rules and persistence.
4. Define frontend ownership of UX, data fetching, and local interaction state.
5. Write or update `AGENTS.md` using the reference template.
6. Pull in `dashboard-ui-structure` when designing dashboard/backoffice UI.
7. Pull in framework-specific skills only when deeper detail is needed.

## Recommend This Monorepo Shape

Prefer this layout by default:

- `apps/api`
- `apps/web-admin` or `apps/web-merchant`
- additional `apps/web-*` apps only when they serve different actors or surfaces
- `pnpm-workspace.yaml`
- root `package.json`
- `docker-compose.yml`

Keep the monorepo simple:

- one API service by default
- one main authenticated web app by default
- add more apps only when actors or deployment concerns clearly diverge

Avoid:

- splitting backend services too early
- adding shared packages before there is real duplication
- inventing multi-app complexity with no product need

## Keep App Boundaries Clear

Treat each layer as having a distinct responsibility.

Backend owns:

- source of truth for data
- authorization rules
- lifecycle transitions
- persistence
- business validations
- payment and fulfillment state
- integration boundaries

Frontend owns:

- navigation
- page composition
- optimistic but reversible UX state
- forms and client-side affordances
- query orchestration
- presentation logic

Do not let the frontend become the source of truth for sensitive business rules.

## Use REST API Defaults

Prefer a straightforward REST API for CRUD-heavy products.

Apply these defaults:

- group endpoints by resource/domain
- keep write rules on the server
- return operational state needed by the UI
- treat API responses as product-facing contracts, not ORM leaks
- create explicit backend support for lifecycle-driven flows

Avoid:

- pushing authorization or lifecycle enforcement into the client
- coupling the frontend directly to persistence structure
- exposing implementation-only fields without product value

## Use Web Frontend Defaults

For authenticated web apps, prefer:

- React + Vite
- TanStack Router for routing
- TanStack Query for server state
- `shadcn/ui` primitives for common controls

Apply these defaults:

- route by product area, not by component accidents
- keep page/root files thin
- extract feature-specific screens, panels, tables, and forms
- use server state for backend-backed data and local state only for UI interaction
- keep dashboard/admin interfaces compatible with `$dashboard-ui-structure`

Do not:

- put domain ownership in route components
- recreate primitives that `shadcn/ui` already covers
- mix navigation and action semantics

## Use Auth And Authorization Defaults

Assume identity and authorization are separate concerns.

Apply these defaults:

- use Clerk for authentication and identity
- let the backend validate the token and derive the internal user
- keep authorization in backend data and rules
- model actor-to-resource access explicitly

Prefer backend-managed authorization tables or relationships over frontend-derived access rules.

## Write AGENTS.md With A Stable Structure

When drafting a new `AGENTS.md`, use the reference file:

- [agents-template.md](./references/agents-template.md)

Keep the document opinionated and specific to the product, but preserve this shape:

- product goal
- applications in the monorepo
- technical decisions
- non-negotiable rules
- auth and authorization model
- frontend structure rules
- backend/API ownership rules
- definition of done

Do not turn `AGENTS.md` into general-purpose documentation. Keep it as an execution contract for Codex and engineers.

## Combine This Skill With Others

Use this skill as the orchestrator, then add narrower skills only when needed.

Recommended combination:

- `$monorepo-fastapi-react` for architecture, repo shape, conventions, and `AGENTS.md`
- `$dashboard-ui-structure` for dashboard/backoffice UI structure and interaction quality
- FastAPI skill for deeper backend framework guidance when implementation needs it
- `shadcn/ui` skill for component-level UI guidance when implementation needs it

Do not assume TanStack-specific skills exist. If they are installed, treat them as optional framework helpers, not as the architectural source of truth.

## Apply These Decision Rules

When unsure, prefer:

- one API over many
- explicit ownership over shared ambiguity
- backend-enforced rules over client assumptions
- thin pages over mega-components
- CRUD clarity over generic abstraction
- project-specific `AGENTS.md` over vague reusable prose
- simple monorepo layout over speculative package extraction

## Reject These Anti-Patterns

Do not introduce:

- mobile as a default app in this stack
- backend logic hidden in frontend hooks or route files
- frontend-only authorization decisions
- deep service decomposition before product pressure requires it
- giant shared packages created before repeated use exists
- boilerplate sprawl presented as “architecture”
- framework-detail duplication that belongs in narrower skills

## Run This Final Check

Before considering the architecture or `AGENTS.md` complete, verify:

- Is the app layout obvious?
- Is there one API by default?
- Are backend and frontend responsibilities cleanly split?
- Is the API the source of truth for authz and lifecycle?
- Is mobile excluded unless explicitly requested?
- Does the frontend stack match the default conventions?
- Does the guidance pair naturally with `$dashboard-ui-structure` for dashboard UIs?
- Is `AGENTS.md` specific enough to guide future work without becoming a full spec?
