# 경력 요약 — 박찬호 (kalraid)

> 개인 프로젝트 진행도는 [대시보드](../README.md), 저장소 분석은 [repos](../repos/README.md)에 있습니다.

## 한 줄 소개

**클라우드 플랫폼 백엔드 엔지니어** — 프라이빗 클라우드·VDI(Cloud PC) 분야에서 8년간 백엔드를 개발했고,
Java/Spring 마이크로서비스 개발부터 Kubernetes 배포·운영(CKA)까지 직접 맡고 있습니다.

| 축 | 내용 |
|---|---|
| ☁️ 클라우드 백엔드 | Spring Boot·Batch 마이크로서비스, OpenStack·VMware vRA 연동, 대용량 쿼리 최적화 |
| 📈 관측성 | OpenTelemetry Collector 수집 파이프라인 전담, Grafana Tempo·Prometheus·ClickHouse, 대시보드 API |
| 🔐 인증 · 제로트러스트 | AD/LDAP·OTP → Okta·SSO → Keycloak SPI·패스키, OPA·RBAC, mTLS·SPA 단말 인증 설계 |
| 🤖 AI 개발 플랫폼 | 사내 LLM Gateway(로컬 LLM·소스 마스킹·코드 RAG·MCP 서버) 설계·개발, AI Harness 메인테이너 |

기반 역량: Kubernetes(CKA)·helm·CI/CD(Jenkins·Nexus·Harbor) — 개발한 것을 직접 배포·운영합니다.

## 경력

**아이엔소프트 · 클라우드솔루션사업부 · 책임** (2018.11 ~ 현재, 8년)

| 기간 | 프로젝트 | 역할 | 핵심 |
|---|---|---|---|
| 2026.09 ~ 현재 | 통신사 Cloud PC 제로트러스트(ZT) 연동 | 설계·개발, 고객 시연 | Keycloak SPI(관리자/사용자 경로 분기, 패스키), 단말 등록·승인 흐름, 단말 인증서 수명 주기 검증, OPA 기반 차단 시나리오 시연 |
| 2026.06 ~ 현재 | 통신사 Cloud PC 커스터마이징 | 개발·백엔드 설계 | 상용 SSO 모듈 연동(토큰 → JWT), 대리 신청·VM 연장·자원 알림 API 설계 |
| 2026.07 ~ 2026.08 | 보안사 Cloud PC 인증 연동 | 개발 | Okta 연동 가이드·API 명세, VPN 비밀번호 암호화 방식 개선, AD 동기화 모듈 분석 |
| 2026.05 ~ 현재 | **사내 AI 개발 플랫폼** (LLM Gateway · AI Harness) | 설계·개발 주도 | 아래 별도 정리 |
| 2026.04 ~ 2026.06 | 제로트러스트 세션 게이트웨이(ZTSG) 설계 | 설계 | VM 5만 대 규모 접속 아키텍처, TPM 기반 단말 자격증명(EK → AK → LDevID → mTLS → SPA), Keycloak 단말 인증 방식 비교 |
| 2025.09 ~ 2026.04 | Cloud PC 고정 IP·PORT 할당, 리소스 관리 고도화 | 개발·설계·코드리뷰 주관 | 서브넷·IP 변경 기능, VM 명명 체계, API·DB 설계, 1·2차 코드리뷰 |
| 2025.04 ~ 2025.08 | Cloud PC 모니터링 대시보드 고도화 | 개발 | 서버·스토리지·테넌트·네트워크·POD·가상 PC 대시보드 API, NetApp ONTAP REST 연동 |
| 2024.10 ~ 2025.03 | 멀티클라우드 관리(MCMS) 개발 | 개발·**OTEL 전담** | OpenTelemetry Collector 수집 파이프라인 개발·운영, ClickHouse 적재 |
| 2022.10 ~ 2024.06 | Cloud PC Management 개발 | 개발 겸 SRE | 개발서버 CI/CD 구축, Grafana Tempo helm chart, k6 API 검증, Prometheus·Loki 모니터링 |
| 2020.11 ~ 2022.10 | OpenStack 기반 Cloud PC 백엔드 고도화 | 개발 | Redis Sentinel 전환(백엔드 12개), 7,000명 AD/LDAP·OTP 연동, 700만 건 조회 2분 43초 → 4.3초 |
| 2018.11 ~ 2020.10 | 프라이빗 클라우드 포털 1~3차 | 개발·QA | 관리 포털 개발, VMware vRA 기반 전환·DB 마이그레이션, k8s 운영 배포 |

