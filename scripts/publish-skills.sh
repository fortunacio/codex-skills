#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=./common.sh
. "$SCRIPT_DIR/common.sh"

force_publish=0
selected_skills=()

while [ "$#" -gt 0 ]; do
  case "$1" in
    --force)
      force_publish=1
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

"$SCRIPT_DIR/validate-skills.sh" "${selected_skills[@]}"

skills=()
if [ "${#selected_skills[@]}" -gt 0 ]; then
  skills=("${selected_skills[@]}")
else
  while IFS= read -r skill; do
    [ -n "$skill" ] && skills+=("$skill")
  done < <(collect_skill_names)
fi

[ "${#skills[@]}" -gt 0 ] || die "No skills selected for publish"

mkdir -p "$INSTALL_ROOT"

for skill in "${skills[@]}"; do
  case "$skill" in
    .* )
      die "Invalid skill name for publish: $skill"
      ;;
  esac

  src="$SKILLS_ROOT/$skill"
  dest="$INSTALL_ROOT/$skill"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "$force_publish" -ne 1 ]; then
      die "Destination already exists: $dest. Re-run with --force to replace the published copy."
    fi

    rm -rf "$dest"
  fi

  cp -R "$src" "$dest"
  note "Published $skill -> $dest"
done

note "Restart Codex if you changed skill metadata or added a new skill."
