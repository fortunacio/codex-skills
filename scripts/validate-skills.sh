#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./common.sh
. "$SCRIPT_DIR/common.sh"

check_installed=0
selected_skills=()

while [ "$#" -gt 0 ]; do
  case "$1" in
    --installed)
      check_installed=1
      ;;
    -*)
      die "Unknown option: $1"
      ;;
    *)
      selected_skills+=("$1")
      ;;
  esac
  shift
done

[ -d "$SKILLS_ROOT" ] || die "Skills directory not found: $SKILLS_ROOT"

skills=()
if [ "${#selected_skills[@]}" -gt 0 ]; then
  skills=("${selected_skills[@]}")
else
  while IFS= read -r skill; do
    [ -n "$skill" ] && skills+=("$skill")
  done < <(collect_skill_names)
fi

[ "${#skills[@]}" -gt 0 ] || die "No skills found in $SKILLS_ROOT"

if [ "$check_installed" -eq 1 ] && [ ! -f "$SYSTEM_MARKER" ]; then
  die "Codex system marker not found: $SYSTEM_MARKER"
fi

for skill in "${skills[@]}"; do
  skill_dir="$SKILLS_ROOT/$skill"
  skill_md="$skill_dir/SKILL.md"
  skill_yaml="$skill_dir/agents/openai.yaml"

  [ -d "$skill_dir" ] || die "Skill not found in repo: $skill"
  [ -f "$skill_md" ] || die "Missing SKILL.md for $skill"
  [ -f "$skill_yaml" ] || die "Missing agents/openai.yaml for $skill"

  ensure_frontmatter "$skill_md" || die "Invalid frontmatter in $skill_md"

  name_value="$(frontmatter_field "$skill_md" name)" || die "Missing frontmatter name in $skill_md"
  description_value="$(frontmatter_field "$skill_md" description)" || die "Missing frontmatter description in $skill_md"

  name_value="$(strip_matching_quotes "$name_value")"
  description_value="$(strip_matching_quotes "$description_value")"

  [ -n "$name_value" ] || die "Frontmatter name is empty in $skill_md"
  [ -n "$description_value" ] || die "Frontmatter description is empty in $skill_md"
  [ "$name_value" = "$skill" ] || die "Folder name '$skill' does not match frontmatter name '$name_value'"

  if [ "$check_installed" -eq 1 ]; then
    installed_dir="$INSTALL_ROOT/$skill"

    if [ ! -e "$installed_dir" ] && [ ! -L "$installed_dir" ]; then
      die "Installed skill not found: $installed_dir"
    fi

    if [ -L "$installed_dir" ]; then
      die "Installed skill must be a real directory, not a symlink: $installed_dir"
    fi

    [ -d "$installed_dir" ] || die "Installed path is not a directory: $installed_dir"
    [ -f "$installed_dir/SKILL.md" ] || die "Installed skill is missing SKILL.md: $installed_dir"
    [ -f "$installed_dir/agents/openai.yaml" ] || die "Installed skill is missing agents/openai.yaml: $installed_dir"
  fi

  note "Validated $skill"
done

if [ "$check_installed" -eq 1 ]; then
  note "Installed published skills look good in $INSTALL_ROOT"
fi