### 사내 AI 개발 플랫폼 (2026.05 ~ 현재)

소스코드가 외부로 새지 않게 팀이 AI를 쓰도록 만든 사내 LLM Gateway입니다. Gateway 저장소 커밋 421건 중 420건을 직접 작성했습니다.

- **3가지 경로를 하나의 Gateway로**: ① 로컬 LLM(Ollama) + RAG 컨텍스트 주입 ② 식별자·키·IP·함수 본문 6단계 마스킹 후 상용 LLM 호출, 응답 역치환 ③ Claude Code·opencode용 MCP 서버(코드 검색·파일 조회·아키텍처 분석 도구)
- 파일 민감도(Tier) 자동 분류로 외부 전송 통제, API Key 인증·호출량 제한·감사 로그
- 코드 RAG: nomic-embed + Qdrant 하이브리드 검색, Bitbucket·GitHub·Jira·Confluence·Figma 커넥터, 야간 동기화
- 대량 저장소 호출로 생긴 운영 장애를 분석해 기획용 MCP 도구를 RAG 전용으로 재설계, 회귀 원인 규명·재검증
- LangGraph 오케스트레이터로 Jira 이슈 감시·영향도 분석 자동화, microk8s helm 배포
- claude.ai·Cowork 커스텀 커넥터로 사내 MCP 연결(2026-11) — TLS 입구, 경로 허용 목록
- AI Harness 메인테이너: 보안 프로필(hidden / secure / open)별 설치 CLI, 역할별 스킬, 팀 표준 개발 흐름(Jira → 분석 → 구현 → 검증 → 문서화) 정의

스택: Python · FastAPI · Ollama · Qdrant · LangGraph · MCP · Claude Code · helm

## 기술 스택

| 분야 | 기술 |
|---|---|
| 언어 · 프레임워크 | Java(8년), Spring Boot·Batch·Cloud Gateway, MyBatis, JPA, Python(FastAPI), Vue.js |
| 데이터 · 메시징 | MariaDB/MySQL, ClickHouse, Redis(Sentinel), RabbitMQ, Elasticsearch, Qdrant |
| 인프라 · 배포 | Kubernetes(CKA), microk8s, helm, Docker·containerd, Jenkins, Nexus, Harbor, OpenStack, VMware vRA, nginx·TLS |
| 관측성 | OpenTelemetry, Grafana Tempo, Prometheus·PromQL, Grafana, Loki, Kibana, k6 |
| 인증 · 보안 | Keycloak(SPI), WebAuthn·패스키, Okta, SSO, AD/LDAP·OTP, OPA, RBAC·JWT, mTLS·SPA, OpenZiti |
| AI | LLM Gateway, Ollama, RAG, MCP 서버 개발, LangGraph, 소스 마스킹, Claude Code·스킬 |

## 자격증 · 교육 · 학력

| 구분 | 내용 | 시기 |
|---|---|---|
| 자격증 | CKA (Certified Kubernetes Administrator) | 2024.06 |
| 자격증 | ADsP (데이터분석 준전문가) | 2023.11 |
| 자격증 | 빅데이터분석기사 | 2021.07 |
| 자격증 | 정보처리기사 | 2018.05 |
| 교육 | DevOps를 위한 쿠버네티스 클러스터 구축 및 운영 전문가 과정 (CCCR, 104시간) | 2023.10 ~ 11 |
| 교육 | 자바 머신러닝 기반 응용SW 엔지니어 양성과정 (960시간) | 2018.04 ~ 11 |
| 학력 | 강원대학교 경제학과 학사 (사학 복수전공) | 2011 ~ 2018 |

## 업무와 개인 프로젝트의 연결

- 2023~2024년 포크 저장소(NetApp exporter, SigNoz OTel, Pinpoint Helm, Tibero, libvirtd)는 Cloud PC 모니터링·SRE 업무 시기에 참고한 것입니다.
- dnfParty의 helm/K8s 배포, mafia-game-web의 LangGraph·Claude API 구성은 업무에서 쓰는 K8s·AI 플랫폼 경험과 같은 계열입니다.
