# private_wiki — 프로젝트 진행도 대시보드

`kalraid`의 개인 프로젝트들이 얼마나 진행됐는지 재고 관리하는 대시보드입니다.

- 저장소별 상세 분석과 관계도: [repos/README.md](repos/README.md)
- 진행도 측정 스크립트: [scripts/measure.sh](scripts/measure.sh)

> 마지막 측정: **2026-11-09** (공개 저장소 기준)

## 진행 중 / 최근 프로젝트

| 프로젝트 | 상태 | 진행도 | 측정 근거 | 마지막 커밋 | 다음 할 일 |
|---|---|---|---|---|---|
| [game-vault](https://github.com/kalraid/game-vault) | 🟡 일시정지 | `██████████` 95% | TODO 20/21 | 2026-07-08 | 남은 TODO 1개, 첫 게임 모듈 연동 |
| [rolling_vantage](https://github.com/kalraid/rolling_vantage) | 🟡 설계 중 | `███░░░░░░░` 32% | GRILL_TODO 32/100 (설계 질의) | 2026-07-21 | 설계 질의 정리 → 구현 착수 |
| [sound-to-visual-web](https://github.com/kalraid/sound-to-visual-web) | 🟡 일시정지 | `█████████░` 92% | TODO 49/53 | 2026-06-25 | 남은 TODO 4개, Phase 1.5(곡 검색) |
| [mabi-look-matcher](https://github.com/kalraid/mabi-look-matcher) | 🟡 MVP 완료 | MVP ✅ / 후속 0% | 후속 백로그 0/23 | 2026-05-22 | mock → 실제 Gemini·CLIP 연결 |
| [mafia-game-web](https://github.com/kalraid/mafia-game-web) | ✅ 제출 완료 | `████████░░` 75% | GAP 보완 계획 12/16 | 2026-04-06 | 보완 계획 잔여 4개 (선택) |
| [dnfParty](https://github.com/kalraid/dnfParty) | 🟡 운영 후 중단 | `█████░░░░░` 47% | TODO 8/17 (하위 항목 포함) | 2025-09-12 | Advanced 파티 생성, 모바일 반응형 |
| [HoloThello](https://github.com/kalraid/HoloThello) | 🟡 마무리 단계 | `████████░░` 79% | TODO 178/223 (README 자체 표기 99%) | 2025-09-02 | Unity 에디터 UI 연결, 스프라이트 |

## 보관 (2022년 이전, 2년 넘게 비활성)

| 프로젝트 | 상태 | 마지막 커밋 | 비고 |
|---|---|---|---|
| [HoloLibraryAPI](https://github.com/kalraid/HoloLibraryAPI) | ⚫ 중단 | 2022-10-18 | DB 비동기 처리 작업 중 멈춤 |
| [HoloLibrary](https://github.com/kalraid/HoloLibrary) | ⚫ 중단 | 2022-02-25 | HoloLibraryAPI의 프론트엔드 |
| [chatserver](https://github.com/kalraid/chatserver) | ⚫ 중단 | 2021-09-14 | ETF 사이트용 채팅 서버 |
| [VRChatAINpc](https://github.com/kalraid/VRChatAINpc) | ⚫ 중단 | 2021-02-05 | AI NPC + ETF 사이트(DnD) |
| [Team_Project](https://github.com/kalraid/Team_Project) | ⚫ 완료 | 2024-07-24 (README) | 학원 팀 프로젝트 |

## 측정 기준

- **진행도** = `scripts/measure.sh` 결과. 각 저장소의 TODO 문서에서 완료한 체크박스 수 ÷ 전체 체크박스 수(`[x]`/`[ ]`, `✅`/`☐`).
  - TODO 문서가 없거나 목적이 다르면 근거 칸에 적어 둡니다(예: mabi-look-matcher의 TODO는 MVP 이후 백로그라서 MVP와 따로 표기).
  - TODO가 계속 추가되는 저장소는 진행도가 내려갈 수 있습니다. 같은 기준으로 다시 재서 추세를 봅니다.
- **상태**
  - 🟢 활성: 30일 안에 커밋 있음
  - 🟡 일시정지: 1년 안에 커밋 있음
  - ⚫ 중단/보관: 1년 넘게 커밋 없음
  - ✅ 완료: 목표(제출·배포)를 달성함
- private 저장소는 아직 측정 대상에 넣지 않았습니다.

## 측정 이력

| 날짜 | 변경 |
|---|---|
| 2026-11-09 | 대시보드 첫 작성 (공개 저장소 13개 분석) |
