.DEFAULT_GOAL := help

SHELLCHECK_OPTS := -e SC1090 -e SC1091
.PHONY: check
check: ## Check shell scripts using ShellCheck
	shellcheck $(SHELLCHECK_OPTS) \
		bin/hello.sh \
		bin/install.sh \
		bin/symlink-tasks \
		monty/install.sh \
		packages/brew.sh \
		packages/apt.sh \
		packages/npm.sh \
		bootstrap \
		dotfiles.sh

.PHONY: help
help: ## Show this help message and exit
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'