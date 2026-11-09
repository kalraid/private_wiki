#!/usr/bin/env bash
# 각 프로젝트의 TODO 체크박스 완료율과 마지막 커밋일을 측정한다.
# 사용법: scripts/measure.sh [작업 디렉터리]   (기본: 임시 디렉터리)
#   - public 저장소는 작업 디렉터리에 얕게 클론(이미 있으면 pull)해서 측정한다.
#   - private 저장소는 SOURCES(기본 /d/sources) 아래 로컬 클론을 fetch한 뒤 원격 추적 브랜치 기준으로 측정한다.
# TODO 문서마다 한 줄씩 출력한다. 구현 TODO와 설계 질의(GRILL)를 섞지 않기 위해서다.
set -euo pipefail

OWNER=kalraid
SOURCES=${SOURCES:-/d/sources}
PRIVATE_REPOS=(primacy-index erebos_academy_survival Lord-s-Daughter)
PUBLIC_REPOS=(game-vault rolling_vantage sound-to-visual-web mabi-look-matcher mafia-game-web dnfParty HoloThello)
WORK=${1:-$(mktemp -d)}
mkdir -p "$WORK"

row() { printf '%-24s %-11s %6s %6s %5s  %s\n' "$@"; }

measure() {
  local r=$1 dir=$2 last files f d o t
  last=$(git -C "$dir" log -1 --format=%ad --date=short)
  files=$(find "$dir" \( -name .git -o -name node_modules -o -name .claude -o -name _archive -o -name dist \) -prune -o \
          -type f -not -iname '*HISTORY*' \
          \( -iname 'TODO*.md' -o -iname '*_TODO.md' -o -iname 'GRILL.md' -o -iname 'GAP_REMEDIATION_PLAN.md' \) -print)
  if [ -z "$files" ]; then row "$r" "$last" - - - "(TODO 문서 없음)"; return; fi
  for f in $files; do
    d=$(grep -cE '\[[xX]\]|✅' "$f" || true)
    o=$(grep -cE '\[ \]|☐|⬜' "$f" || true)
    t=$((d + o))
    row "$r" "$last" "$d" "$t" "$([ "$t" -gt 0 ] && echo "$((d * 100 / t))%" || echo -)" "${f#"$dir"/}"
  done
}

row REPO LAST_COMMIT DONE TOTAL PCT TODO_FILE
for r in "${PRIVATE_REPOS[@]}"; do
  src="$SOURCES/$r"
  if [ ! -d "$src/.git" ]; then row "$r" - - - - "(로컬 클론 없음)"; continue; fi
  # 로컬 작업 폴더가 원격보다 뒤처질 수 있으므로, fetch 후 원격 추적 브랜치(@{u})를
  # 임시 클론에 꺼내 측정한다. 로컬 작업 폴더는 건드리지 않는다.
  git -C "$src" fetch -q || true
  upstream=$(git -C "$src" rev-parse --abbrev-ref '@{u}' 2>/dev/null || true)
  if [ -z "$upstream" ]; then measure "$r" "$src"; continue; fi
  dir="$WORK/_private/$r"
  rm -rf "$dir"
  git clone -q --no-checkout "$src" "$dir"
  git -C "$dir" fetch -q "$src" "refs/remotes/$upstream"
  git -C "$dir" checkout -q --detach FETCH_HEAD
  measure "$r" "$dir"
done
for r in "${PUBLIC_REPOS[@]}"; do
  dir="$WORK/$r"
  if [ -d "$dir/.git" ]; then
    git -C "$dir" pull -q --depth 1 || true
  else
    git clone -q --depth 1 --filter=blob:limit=300k "https://github.com/$OWNER/$r.git" "$dir"
  fi
  measure "$r" "$dir"
done
