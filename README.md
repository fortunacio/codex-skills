# Codex Skills

Repository for maintaining custom Codex skills using native discovery.

## Quick Install

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
git clone https://github.com/fortunacio/codex-skills.git "${HOME}/.codex/codex-skills"
ln -s "${HOME}/.codex/codex-skills/skills" "${CODEX_HOME:-$HOME/.codex}/skills/woolleg"
```

## Manual Installation

### Requirements

- Codex
- Git

### Steps

1. Clone the repo:

   ```bash
   git clone https://github.com/fortunacio/codex-skills.git "${HOME}/.codex/codex-skills"
   ```

2. Create the symlink:

   ```bash
   mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
   ln -s "${HOME}/.codex/codex-skills/skills" "${CODEX_HOME:-$HOME/.codex}/skills/woolleg"
   ```

3. Restart Codex.

If the destination already exists, replace it before recreating the link.

Replace an existing install:

```bash
rm -f "${CODEX_HOME:-$HOME/.codex}/skills/woolleg"
ln -s "${HOME}/.codex/codex-skills/skills" "${CODEX_HOME:-$HOME/.codex}/skills/woolleg"
```

### Windows

Use a junction:

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.codex\skills"
git clone https://github.com/fortunacio/codex-skills.git "$env:USERPROFILE\.codex\codex-skills"
cmd /c mklink /J "$env:USERPROFILE\.codex\skills\woolleg" "$env:USERPROFILE\.codex\codex-skills\skills"
```

## How It Works

Codex discovers skills at startup by reading `SKILL.md` files inside `${CODEX_HOME:-~/.codex}/skills`.

This repo exposes all its skills through a single link:

```text
~/.codex/skills/woolleg -> ~/.codex/codex-skills/skills
```

`skills/` remains the source of truth. The directory inside `~/.codex/skills` is only the discovery entry point.

## Structure

```text
.
├── README.md
└── skills/
    └── <skill-name>/
        ├── SKILL.md
        ├── agents/openai.yaml
        ├── references/        # optional
        ├── scripts/           # optional
        └── assets/            # optional
```

## Usage

Skills activate automatically when:

- you mention a skill by name
- the task matches the frontmatter description

After adding a new skill, renaming an existing one, or changing metadata, restart Codex to force a new discovery pass.

## Updating

```bash
cd "${HOME}/.codex/codex-skills"
git pull
```

Changes become available through the same symlink.

## Uninstalling

```bash
rm -f "${CODEX_HOME:-$HOME/.codex}/skills/woolleg"
```

Delete the repo clone as well:

```bash
rm -rf "${HOME}/.codex/codex-skills"
```

## Troubleshooting

### Skills are not showing up

1. Verify the link: `ls -la ~/.codex/skills/woolleg`
2. Verify that skills exist inside the repo: `find ~/.codex/codex-skills/skills -mindepth 1 -maxdepth 1 -type d`
3. Restart Codex
