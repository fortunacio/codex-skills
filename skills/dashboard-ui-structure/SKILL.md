---
name: dashboard-ui-structure
description: Design, implement, refactor, or review dashboard, admin, CRUD, settings, and other authenticated application UIs that need strong hierarchy, stable shell structure, clear operational flows, and disciplined form completion patterns. Use when Codex is working on backoffice or multi-section product interfaces and needs to prevent common layout, navigation, container, density, or form-action mistakes. Do not use as the main guide for marketing landing pages or highly branded consumer storefronts unless the user explicitly wants a dashboard-like structure.
---

# Dashboard UI Structure

Design authenticated product interfaces to feel:

- clear
- structured
- calm
- intentional
- easy to scan

Avoid interfaces that feel:

- noisy
- over-boxed
- over-decorated
- visually confusing
- internally inconsistent

## Follow This Workflow

When using this skill, work in this order:

1. Classify the screen intent.
2. Choose the simplest shell that fits.
3. Establish page hierarchy before styling details.
4. Separate navigation from actions.
5. Add containers only when they create meaning.
6. Make view/create/edit mode explicit.
7. Validate form completion, responsiveness, and anti-patterns.

## Classify The Screen Intent

Classify each screen as one primary type before designing or reviewing it:

- dashboard / overview
- list / index
- detail
- create / edit form
- settings / configuration
- mixed operational workspace

If a screen tries to do too many of these at once, simplify the composition or split the flow.

## Choose A Stable Shell

Use a stable shell for multi-section authenticated apps.

Prefer this default shell when the application has persistent navigation:

- sidebar
- header
- content area

Apply these rules:

- Anchor the sidebar to the application edge.
- Keep the header compact and stable.
- Treat sidebar and header as frame elements, not floating cards.
- Avoid decorative outer wrappers around the entire app.
- Use the sidebar only when the application has enough sections to justify persistent navigation.

Avoid:

- floating sidebars
- floating headers
- giant framed app wrappers
- oversized empty shell areas

## Establish Clear Page Hierarchy

Make every page answer these questions immediately:

- where the user is
- what the page is for
- what the main action is
- what the main working area is

Prefer this page structure:

- page title
- short supporting description
- primary action
- main content

Apply these rules:

- Show the page title once.
- Keep supporting text short and useful.
- Keep page-level explanation in the body, not in the global shell.
- Make the main working area visually dominant over framing elements.

Avoid:

- duplicated page titles
- long hero headers inside the app shell
- giant subtitles that compete with the work area

## Separate Navigation From Actions

Keep navigation and actions visually distinct.

Apply these rules:

- Treat navigation as context switching.
- Treat actions as work execution.
- Make tabs, sidebar items, breadcrumbs, and links look different from buttons.
- Limit each view to one obvious primary action when possible.

Avoid:

- navigation pills styled like CTAs
- multiple competing primary actions
- row actions placed far from the entity they affect

## Use Containers Sparingly

Use cards as grouping tools, not as the default answer.

Apply these rules:

- Prefer spacing, alignment, sections, and dividers before adding cards.
- Use cards only when they create meaningful grouping.
- Avoid wrapping the whole page in a giant card.
- Avoid nested cards unless strictly necessary.

Avoid:

- cards inside cards inside cards
- decorative wrappers with no semantic purpose
- "page inside a page" composition

## Match Density To The Task

Use space intentionally.

Apply these rules:

- Use whitespace to clarify hierarchy, not to create emptiness.
- Keep operational pages tighter and more scannable.
- Allow settings pages to be calmer and more vertical.
- Avoid oversized padding that shrinks the real working area.
- Keep controls close to the item they affect.

Avoid:

- huge empty content areas
- giant gaps between related controls
- stretched forms with weak information density

## Choose Width Deliberately

Choose layout width based on task shape.

Apply these rules:

- Keep forms and settings readable with sensible width limits.
- Allow dense tables and operational lists to use broader space.
- Prevent layouts from drifting into large empty margins on wide screens.
- Keep important controls aligned with the content they govern.

## Keep Metrics Supportive

Use KPI blocks as support content, not as permanent visual dominance.

Apply these rules:

