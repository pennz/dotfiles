install_template:
	git submodule update --init
	git config --global init.templatedir '~/.git_template/template'
	sh $(git config --path --get init.templatedir)/../update.sh
	sh "$(git config --path --get init.templatedir)/configure.sh"
good-day:
	mv .zsh_history .zhhh
	git checkout $@
	mv .zhhh .zsh_history
vps:
	mv .zsh_history .zhhh
	git checkout $@
	mv .zhhh .zsh_history
test:
	@echo "Pass"
