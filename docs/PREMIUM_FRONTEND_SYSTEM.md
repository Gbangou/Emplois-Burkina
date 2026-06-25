# Emplois Burkina Premium Frontend System

## Design Direction

Emplois Burkina should feel like a serious hiring operating system, not a small directory.

- Visual tone: premium SaaS, trustworthy public service, mobile-first job board.
- Core accents: green for trust, blue/cyan for data, red for urgent action, gold for priority, violet for automation.
- Layout: dense but calm dashboards, highly readable cards, large search-first hero.
- Motion: subtle hover, focus and transition states only; no distracting decoration.

## Current Implementation

- Next.js App Router for pages and server rendering.
- Shared domain package for scoring and product logic.
- CSS design tokens in `globals.css`.
- Accessible focus states for buttons, links, inputs and selects.
- Premium cards, dashboards, hero, job explorer, operations and automation panels.

## Next Upgrade Path

1. Add Tailwind CSS with the current tokens mapped to `tailwind.config`.
2. Add Radix UI primitives or shadcn/ui for dialogs, menus, tabs, select and toast.
3. Add Framer Motion for page transitions and micro-interactions where useful.
4. Add Playwright visual checks for desktop and mobile.
5. Add Storybook or a local component gallery for design QA.

## Non-Negotiables

- Mobile first: all primary workflows must work comfortably on small screens.
- No hidden trust: source, confidence, deadline and moderation state must stay visible.
- No decorative noise: every visual element should support comprehension or action.
- No client import of server-only modules.
- Every new interactive element needs hover, focus, disabled and mobile states.
