SHELL=/bin/bash
PROJECT=shconf
PROJECT_ID := $(shell glc list projects --owned -s $(PROJECT) -f json | sed '1d' | jq '.[0].id')
#PROJECT_ID := 11180959
SOURCE="dotfiles.tar"

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
	mv .bash_history .bhhh
	mv Makefile mmmmm
	chmod 644 .ssh/config
	git fetch
	git checkout HEAD .zsh_history
	git checkout HEAD .bash_history
	git checkout HEAD Makefile
	git merge --no-edit --no-gpg
	mv .zhhh .zsh_history
	mv .bhhh .bash_history
	mv mmmmm Makefile

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

gen_tarball:
	@echo Running git archive...
	# use HEAD if tag doesn't exist yet, so that development is easier...
	rm $(SOURCE)
	git archive -o $(SOURCE) $(VERSION) 2> /dev/null || (echo 'Warning: $(VERSION) does not exist.' && git archive -o $(SOURCE) HEAD)
	# TODO: if git archive had a --submodules flag this would easier!
	@echo Running git archive submodules...
	# i thought i would need --ignore-zeros, but it doesn't seem necessary!
	p="$$(pwd)" && (echo CWD=$$p; git submodule foreach) | while read entering path; do \
	    temp="$${path%\'}"; \
	    temp="$${temp#\'}"; \
	    path="$$temp"; \
	    echo Entering $$path; \
	    [ "$$path" = "" ] && continue; \
	    (tmp_tar="$$(mktemp)"; cd "$$path" && git archive --prefix=./"$$path"/ HEAD > "$$tmp_tar" && cat "$$tmp_tar" >> $$p/$(SOURCE) && rm "$$tmp_tar") \
	done
