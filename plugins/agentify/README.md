# Project Automation 플러그인

에이전트, 스킬, 워크플로우 생성 및 관리를 위한 Claude Code 자동화 도구.

## 기능

### 스킬

#### agentify

기능을 적절한 Claude Code 자동화 유형으로 변환. 요구사항에 따라 Agent, Skill, Slash Command 중 최적의 유형을 선택.

**트리거**: "agentify", "자동화해", "에이전트 만들어", "스킬 만들어"

**주요 기능**:
- 자동화 유형 선택 가이드
- 배포 수준 권장 (오픈소스, 팀, 개인)
- 마켓플레이스 검색 연동
- 조합 패턴 제안

#### skill-manager

올바른 구조와 모범 사례를 적용한 Agent Skill 작성 가이드.

**트리거**: "스킬 만들어", "write a skill", "SKILL.md 도움"

**주요 기능**:
- 단계별 스킬 생성 안내
- Frontmatter 유효성 검사
- 검색 최적화를 위한 설명문 작성
- 문제 해결 팁

## 사용법

### Agentify

```
User: 코드 리뷰 프로세스를 자동화하고 싶어
Claude: [요구사항 분석]

## 자동화 유형 권장

분석 결과:
- **권장**: Agent
- **이유**: 자율적인 다단계 실행과 도구 사용이 필요

이 자동화를 어디에 배포할까요?
- 오픈소스 (마켓플레이스에 공개)
- 팀/프로젝트 (git commit, 팀 공유)
- 개인 (~/.claude/에 저장)
```

### Skill Manager

```
User: PDF 처리 스킬 만들어줘
Claude: [skill-manager 스킬 사용]

## PDF Processor 스킬 생성

스킬 생성을 안내합니다:

1. **범위**: PDF 텍스트 추출, 폼 작성, 병합
2. **위치**: ~/.claude/skills/pdf-processor/
3. **Frontmatter**: [적절한 YAML 생성]
4. **지침**: [단계별 안내]
```

## 참고 파일

agentify 스킬에 상세 참고 문서가 포함되어 있습니다:

- `references/agent-templates.md` - Agent 생성 템플릿
- `references/plugin-creation.md` - 오픈소스 플러그인 가이드
