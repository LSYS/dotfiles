.DEFAULT_GOAL := help

SHELLCHECK_OPTS := -e SC1090 -e SC1091
.PHONY: check
check: ## Check shell scripts using ShellCheck
	shellcheck $(SHELLCHECK_OPTS) \
		bash/.aliases \
		bash/.bash_profile


.PHONY: help
help: ## Show this help message and exit
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'