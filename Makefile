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

# Define a Makefile rule to check the formatting of shell script files using shfmt
SHELL_SCRIPTS := $(wildcard *.sh)
BASH_SH := bash/.aliases bash/.bash_profile bash/.exports bash/.functions bash/.inputrc
shfmt: ## Check with shfmt
	@echo "Checking shell script formatting with shfmt..."
	@echo "These files need formatting:"
	@shfmt -i 2 -l \
		$(SHELL_SCRIPTS) \
		$(BASH_SH) \
		bin/symlink-tasks \
		bootstrap \
		|| (echo "Shell script formatting errors detected." \
			&& exit 1)

.PHONY: help
help: ## Show this help message and exit
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'