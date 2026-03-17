# 플러그인 구조/문서화 불일치 오류 5건

## 개요

플러그인 저장소의 구조와 문서를 전수 검사한 결과, 실제 파일 구조와 문서/메타데이터 간 불일치가 5건 발견되었습니다.

---

## Issue 1. 존재하지 않는 스킬 참조 [심각]

`marketplace.json` (line 12)의 agentify description에 `skill-manager`와 `next-action`이 언급되지만, 실제로는 `agentify` SKILL.md만 존재합니다.

**영향 범위:**

| 파일 | 위치 | 내용 |
|------|------|------|
| `.claude-plugin/marketplace.json` | line 12 | `"skill-manager (create Skills), and next-action (suggest follow-up tasks)"` |
| `plugins/agentify/README.md` | line 21-31 | `skill-manager` 섹션 전체 |
| `README.md` | line 12 | `skill-manager (스킬)` 항목 |

**수정 방향:** marketplace.json description을 실제 기능에 맞게 수정. README에서 skill-manager 관련 내용 제거.

---

## Issue 2. agentify README.md 참고 파일 경로 오류 [중간]

- **파일:** `plugins/agentify/README.md` line 73-74
- **현재:** `references/agent-templates.md`, `references/plugin-creation.md`
- **실제 경로:** `skills/agentify/resources/agent-templates.md`, `skills/agentify/resources/plugin-creation.md`

**수정 방향:** `references/` → `skills/agentify/resources/`로 경로 수정

---

## Issue 3. 루트 README.md에 commit-reviewer 누락 [중간]

- **파일:** `README.md` line 14-18
- code-quality 플러그인 섹션에 `commit-splitter`만 나열되고 `commit-reviewer` 에이전트가 빠져있음

**수정 방향:** commit-reviewer 에이전트 항목 추가

---

## Issue 4. commit-reviewer.md YAML frontmatter 오류 [심각]

- **파일:** `plugins/code-quality/agents/commit-reviewer.md` line 3
- description 필드에 리터럴 개행문자(`\n`)가 포함되어 YAML 파싱 오류 가능
- description에 Examples 블록까지 포함되어 frontmatter가 비정상적으로 김

**현재 상태:**
```yaml
description: Review individual commits for convention compliance...\n\nExamples:\n\n<example>\n...
```

**수정 방향:** description을 간결한 한 줄로 정리. Examples는 본문(frontmatter 아래)으로 이동.

---

## Issue 5. SKILL.md의 skill-manager 참조 [경미]

- **파일:** `plugins/agentify/skills/agentify/SKILL.md` line 72
- Step 4에서 `Skill → **MUST** use skill-manager`라고 하지만 skill-manager는 존재하지 않음

**현재:**
```
**Skill** → **MUST** use skill-manager (do NOT create directly)
```

**수정 방향:** skill-manager 의존 문구 제거, 직접 SKILL.md 파일 생성 안내로 변경

---

## 수정 대상 파일 요약

| # | 심각도 | 파일 | 수정 내용 |
|---|--------|------|-----------|
| 1 | 심각 | `.claude-plugin/marketplace.json` | agentify description에서 존재하지 않는 스킬 제거 |
| 2 | 중간 | `plugins/agentify/README.md` | skill-manager 섹션 제거, 참고 파일 경로 수정 |
| 3 | 중간 | `README.md` | skill-manager 제거, commit-reviewer 추가 |
| 4 | 심각 | `plugins/code-quality/agents/commit-reviewer.md` | frontmatter description 정리 |
| 5 | 경미 | `plugins/agentify/skills/agentify/SKILL.md` | skill-manager 참조 제거 |
