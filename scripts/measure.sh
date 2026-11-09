#!/usr/bin/env bash
# 각 프로젝트의 TODO 체크박스 완료율과 마지막 커밋일을 측정한다.
# 사용법: scripts/measure.sh [작업 디렉터리]   (기본: 임시 디렉터리)
set -euo pipefail

OWNER=kalraid
REPOS=(game-vault rolling_vantage sound-to-visual-web mabi-look-matcher mafia-game-web dnfParty HoloThello)
WORK=${1:-$(mktemp -d)}
mkdir -p "$WORK"

printf '%-22s %-12s %8s %8s %6s  %s\n' REPO LAST_COMMIT DONE TOTAL PCT TODO_FILES
for r in "${REPOS[@]}"; do
  dir="$WORK/$r"
  if [ -d "$dir/.git" ]; then
    git -C "$dir" pull -q --depth 1 || true
  else
    git clone -q --depth 1 --filter=blob:limit=300k "https://github.com/$OWNER/$r.git" "$dir"
  fi
  last=$(git -C "$dir" log -1 --format=%ad --date=short)
  files=$(find "$dir" -path '*/.git' -prune -o -path '*/node_modules' -prune -o -type f \
          \( -iname 'TODO*.md' -o -iname '*_TODO.md' -o -iname 'GAP_REMEDIATION_PLAN.md' \) -print)
  done_n=0; total_n=0
  for f in $files; do
    d=$(grep -cE '\[[xX]\]|✅' "$f" || true)
    o=$(grep -cE '\[ \]|☐|⬜' "$f" || true)
    done_n=$((done_n + d)); total_n=$((total_n + d + o))
  done
  pct=$([ "$total_n" -gt 0 ] && echo $((done_n * 100 / total_n)) || echo "-")
  printf '%-22s %-12s %8s %8s %5s%%  %s\n' "$r" "$last" "$done_n" "$total_n" "$pct" \
    "$(echo "$files" | sed "s|$dir/||" | tr '\n' ' ')"
done
