# Claude Plugins by daegunjhy

코드 품질 관리 및 프로젝트 자동화를 위한 Claude Code 플러그인 모음.

## 플러그인

### [agentify](./plugins/agentify)

에이전트, 스킬, 워크플로우 생성을 위한 자동화 도구.

- **agentify** (스킬): 기능을 적절한 자동화 유형으로 변환
- **skill-manager** (스킬): Agent Skill 작성 가이드

### [code-quality](./plugins/code-quality)

코드 리뷰 및 커밋 관리 도구.

- **commit-splitter** (스킬): 커밋 분리 전략 분석 및 권장

## 설치

### 방법 1: Claude Code 내부 (권장)

`/plugin` 명령으로 UI를 통해 설치.

### 방법 2: 터미널

```bash
cd ~/.claude/plugins/marketplaces
git clone https://github.com/daegunjhy/claude-plugins.git dgs-plugins
cd dgs-plugins
make add-marketplace
make install PLUGIN=agentify
make install PLUGIN=code-quality
```

### 설치 확인

```bash
ls ~/.claude/plugins/marketplaces/dgs-plugins/plugins/
# 출력: code-quality  agentify
```

### 업데이트

```bash
cd ~/.claude/plugins/marketplaces/dgs-plugins
git pull
make update
```

## 저자

- **daegunjhy** - jhy@daegunsoft.com

## 라이선스

MIT
