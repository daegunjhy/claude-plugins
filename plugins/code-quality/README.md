# Code Quality 플러그인

코드 리뷰 및 커밋 관리 도구 모음.

## 기능

### 에이전트

#### commit-reviewer

개별 커밋의 컨벤션 준수 여부를 검토. 공식 [code-review](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/code-review) 플러그인(PR 단위 리뷰)과 상호 보완적으로 사용.

**주요 기능**:
- CONTRIBUTING.md 컨벤션 기반 커밋 변경사항 검토
- 린터 설정 및 코드 패턴 감지
- CONTRIBUTING.md 미존재 시 자동 생성
- 인터랙티브 이슈 처리

**공식 code-review와의 차이점**:

| 구분 | code-review (공식) | commit-reviewer (이 플러그인) |
|------|-------------------|------------------------------|
| 범위 | PR 단위 | 개별 커밋 |
| 트리거 | `/code-review` 명령 | 매 커밋 후 자동 |
| 초점 | 4개 병렬 에이전트, 신뢰도 점수 | CONTRIBUTING.md 준수 |
| 생성물 | PR 리뷰 코멘트 | CONTRIBUTING.md (없을 시) |

### 스킬

#### commit-splitter

스테이징된 변경사항을 분석하여 커밋 분리 여부를 권장.

**트리거**: "commit split", "커밋 분리해야 할까" 등 언급 시 활성화

**판단 기준**:
- 서로 무관한 기능 변경이 섞여 있는 경우
- 변경 유형 혼재 (feat + fix + refactor)
- 여러 디렉토리에 걸친 광범위한 파일 변경
- diff 크기가 큰 경우

## 사용법

### 커밋 분리

대규모 변경사항 커밋 전:

```
User: 변경사항 분리해서 커밋해
Claude: [스테이징된 변경사항 분석]

## 분석 결과
### 권장: 2개 커밋으로 분리

**커밋 1**: feat: 사용자 API 추가
- src/api/user.ts
- tests/api/user.test.ts

**커밋 2**: fix: 유효성 검사 로직 수정
- src/utils/validate.ts
```

## 설정

추가 설정 불필요. 다음 프로젝트 컨벤션 파일을 자동 참조:
- `CONTRIBUTING.md`
- `.eslintrc` / `.prettierrc`
- `pyproject.toml` / `ruff.toml`

## 라이선스

MIT