- Keep summary metrics compact.
- Use metrics to orient the user, not to bury the actual work.
- Let the operational area remain the page's main focus when work happens below the fold.

Avoid dashboards that become a wall of summary cards with no clear working area.

## Structure Forms For Completion

Group forms by meaning and make them easy to finish.

Apply these rules:

- Group related fields by meaning, not arbitrary boxes.
- Place related fields on the same row when space allows.
- Use clear labels and helper text only when needed.
- Make numeric fields easy to edit without typing friction.
- Keep small controls lightweight instead of boxing each one.

Avoid:

- every field in its own card
- padding-only form sections
- ambiguous labels
- switches with no context

## Repeat Primary Form Actions At The End

In create and edit flows, show the primary action where the task starts and where the task naturally ends.

Apply these rules:

- Repeat the primary action at the bottom of full-page create and edit forms by default.
- Keep the bottom action consistent with the page-level action in verb and intent.
- Let users complete the form from the final section without scrolling back to the header.
- Make this especially explicit for long, multi-section, validated, or confirmation-heavy forms.
- Keep secondary actions near the bottom action without overpowering it.
- Use one clear completion zone at the end of the form.

Treat these as good default labels:

- `Create` / `Create <entity>`
- `Save`
- `Update`

Use equivalent variants only when they remain clearly aligned with the page-level action.

Do not require duplication in compact dialogs or modals when the footer already provides the natural completion action.

Avoid:

- relying only on a header CTA to submit a long form
- leaving the user at the end of the form with no visible completion action
- showing `Create` at the top and an ambiguous `Save` at the bottom when they appear to be different actions
- repeating every secondary action instead of only the main completion action

## Make CRUD Modes Explicit

Keep list, create, edit, and detail states easy to distinguish.

Apply these rules:

- Separate list mode, create mode, and edit mode when the editor needs room.
- Make post-save state predictable.
- Prefer a clean summary view for settings pages and enter edit mode explicitly.
- Keep the user aware of whether they are viewing, creating, or editing.

Avoid:

- cramped split views where list and editor compete
- permanently editable settings pages by default
- ambiguous post-save states

## Design Empty States Intentionally

Keep the interface understandable even with no data.

Apply these rules:

- Explain what is missing.
- Point to the next meaningful action.
- Preserve the normal page hierarchy.
- Avoid giant decorative blank states that exist only to fill space.

## Clarify Ambiguity Early

Explain controls that may be unclear.

Apply these rules:

- Add helper text when context is required.
- Add tooltips for compact controls or icons.
- Prefer explicitness over guesswork for unfamiliar concepts.

Pay special attention to:

- ordering fields
- extra cost fields
- availability vs visibility vs active state
- destructive actions
- reordering controls

## Preserve Responsive Hierarchy

Adapt the layout without breaking the shell or page relationships.

Apply these rules:

- Keep sidebar, header, and content relationships understandable across widths.
- Keep controls anchored and aligned.
- Allow dense tables to scroll horizontally when needed, but keep them readable.
- Prevent large unexplained gaps on wide monitors.

## Reject Common Anti-Patterns

Do not introduce:

- nested cards everywhere
- floating sidebars
- floating headers
- duplicated page titles
- action/navigation confusion
- giant decorative wrappers
- ambiguous toggles
- unclear numeric inputs
- controls separated from the entity they affect
- forms that can only be completed from the top of the page
- dashboards where KPIs overpower the actual work

## Apply The Decision Rule

When choosing between:

- more wrappers
- more decoration
- more spacing
- more components

and:

- clearer structure
- fewer layers
- stronger hierarchy
- simpler interaction

choose the simpler structure.

## Run This Review Checklist

Before finalizing a dashboard-style UI, verify:

- Is the screen type clear?
- Is the shell stable and integrated?
- Does the page title appear only once?
- Is the main action obvious?
- Are navigation and actions visually distinct?
- Are there unnecessary cards or wrappers?
- Is the main working area larger than the decorative framing?
- Is the user clearly in view, create, or edit mode?
- Can the user complete a create/edit form from the end of the flow?
- Does the bottom form action match the page-level primary action?
- Do row actions stay close to the affected entity?
- Does the screen remain understandable when empty?
- Does the layout remain stable on wide and narrow screens?
