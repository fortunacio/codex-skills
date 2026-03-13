# Codex Skills

Repositorio Git dedicado para mantener skills custom de Codex.

## Estructura

```text
.
├── skills/
│   └── <skill-name>/
│       ├── SKILL.md
│       ├── agents/openai.yaml
│       ├── references/        # opcional
│       ├── scripts/           # opcional
│       └── assets/            # opcional
└── scripts/
    ├── publish-skills.sh
    └── validate-skills.sh
```

`skills/` es la fuente de verdad. `~/.codex/skills` queda sólo como instalación global.

## Uso

Validar estructura local:

```bash
./scripts/validate-skills.sh
```

Validar además la instalación global:

```bash
./scripts/validate-skills.sh --installed
```

Publicar todas las skills del repo a `~/.codex/skills`:

```bash
./scripts/publish-skills.sh --force
```

Publicar una skill puntual:

```bash
./scripts/publish-skills.sh dashboard-ui-structure --force
```

Después de agregar una skill nueva, renombrar una existente o cambiar metadata, conviene reiniciar Codex.

## Flujo recomendado

```bash
./scripts/validate-skills.sh
./scripts/publish-skills.sh dashboard-ui-structure --force
git status
git add .
git commit -m "..."
git push
```
