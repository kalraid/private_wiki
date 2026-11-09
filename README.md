# private_wiki — 프로젝트 진행도 대시보드

`kalraid`의 개인 프로젝트들이 얼마나 진행됐는지 재고 관리하는 대시보드입니다.

- 저장소별 상세 분석과 관계도: [repos/README.md](repos/README.md)
- 진행도 측정 스크립트: [scripts/measure.sh](scripts/measure.sh)

> 마지막 측정: **2026-11-09** (공개 저장소 + 로컬에 있는 private 저장소 3개)

## 한눈에 보기

| 🎮 게임용 | 📚 학습용 | 💼 업무용 | 합계 |
|:---:|:---:|:---:|:---:|
| **9개** · 커밋 1,854 | **6개** · 커밋 682 | **7개** (포크) | **22개** · 커밋 2,536 |
| 진행 중 9 · 보관 0 | 진행 중 1 · 보관 5 | 참고용 | 진행 중 10 |

- 🎮 **게임용**: Lord-s-Daughter🔒 1547 · erebos_academy_survival🔒 103 · mafia-game-web 94 · dnfParty 53 · HoloThello 16 · game-vault 16 · rolling_vantage 14 · mabi-look-matcher 6 · primacy-index🔒 5
  (직접 만드는 게임 7개 + 게임 보조 도구 2개 — dnfParty, mabi-look-matcher)
- 📚 **학습용**: VRChatAINpc 201 · HoloLibrary 174 · Team_Project 151 · HoloLibraryAPI 80 · sound-to-visual-web 39 · chatserver 37
- 💼 **업무용**: netapp-api-exporter · signoz-otel-collector · pinpoint-helm-chart · tibero-docker · skb-libvirtd · spring-boot-vuejs · msdocs-nodejs-mongodb-azure-sample-app (모두 포크, 직접 커밋 없음)
- 커밋 수는 저장소 전체 커밋 수입니다(AI 에이전트 커밋 포함). 프로필(kalraid)과 이 위키는 집계에서 뺐습니다.

## 진행 중 / 최근 프로젝트

| 프로젝트 | 상태 | 진행도 | 측정 근거 | 마지막 커밋 | 다음 할 일 |
|---|---|---|---|---|---|
| [primacy-index](https://github.com/kalraid/primacy-index) 🔒 | 🟡 착수 | Sprint 0-1 ✅ | 커밋 5 · ADR 25 (TODO 문서 없음) | 2026-08-12 | Sprint 0 2단계 (경제 엔진 확장) |
| [erebos_academy_survival](https://github.com/kalraid/erebos_academy_survival) 🔒 | 🟡 POC 완료 | POC `██████████` 98% / 설계 14% | TODO 71/72 · GRILL 29/204 | 2026-08-10 | 설계 질의(GRILL) 정리 → 본 구현 |
| [Lord-s-Daughter](https://github.com/kalraid/Lord-s-Daughter) 🔒 | 🟡 웹 전환 중 | 웹 `█████████░` 93% | 웹 역할 TODO 56/60 · Z_DOC 37/43 · 도트 0/120 · 사운드 1/13 | 2026-07-09 | web_logic 잔여 3개, 도트 그래픽·사운드 착수 |
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
- 🔒 표시는 private 저장소입니다. GitHub API로 볼 수 없어서 `D:\sources`의 로컬 클론(현재 체크아웃 브랜치)으로 측정합니다.
- 한 저장소에 TODO 문서가 여러 개면 목적별로 따로 표기합니다(구현 TODO와 설계 질의 GRILL 구분).

## 측정 이력

| 날짜 | 변경 |
|---|---|
| 2026-11-09 | 대시보드 첫 작성 (공개 저장소 13개 분석) |
| 2026-11-09 | private 저장소 3개 추가 (Lord-s-Daughter, erebos_academy_survival, primacy-index) |
