# AGENTS.md Template

Use this as a lightweight editorial template when creating a new repo-level `AGENTS.md` for the `monorepo-fastapi-react` stack.

Adapt the domain terms, actor names, and business rules to the project. Keep the document opinionated and executable. Avoid turning it into generic product documentation.

## Suggested Structure

### 1. Product Goal

State:

- what the product is
- who the main actors are
- what the MVP or current phase includes
- what is explicitly out of scope

### 2. Applications

Describe the monorepo surfaces, usually:

- `apps/api`
- one main `apps/web-*` authenticated app
- additional apps only if they serve clearly distinct actors

For each app, define:

- target user
- main responsibilities
- core technologies

### 3. Non-Negotiable Rules

List hard constraints that should not drift between implementations.

Examples:

- language/copy rules
- fixed infrastructure decisions
- scope boundaries
- forbidden product expansions
- backend ownership rules

### 4. Technical Decisions

Lock the closed decisions so future work does not reopen them by accident.

Include only decisions that should be treated as defaults unless explicitly changed, such as:

- monorepo shape
- package manager
- API framework
- database
- auth provider
- deployment style
- UI toolkit

### 5. Auth And Authorization Model

Separate identity from authorization.

Document:

- identity provider
- token validation responsibility
- internal user mapping
- authorization source of truth
- actor/resource relationships

Prefer explicit backend-managed authorization structures.

### 6. Frontend Structure Rules

Describe how the authenticated web app should be built.

Include:

- thin route/page components
- feature-folder preference
- server-state vs UI-state split
- UI primitive choices
- design rules

If the project is a dashboard/backoffice, explicitly reference `$dashboard-ui-structure`.

### 7. Backend API Rules

Define backend responsibilities and guardrails.

Include:

- API as source of truth
- resource boundaries
- lifecycle ownership
- persistence ownership
- validation and authorization ownership
- integration boundaries

### 8. Modeling Clarifications

Capture domain model decisions that are easy to get wrong repeatedly.

Use this section for:

- enum/state vocabulary
- required explicit fields
- separation of snapshot vs current state
- historical/audit tables vs operational fields

### 9. Definition Of Done

Define what “working” means in concrete terms.

Prefer:

- a local startup command
- a short actor-based workflow
- a few end-to-end completion checks

## Writing Rules

When drafting `AGENTS.md`:

- write concrete instructions, not aspirations
- prefer closed decisions over open-ended guidance
- avoid repeating framework docs
- keep product-facing constraints explicit
- keep internal technical language in English unless the project requires otherwise
- keep the document short enough to stay useful during implementation

## Default Monorepo Assumptions

Unless the project says otherwise, assume:

- `pnpm-workspace.yaml` at the root
- `apps/api` for FastAPI
- `apps/web-*` for React web apps
- PostgreSQL as primary database
- Docker Compose for local orchestration
- no mobile app by default
