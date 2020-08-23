SHELL=/bin/bash
PROJECT=shconf
PROJECT_ID := $(shell glc list projects --owned -s $(PROJECT) -f json | sed '1d' | jq '.[0].id')
#PROJECT_ID := 11180959

install_template:
	git submodule update --init
	git config --global init.templatedir '~/.git_template/template'
	"$$(git config --path --get init.templatedir)/../update.sh"
	"$$(git config --path --get init.templatedir)/configure.sh"
good-day:
	mv .zsh_history .zhhh
	git checkout $@
	chmod 644 .ssh/config
	mv .zhhh .zsh_history
pull:
	mv .zsh_history .zhhh
	chmod 644 .ssh/config
	git fetch
	git checkout HEAD .zsh_history
	git merge --no-edit --no-gpg
	mv .zhhh .zsh_history
vps:
	mv .zsh_history .zhhh
	git checkout $@
	chmod 644 .ssh/config
	mv .zhhh .zsh_history
test:
	@echo "Pass"

setup:
	git submodule update --init

get_jobs:
	glc list project-jobs $(PROJECT_ID) -f json | sed '1d' | jq '.[].id' | sort
get_job_trace:
	glc get project-job-trace $(PROJECT_ID) $$(glc list project-jobs $(PROJECT_ID) -f json | sed '1d' | jq '.[0].id') -i
