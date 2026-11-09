# kalraid GitHub 저장소 분석

> 작성일: 2026-11-09 · 대상: `github.com/kalraid`의 **공개 저장소 21개**(직접 만든 저장소 13개 + 포크 8개) + `D:\sources`에 로컬 클론이 있는 **private 저장소 3개**(🔒)
> 로컬에 없는 다른 private 저장소(예: `erebos_chronicles_worldbook`, `erebos_chronicles_npcs`)는 다른 저장소 문서에 적힌 내용으로만 짐작했습니다.

---

## 1. 한눈에 보기

| 시기 | 저장소 | 한 줄 요약 | 주요 스택 | 커밋 |
|---|---|---|---|---|
| 2018 | [Team_Project](#team_project) | 학원 시절 팀 프로젝트 모음 (의약품/건강 정보 사이트) | Java, Spring MVC, JSP | 151 |
| 2020 | [VRChatAINpc](#vrchatainpc) | VRChat을 AI가 플레이하게 만드는 MSA 실험 | Spring Boot, Flask/Django, RabbitMQ | 78 |
| 2020 | [dnd-project](#dnd-project) | 던전앤파이터 파티·시세 도구 + 갤러리 커뮤니티 (VRChatAINpc에서 분리) | Spring Boot 2.3, Vue 2, Vuetify, MySQL | 120 |
| 2021 | [etfholdings](#etfholdings) | ETF 정보 사이트용 IEX Cloud API 연동 뼈대 (dnd-project에서 분리) | Spring Boot | 2 |
| 2021 | [chatserver](#chatserver) | socket.io 채팅 서버 (etfholdings.co.kr용) | Node.js, Express, socket.io | 37 |
| 2021 | [kalraid](#kalraid) | GitHub 프로필 README | Markdown | 2 |
| 2021 | [HoloLibrary](#hololibrary--hololibraryapi) | 홀로라이브 트위터/유튜브 라이브러리 **프론트엔드** (포크 기반) | Vue 2, Vuetify | 174 |
| 2021 | [HoloLibraryAPI](#hololibrary--hololibraryapi) | 위 서비스의 **백엔드** + 트위터 크롤링 배치 | Python, Falcon, PostgreSQL | 80 |
| 2025 | [HoloThello](#holothello) | 오셀로 + 격투 HP 대전 캐주얼 게임 | Unity (C#) | 16 |
| 2025 | [dnfParty](#dnfparty) | 던전앤파이터 레이드 파티 관리·최적화 서비스 | Spring Boot 3, Vue 3, MariaDB, Helm/K8s | 53 |
| 2026 | [mafia-game-web](#mafia-game-web) | AI 플레이어와 하는 웹 마피아 게임 (AI 부트캠프 최종 과제) | FastAPI, LangGraph, Claude API, Streamlit, Redis, ChromaDB | 94 |
| 2026 | [mabi-look-matcher](#mabi-look-matcher) | 참고 사진을 넣으면 마비노기 의상 후보를 찾아 입혀 보는 서비스 | FastAPI, Next.js, Gemini/CLIP | 7 |
| 2026 | [sound-to-visual-web](#sound-to-visual-web) | MIDI/MusicXML을 3D 지형+큐브로 시각화 | FastAPI, music21, Three.js, Tone.js | 39 |
| 2026 | [game-vault](#game-vault) | 브라우저 게임용 포털 (인증·세이브·실시간 SDK) | Vite+React, Express, Prisma, SQLite | 16 |
| 2026 | [rolling_vantage](#rolling_vantage) | 그리드 소환 전술 + 주사위 판정을 섞은 웹 게임 (설계 단계) | TypeScript (설계 문서 위주) | 14 |
| 2026 | [Lord-s-Daughter](#lord-s-daughter-) 🔒 | 육성+전략+영지경영 시뮬 (프린세스 메이커 계열), Godot에서 웹으로 전환 | Godot 4 → React + PixiJS 8 | 1586 |
| 2026 | [erebos_academy_survival](#erebos_academy_survival-) 🔒 | Erebos Chronicles 세계관의 턴제 육성 + 탄막 게임 | Godot 4.6 (GDScript), GUT | 103 |
| 2026 | [primacy-index](#primacy-index-) 🔒 | 논문 기반 경제모형으로 한국 지역경제를 시뮬레이션하는 Steam 게임 | Godot + C# 엔진 | 91 |
| 2026 | private_wiki | 이 위키 | Markdown | – |

---

## 2. 관계도

```mermaid
flowchart LR
  subgraph S1["① 학원·입문기 (2018)"]
    TP[Team_Project]
  end

  subgraph S2["② 사이드 프로젝트기 (2020~2022)"]
    VR[VRChatAINpc]
    DND[dnd-project<br/>던파·갤러리]
    ETF[etfholdings<br/>ETF 정보]
    CS[chatserver]
    HL[HoloLibrary<br/>front]
    HLA[HoloLibraryAPI<br/>back]
    INS([fork 원본: in-soft-vue])
  end

  subgraph S3["③ 실무 인프라 학습 (2023~2024, 포크)"]
    F1([netapp-api-exporter / signoz-otel-collector<br/>pinpoint-helm-chart / tibero-docker / skb-libvirtd])
    F2([spring-boot-vuejs / msdocs-nodejs-mongodb-azure])
  end

  subgraph S4["④ 게임·AI 프로젝트기 (2025~2026)"]
    HT[HoloThello]
    DNF[dnfParty]
    MAF[mafia-game-web]
    MABI[mabi-look-matcher]
    STV[sound-to-visual-web]
    GV[game-vault]
    RV[rolling_vantage]
    LD[Lord-s-Daughter 🔒<br/>Godot → Web]
    ER[erebos_academy_survival 🔒]
    EW([erebos_chronicles<br/>worldbook / npcs 🔒])
    PI[primacy-index 🔒]
  end

  EW -- "세계관·NPC 원본 (integrate.md 요청 채널)" --> ER
  LD -. "육성 시뮬 장르 · Godot 경험" .-> ER
  LD -. "Godot 경험 · ADR 문서 방식" .-> PI

  VR -- "2026-11 이력 유지 분리" --> DND
  DND -. "던파 도구의 후속" .-> DNF
  DND -- "2026-11 ETF 코드 분리" --> ETF
  DND -. "마비노기 초안 → legacy/" .-> MABI
  ETF -. "같은 사이트(etfholdings.co.kr)" .-> CS
  INS -- "관리자 템플릿 포크" --> HL
  HL -- "REST API 호출" --> HLA
  HL -. "홀로라이브 테마" .-> HT
  F1 -. "Helm/K8s 배포 경험" .-> DNF
  F2 -. "Spring+Vue 구조" .-> DNF
  GV -- "SDK 계약 사본(gamevault-handoff)" --> RV
  LD -- "ADR-0034: Godot → Web 전환" --> GV
  DNF -. "온라인 게임 팬 툴" .-> MABI
```

### 관계를 정리하면

1. **같은 서비스를 이루는 저장소**
   - `HoloLibrary`(Vue 프론트) ↔ `HoloLibraryAPI`(Python 백엔드): 하나의 "홀로라이브 트위터/유튜브 라이브러리" 서비스를 프론트와 백엔드로 나눈 것입니다. 프론트는 회사 사내 템플릿 `kimyearho/in-soft-vue`를 포크해서 시작했습니다.
   - `VRChatAINpc` → `dnd-project`: 원래 VRChatAINpc 저장소 안에서 `DnDPartes`(백엔드)·`dnd-project`(프론트)로 함께 개발하던 서비스입니다. 2026-11-09에 커밋 이력을 유지한 채 별도 저장소로 분리했습니다.
   - `dnd-project` → `dnfParty`: 2020년의 던파 파티·시세 도구(Neople API)를 2025년에 Spring Boot 3 + Vue 3로 새로 만든 것이 dnfParty입니다.
2. **플랫폼과 그 위에 올라갈 게임**
   - `game-vault`는 게임 로직 없이 인증·세이브·계정 데이터·실시간 이벤트만 `postMessage` SDK로 제공하는 **포털**입니다.
   - `rolling_vantage/gamevault-handoff/`에는 game-vault의 `GAME_MODULE.md`·`shared/` SDK 타입·`sample-game`이 그대로 복사돼 있습니다. **rolling_vantage는 game-vault에 붙일 첫 외부 게임 모듈 후보**입니다.
   - game-vault의 `0034-godot-to-web-pivot.md`(원본은 Lord-s-Daughter의 ADR-0034)를 보면, *Lord's Daughter*를 Godot에서 웹으로 옮기면서 세이브·계정을 맡을 서버가 필요해졌고, 그 결과물이 game-vault입니다. 포털의 기본 등록 게임 ID도 `lords-daughter`입니다. **game-vault는 Lord-s-Daughter와 rolling_vantage가 함께 쓸 공용 플랫폼**입니다.
   - `erebos_academy_survival`은 세계관(`erebos_chronicles_worldbook`)과 NPC(`erebos_chronicles_npcs`) 저장소를 원본으로 참조합니다. 요청이 생기면 각 저장소의 `as/system/integrate.md`에 "Open Requests"로 남기는, 저장소 사이의 요청 채널을 운영합니다.
3. **주제가 이어지는 저장소**
   - 서브컬처/홀로라이브: `HoloLibrary(API)` → `HoloThello`(홀로라이브풍 캐릭터 오셀로).
   - 넥슨 온라인 게임 팬 툴: `dnfParty`(던파) → `mabi-look-matcher`(마비노기).
   - AI 활용: `VRChatAINpc`(2020, 직접 짠 NLP/MSA 구상) → `mafia-game-web`(2026, LLM 에이전트 + RAG).
   - 육성 시뮬레이션: `Lord-s-Daughter`(프린세스 메이커 계열) → `erebos_academy_survival`(학원 육성 + 탄막).
   - 경제·시뮬레이션: `etfholdings`(IEX Cloud API), `chatserver`의 etfholdings.co.kr → `primacy-index`(지역경제 시뮬레이션 게임).
   - 넥슨 게임 도구: `dnd-project`(2020, 던파) → `dnfParty`(2025) → `mabi-look-matcher`(2026). 2020년 마비노기 도구 초안은 `mabi-look-matcher/legacy/`에 있습니다.
4. **포크 저장소는 업무와 학습용 참고 자료**: 모니터링(NetApp exporter, SigNoz OTel, Pinpoint Helm), DB/가상화(Tibero Docker, libvirtd), 아키텍처 예제(Spring Boot+Vue, Azure Node+Mongo). 2025년 dnfParty의 Helm 차트 기반 K8s 배포에 이 경험이 쓰인 것으로 보입니다.

---

## 3. 저장소별 상세

### Team_Project
- **기간**: 2018-08 ~ (README 갱신 2024-07)
- **설명**: "최초 프로그래밍 학습을 위해 학원에 다니면서 했던 프로젝트".
  - `medicine_inc/`: Spring MVC + MyBatis + JSP(Eclipse/Maven). 질병·음식·건강지원 게시판, 카카오/네이버 소셜 로그인. 팀원별 패키지(`chanho`, `aehee`, `Changmyoung` …)로 역할을 나눴습니다. 본인 담당은 `chanho` 패키지(음식·질병 DAO/Service)입니다.
  - `PlayGroundProject/`: 서블릿/JSP 기반 웹 프로젝트(`WebContent`).
- **의미**: 개발 커리어의 출발점입니다.

### VRChatAINpc
- **기간**: 2020-03 ~ 2021-01 (분리 후 커밋 78개)
- **목표**: AI가 VRChat에 접속해 대화(한/영/일/중 번역, 문장 분석, 화제 제시)하고 행동(이동·손짓·표정)까지 하게 만들기.
- **설계**: 신체 기관을 본뜬 마이크로서비스 구조입니다.
  - `VRChatAINpcMain`(Spring Boot 메인/관제), `Body`, `Camera`, `Heart`, `Keyboard`, `Mic`, `Speaker` 모듈
  - Java(Spring Boot) ↔ RabbitMQ ↔ Python(Flask/Django) 언어·청각 서버, 서버마다 MariaDB
- **상태**: VRChat 모듈은 2020-08 이후 거의 손대지 않았습니다. 같은 저장소에서 실제로 더 많이 진행된 DnD 웹 서비스는 2026-11-09에 [dnd-project](#dnd-project)로 분리했습니다. 분리하면서 이력의 평문 비밀값과 `__pycache__`를 정리해 저장소 크기가 233MB에서 12MB로 줄었습니다.

### dnd-project
- **기간**: 2020-08 ~ 2021-02 (커밋 120개, VRChatAINpc에서 분리)
- **설명**: "DnD Projects". 던전앤파이터(DnF) 도구로 시작해 기능을 계속 붙인 개인 웹 서비스입니다.
  - `party`: Neople Open API(경매장·아바타 마켓·캐릭터), 셀레니움 공식 사이트 크롤링(`dndOffApi`), 캐릭터 검색, 파티 구성, TensorFlow 캐릭터 스펙 분석 실험
  - `gallery`: 게시판·댓글·그룹·채팅·포인트·회원, Tess4J OCR
- **스택**: `backend/` Spring Boot 2.3 + Java 11 + JPA/MyBatis + MySQL + JWT, `frontend/` Vue 2 + Vuetify 2 + Vuex, GCP App Engine 배포.
- **분리**: 함께 들어 있던 ETF 정보 기능(`fund`)은 [etfholdings](#etfholdings)로, 마비노기 도구(`mabinogi`)는 [mabi-look-matcher](#mabi-look-matcher)의 `legacy/mabinogi-tools-2020/`으로 2026-11-10에 옮기고, 이 저장소 이력에서 지웠습니다.
- **관계**: 2025년 [dnfParty](#dnfparty)의 전신입니다.

### etfholdings
- **기간**: 2021-02 (커밋 2개, dnd-project에서 분리)
- **설명**: ETF·펀드 정보 사이트(etfholdings.co.kr)를 만들려고 IEX Cloud API(미국 주식·ETF 시세)를 연동하던 백엔드 뼈대입니다. 엔드포인트 목록과 빈 controller·service만 있고 실제 호출은 구현 전입니다.
- **관계**: [chatserver](#chatserver)가 이 사이트용 채팅 서버입니다. 사이트 본체(프론트엔드 등) 소스는 찾지 못했습니다.

### chatserver
- **기간**: 2021-03 ~ 2021-09
- **설명**: "학원 프로젝트 - chatting server (websocket 학습용)". Express + socket.io 단일 `app.js`. 사용자 목록과 메시지 기록을 메모리에 두는 단순 채팅 서버입니다.
- **배포 메모**(`server.md`): GCP Compute/App Engine 방화벽 설정, Oracle Cloud VM, pm2 사용법.
- **관계**: 허용 Origin이 `etfholdings.co.kr`입니다. [etfholdings](#etfholdings)(2021-02)에서 시작한 ETF 사이트에 붙이려던 채팅 서버로 봅니다.

### kalraid
- GitHub 프로필용 특수 저장소입니다. 기본 템플릿 상태이고 블로그 제작 참고 링크가 하나 있습니다.

### HoloLibrary / HoloLibraryAPI
- **기간**: 2021-06 ~ 2022-10
- **서비스 목표**: 홀로라이브 버튜버의 유튜브·트위터 활동을 "라이브러리"로 모으고, 팬아트 트윗 크롤링·태그 통계·키리누키(클립) 기능을 제공합니다.
- **HoloLibrary (프론트, 포크)**: 원본은 `kimyearho/in-soft-vue`(Insoft 사내 Vue 관리자 템플릿 v0.2)입니다. Vue 2 + Vuetify에 `api/tweet.js`, `twitter.js`, `statistics.js`, `member.js` 등 서비스 API 모듈을 추가했습니다.
- **HoloLibraryAPI (백엔드)**: Python Falcon REST API + PostgreSQL. 기반은 `ziwon/falcon-rest-api` 보일러플레이트입니다.
  - `api/v1`: auth, member, menu, statistics(image/youtube), twitter, kirinuki, board
  - `batch/`: 스레드 기반 트위터 크롤러(일반/태그/커스텀 태그)
  - 마지막 커밋: "DB 비동기 처리 작업 진행중", 이후 중단됨
- **관계**: 프론트와 백엔드로 짝을 이루는 한 서비스입니다.

### HoloThello
- **기간**: 2025-07 ~ 2025-09 · Unity 2022.3 (C#)
- **설명**: 오셀로로 상대 HP(10000)를 깎는 "홀로 격투 오셀로". 캐릭터 20종(홀로라이브풍 10, 고양이 10), 스킬 3종, 1P vs CPU / 1P vs 2P / CPU vs CPU 모드, 주사위로 선공 결정.
- **상태**: 문서상 진행률 99%. 남은 일은 Unity 에디터에서 UI를 연결하는 작업입니다. `Docs/`에 프리팹별 설계 문서가 정리돼 있습니다.

### dnfParty
- **기간**: 2025-08 ~ 2025-09
- **설명**: 던전앤파이터(DFO) 모험단의 레이드 파티 관리 서비스입니다.
  - Neople 공식 API + Playwright로 던담 스탯 크롤링
  - 던전별(나벨·베누스·안개신·황혼전) 주간 클리어 현황, 매주 목요일 자동 초기화
  - 8인 파티 자동 구성·최적화·공유, SSE 실시간 동기화
- **스택**: Spring Boot 3.2 / Java 17 / JPA / MariaDB + Vue 3 / Vite 7.
- **배포**: Docker + Helm 차트(앱/인프라 분리) + Nginx Ingress(HTTPS), PowerShell 배포 스크립트. 개인 프로젝트 중 운영 수준에 가장 가깝습니다.

### mafia-game-web
- **기간**: 2026-03 ~ 2026-04 (커밋 94개)
- **설명**: **AI Bootcamp 최종 과제**입니다. 최대 20인 웹 마피아 게임이며, 빈자리는 LLM 에이전트가 채웁니다.
- **스택**: FastAPI + LangGraph/LangChain, Claude API 또는 Azure OpenAI(환경변수로 전환, 키가 없으면 랜덤 Fallback), ChromaDB RAG로 전략 학습, Redis + LangGraph Checkpointer로 세션 관리, WebSocket 푸시, Streamlit 프론트, docker-compose.
- **특징**: `CLAUDE.md`에 서브에이전트 모델 배정 규칙(haiku/sonnet/opus)을 적어 두는 등 AI 코딩 에이전트를 본격적으로 쓰기 시작한 프로젝트입니다.

### mabi-look-matcher
- **기간**: 2026-05
- **설명**: 참고 사진을 올리면 마비노기 장비 슬롯별로 비슷한 아이템 후보 10개 정도를 보여 주고, 기존 캐릭터 시뮬레이터(Sigkill) 위에 입혀서 2D/3D로 미리 볼 수 있게 합니다.
- **스택**: Python 3.11 패키지(`packages/look_matcher`: analysis, vision, catalog_store, candidate_builder, embedding_rank) + FastAPI + Next.js. Gemini Vision / CLIP / Redis를 쓰지만, mock 모드에서는 셋 다 없이 동작합니다.
- **문서화**: `CONTEXT.md`(도메인 용어집) + ADR 13개 + PRD + 이슈 백로그.
- **legacy**: `legacy/mabinogi-tools-2020/`에 2020년 dnd-project에서 옮겨 온 마비노기 캐릭터·인벤토리·수련 관리 도구 초안(Spring Boot JPA 엔티티)이 있습니다. 본 기능과는 별개입니다.

### sound-to-visual-web
- **기간**: 2026-06
- **설명**: MIDI/MusicXML을 분석해 **캐논 / 화성 / 기타**로 분류합니다. 화면 위쪽에는 다성부 악보를 띄우고, 아래쪽에서는 성부별 음높이를 3D 지형(리본)으로 그려 큐브가 미끄러지며 진행합니다. NHK 「명곡앨범+」의 파헬벨 캐논 시각화에서 영감을 받았습니다.
- **스택**: FastAPI + music21 / Vite + Three.js + OpenSheetMusicDisplay + Tone.js.
- **문서화**: ADR 16개(가장 많음), `CONTEXT.md`에 음악 도메인 용어(성부·섬·공유 지형 등) 정리.

### game-vault
- **기간**: 2026-07
- **설명**: 외부에서 만든 브라우저 게임을 iframe/새 창으로 띄우고 `postMessage` SDK(`auth.getToken`, `save.load/store`, `account.get/set`, `realtime.subscribe/emit`)를 중개하는 포털입니다. 게임 로직은 갖지 않습니다.
- **스택**: Vite + React, Express, Auth.js, Prisma + SQLite, Docker, Playwright e2e, Vitest.
- **결정 기록**: ADR-0001(포털 범위와 SDK 계약), ADR-0002(게스트 세션, 로그인하면 정식 계정으로 승격), ADR-0034(Godot → Web 전환, *Lord's Daughter* 저장소에서 넘겨받은 문서).

### rolling_vantage
- **기간**: 2026-07
- **설명**: *Vantage Master V2*의 그리드 소환사 전술과 *Dice of Afterimage*의 주사위 판정을 **하나의 전투 레이어로 합친** 웹 게임 설계입니다. 플레이어 + CPU 경쟁자 7 + 야생 세력이 영토를 두고 경쟁하는 로그라이트 구조(Run / Meta GP / Master 로스터 12~16명)이고, 챕터마다 시나리오 테마 규칙 변형 9종이 있습니다.
- **상태**: 아직 코드보다 `CONTEXT.md` + ADR 3개 + `GRILL_TODO.md` 같은 설계 문서가 중심입니다.
- **관계**: `gamevault-handoff/`에 game-vault SDK 계약이 복사돼 있으므로 **game-vault 위에서 돌아갈 게임 모듈**로 계획된 것입니다.

### Lord-s-Daughter 🔒
- **기간**: 2026-04-21 ~ 2026-07-21 (커밋 1586개로 압도적 1위, 7월 이후만 121개)
- **설명**: 2D 육성 시뮬레이션 기반 RPG + 전략 시뮬 복합 게임입니다. 10~18세(8년) 동안 육성 시뮬, 비주얼 노벨, RPG 탐험·전투, 영지경영·전략 레이어가 순서대로 펼쳐집니다. 모티브는 프린세스 메이커 4, Victoria 3, 삼국지 13, 문명 6입니다.
- **계기**: 기다리던 *프린세스 메이커: 예언의 아이들*이 사실상 무산되자 "내가 직접 만들겠다"며 시작했습니다.
- **기술 변화**: Godot 4(GDScript 125개, 씬 74개)로 시작했다가 2026-07-06 ADR-0034로 **웹(React 18 + PixiJS 8 + Vite)으로 전환**했습니다. 작업 브랜치는 `pivot/web-migration`, 코드는 `web/src/`입니다.
- **개발 방식**: `ROLES/`에 역할(orchestrator, web_common, web_frontend, web_logic, qa, sound, visual_gen, content_event)을 정의하고, Claude·Codex·Cursor·Gemini 같은 여러 AI 에이전트가 역할별로 작업하는 **멀티 에이전트 개발 체계**입니다(`AGENTS.md`, `CLAUDE.md`, `CODEX.md`, `CURSOR.md`, `GEMINI.md`). 커밋 접두어 `WC-`/`WF-`/`WL-`로 역할을 구분합니다.
- **진행도**: 웹 역할 TODO 79/85, Z_DOC/TODO 39/48, 도트 TODO_DOT 32/120, 사운드 1/13, 설계 질의 TODO_GRILL 10/16.

### erebos_academy_survival 🔒
- **기간**: 2026-07-27 ~ 2026-08 (커밋 103개)
- **설명**: Erebos Chronicles 세계관을 배경으로 한 **턴제 캐릭터 육성 + 탄막** 게임입니다. 이벤트 파트 → 노드(스킬 트리) 배분 → 전투(탄막) 파트를 돌고, 직업 카드 같은 영구 자산을 남기는 회귀 루프 구조입니다.
- **스택**: Godot 4.6, GDScript, GUT 유닛 테스트, Windows/Android(갤럭시 터치 테스트) 익스포트. 이벤트·카드·노드 데이터는 JSON 원본을 Godot Resource로 변환하는 파이프라인을 씁니다.
- **문서**: `CONTEXT-MAP.md`, ADR 7개, `GRILL.md`(설계 질의 204개), `scenario/`, `system/`.
- **관계**: 세계관과 NPC는 별도 private 저장소(`erebos_chronicles_worldbook`, `erebos_chronicles_npcs`)가 원본입니다. 이 저장소는 게임 시스템과 실제 소스만 맡습니다.
- **진행도**: POC TODO 71/72 완료, 설계 GRILL 29/204.

### primacy-index 🔒
- **기간**: 2026-08-12 ~ 2026-08-16 (커밋 91개, 닷새 만에 Sprint 0 완료)
- **설명**: 17개 광역·226개 기초자치단체 전부의 노동자·기업·산업·주택·재정을 **논문 기반 경제모형**(Hopenhayn 진입·퇴출, 신경제지리학 집적 티핑, 신용제약형 주택시장 등)으로 계산하는 지역경제 시뮬레이션 게임입니다. 반도체·AI/SW·자동차 3개 특화산업은 앵커도시에서 전체 방정식으로 계산하고, 나머지 지역은 범용 1/2/3차 산업 모델을 씁니다. Steam(PC)에 먼저 출시할 계획입니다.
- **이름 변천**: GRAVITY: Korea → GRAVITAS → PRIMACY INDEX (상표 충돌 위험 때문, ADR-0015/0016).
- **스택**: Godot + C# 코어 엔진(ADR-0009), 결정론과 레이어 경계 강제(ADR-0025).
- **문서**: ADR 40개(전 저장소 중 최다), 경제모형 명세, UI 초안, 이론 참고 목록, Godot 청사진(`docs/godot-blueprint/`), DLC 백로그.
- **진행도**: Sprint 0 승인기준 17/17 완료(헤드리스 Godot 실행, 결정성·벤치마크 검증). 이후 UI 셸과 페르소나(게이머 알파테스트) 리뷰 수정, ADR-0040 이론 재검증 백로그 6/9 구현.

---

## 4. 포크 저장소 (참고/업무용)

| 저장소 | 원본 | 용도 추정 |
|---|---|---|
| HoloLibrary | kimyearho/in-soft-vue | HoloLibrary 프론트의 베이스 (위 참고) |
| netapp-api-exporter | sapcc/netapp-api-exporter | NetApp ONTAP Prometheus 익스포터 (스토리지 모니터링) |
| signoz-otel-collector | SigNoz/signoz-otel-collector | OpenTelemetry 기반 APM/관측성 |
| pinpoint-helm-chart | dyingtime/pinpoint-kubernetes | Pinpoint APM을 K8s에 Helm으로 배포 |
| tibero-docker | h-wookie/tibero-docker | Tibero 6 DB 컨테이너화 |
| skb-libvirtd | skbroadband/skb-libvirtd | libvirt 가상화 데몬 |
| spring-boot-vuejs | jonashackt/spring-boot-vuejs | Spring Boot + Vue 통합 예제 |
| msdocs-nodejs-mongodb-azure-sample-app | Azure-Samples/… | Azure App Service + Cosmos DB 예제 |

2023~2024년 포크는 대부분 **모니터링/APM, K8s, 국산 DB, 가상화**입니다. 이 시기에 Cloud PC 모니터링·SRE 업무(개발서버 CI/CD, Tempo helm chart, OTEL 수집)를 했습니다 — [경력 요약](../career/README.md) 참고.

---

## 5. 흐름과 패턴

1. **입문 (2018)**: 학원 팀 프로젝트로 Java/Spring MVC/JSP를 익혔습니다.
2. **사이드 프로젝트 (2020~2022)**: MSA·메시지큐(VRChatAINpc), 게임 API·커뮤니티 웹 서비스(dnd-project), 실시간 통신(chatserver), 크롤링+통계 서비스(HoloLibrary)처럼 의욕적인 구조를 시도했습니다. 다만 대부분 완성 전에 중단됐습니다.
3. **인프라 공백기 (2023~2024)**: 개인 프로젝트 대신 업무 관련 포크(모니터링, K8s)가 늘었습니다.
4. **AI 코딩 에이전트 시대 (2025~2026)**: 프로젝트 수와 완성도가 함께 올랐습니다.
   - 2025년: 게임(HoloThello)과 게임 팬 툴(dnfParty)을 실제 배포 수준까지 만들었습니다.
   - 2026년: **`CONTEXT.md`(도메인 용어집) + `docs/adr/`(결정 기록) + TODO** 형식이 mabi-look-matcher, sound-to-visual-web, game-vault, rolling_vantage에서 똑같이 반복됩니다. 설계를 문서로 먼저 굳힌 뒤 구현하는 방식이 자리 잡았습니다.
   - 기술 스택도 Java/Spring 중심에서 **Python(FastAPI) + TypeScript(Vite/React/Next/Three.js)** 중심으로 옮겨 갔습니다.
   - 2026년 중반부터는 **본격적인 게임 개발**(Lord-s-Daughter 커밋 1500개 이상, Godot 게임 3개)이 중심이 됐습니다. Lord-s-Daughter에서는 여러 AI 에이전트가 역할을 나눠 맡는 방식까지 실험했습니다.
5. **반복되는 관심사**: 게임(직접 만들기 + 기존 게임 보조 툴), 서브컬처(홀로라이브), AI(NPC → LLM 에이전트), 시각화(통계 차트 → 3D 음악 시각화).
