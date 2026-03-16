# Codex Skills

Repository for maintaining custom Codex skills using native discovery.

## Quick Install

```bash
git clone https://github.com/fortunacio/codex-skills.git ~/.codex/codex-skills
mkdir -p ~/.agents/skills
ln -s ~/.codex/codex-skills/skills ~/.agents/skills/codex-skills
```

## Manual Installation

### Requirements

- OpenAI Codex CLI
- Git

### Steps

1. Clone the repo:

   ```bash
   git clone https://github.com/fortunacio/codex-skills.git ~/.codex/codex-skills
   ```

2. Create the skills symlink:

   ```bash
   mkdir -p ~/.agents/skills
   ln -s ~/.codex/codex-skills/skills ~/.agents/skills/codex-skills
   ```

3. Restart Codex.

### Windows

Use a junction:

```powershell
git clone https://github.com/fortunacio/codex-skills.git "$env:USERPROFILE\.codex\codex-skills"
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.agents\skills"
cmd /c mklink /J "$env:USERPROFILE\.agents\skills\codex-skills" "$env:USERPROFILE\.codex\codex-skills\skills"
```

## How It Works

Codex has native skill discovery. It scans `~/.agents/skills/` at startup, parses `SKILL.md` frontmatter, and loads matching skills on demand.

This repo exposes all its skills through a single link:

```text
~/.agents/skills/codex-skills/ -> ~/.codex/codex-skills/skills/
```

`skills/` remains the source of truth. The directory inside `~/.agents/skills` is only the discovery entry point.

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

After adding a new skill, renaming an existing one, or changing metadata, restart Codex.

## Updating

```bash
cd ~/.codex/codex-skills
git pull
```

Changes become available through the same symlink.

## Uninstalling

```bash
rm ~/.agents/skills/codex-skills
```

Delete the repo clone as well:

```bash
rm -rf ~/.codex/codex-skills
```

## Troubleshooting

### Skills are not showing up

1. Verify the symlink: `ls -la ~/.agents/skills/codex-skills`
2. Check skills exist: `ls ~/.codex/codex-skills/skills`
3. Restart Codex

## Getting Help

- Main repository: https://github.com/fortunacio/codex-skills
