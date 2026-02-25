MARKETPLACE := dgs-plugins
PLUGIN_DIR := $(shell pwd)/plugins

.PHONY: help install list add-marketplace update

help:
	@echo "사용법:"
	@echo "  make add-marketplace  마켓플레이스 등록"
	@echo "  make update           마켓플레이스 업데이트"
	@echo "  make install PLUGIN=<name>  플러그인 설치"
	@echo "  make list  플러그인 목록"

list:
	@echo "사용 가능한 플러그인:"
	@ls -1 $(PLUGIN_DIR) | sed 's/^/  - /'

add-marketplace:
	claude plugin marketplace add "$(shell pwd)"

install:
ifndef PLUGIN
	@echo "❌ PLUGIN 지정 필요: make install PLUGIN=code-quality"
	@exit 1
endif
	@if [ ! -d "$(PLUGIN_DIR)/$(PLUGIN)" ]; then \
		echo "❌ 플러그인 없음: $(PLUGIN)"; \
		exit 1; \
	fi
	@echo "플러그인 설치:"
	claude plugin install $(PLUGIN)@$(MARKETPLACE)

uninstall:
ifndef PLUGIN
	@echo "❌ PLUGIN 지정 필요: make uninstall PLUGIN=code-quality"
	@exit 1
endif
	@echo "플러그인 제거:"
	claude plugin uninstall $(PLUGIN)@$(MARKETPLACE)

update:
	git pull
	claude plugin marketplace update $(MARKETPLACE)
