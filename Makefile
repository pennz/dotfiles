install_template:
	git config --global init.templatedir '~/.git_template/template'
	$(git config --path --get init.templatedir)/../update.sh
	"$(git config --path --get init.templatedir)/configure.sh"
test:
	@echo "Pass"
