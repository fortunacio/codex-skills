#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILLS_ROOT="$REPO_ROOT/skills"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
INSTALL_ROOT="$CODEX_HOME/skills"
SYSTEM_MARKER="$INSTALL_ROOT/.system/.codex-system-skills.marker"

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

note() {
  printf '%s\n' "$*"
}

collect_skill_names() {
  if [ "$#" -gt 0 ]; then
    printf '%s\n' "$@"
    return
  fi

  if [ ! -d "$SKILLS_ROOT" ]; then
    return
  fi

  find "$SKILLS_ROOT" -mindepth 1 -maxdepth 1 -type d ! -name '.*' -exec basename {} \; | LC_ALL=C sort
}

ensure_frontmatter() {
  awk '
    NR == 1 {
      if ($0 != "---") {
        exit 1
      }
      next
    }
    $0 == "---" {
      found = 1
      exit 0
    }
    END {
      if (!found) {
        exit 1
      }
    }
  ' "$1"
}

frontmatter_field() {
  skill_md="$1"
  field_name="$2"

  awk -v key="$field_name" '
    NR == 1 {
      if ($0 != "---") {
        exit 2
      }
      next
    }
    $0 == "---" {
      exit found ? 0 : 1
    }
    index($0, key ":") == 1 && !found {
      value = substr($0, length(key) + 2)
      sub(/^[[:space:]]+/, "", value)
      print value
      found = 1
    }
    END {
      if (!found) {
        exit 1
      }
    }
  ' "$skill_md"
}

strip_matching_quotes() {
  value="$1"

  case "$value" in
    \"*\")
      value="${value#\"}"
      value="${value%\"}"
      ;;
    \'*\')
      value="${value#\'}"
      value="${value%\'}"
      ;;
  esac

  printf '%s' "$value"
}

resolve_dir() {
  (
    cd "$1" 2>/dev/null
    pwd -P
  )
}
