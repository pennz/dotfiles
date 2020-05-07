config stash pop
config commit -asm "Added change"; config push; config checkout $cb
config merge master
#!/bin/bash -li
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config stash pop
config commit -asm "Added change"; config push; config checkout $cb
config merge master
#!/bin/bash -li
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
config commit -asm "$*" && config push; config checkout $cb && config merge master
#!/bin/bash -li
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
config commit -asm "$*" && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
config commit -asm "$*" && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
[ $# -gt 1 ] && config commit -asm "$*" &&  config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
echo $#
exit
#!/bin/bash -li
echo $#
exit
#!/bin/bash -li
echo $#
exit
#!/bin/bash -li
echo $#
exit
#!/bin/bash -li
echo $#
exit
#!/bin/bash -li
echo $#
exit
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
( [ $# -lt 1 ] || config commit -asm "$*" ) && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
( [ $# -lt 1 ] || config commit -asm "$*" ) && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
( [ $# -lt 1 ] || config commit -asm "$*" ) && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
( [ $# -lt 1 ] || config commit -asm "$*" ) && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
( [ $# -lt 1 ] || config commit -asm "$*" ) && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
( [ $# -lt 1 ] || config commit -asm "$*" ) && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
( [ $# -lt 1 ] || config commit -asm "$*" ) && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
config stash; config checkout master; 
config pull && config stash pop
( [ $# -lt 1 ] || config commit -asm "$*" ) && config push; config checkout $cb && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
#!/bin/bash -li
# config change commit
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && config submodule init && config submodule update
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && config submodule init && config submodule update
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && config submodule init && config submodule update
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && config submodule init && config submodule update
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
config pull --no-edit && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && config submodule init && config submodule update
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
chmod 644 /home/pengyu/.ssh/config
config pull --no-edit && chmod 644 /home/pengyu/.ssh/config ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
chmod 644 /home/pengyu/.ssh/config
config pull --no-edit && chmod 644 /home/pengyu/.ssh/config && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && config submodule init && config submodule update
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
chmod 644 ~/.ssh/config
config pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && config submodule init && config submodule update
popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
chmod 644 ~/.ssh/config
config pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
chmod 644 ~/.ssh/config
config pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
chmod 644 ~/.ssh/config
config pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && chmod 644 ~/.ssh/config && popd
pwd
clear
who
zsh
exit
zsh
exit
ls ~/.oh-my-zsh/tools/install.sh 
exit
zsh
exit
clear
zsh
exit
#!/bin/bash -li
# config change commit
pushd ~
cb=$(config rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || config stash; 
config checkout master; 
chmod 644 ~/.ssh/config
config pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (config stash pop && config commit -asm "$*" && config push ) ) && \  # $# < 1, no commit message, just pull
config checkout "$cb" && config merge --no-edit master && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/git
git pull --no-edit && chmod 644 ~/.ssh/git && ( [ $# -lt 1 ] || (git stash pop && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && git merge --no-edit good-day && chmod 644 ~/.ssh/git && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
zsh
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
cd conan_examples/
clear
ip route
ls
clear
who
clear
clear
ls
ls
who
clear
bash
zsh
tmux
clear
exit
zsh
zsh
exit
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && \  # $# < 1, no commit message, just pull
git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
zsh
exit
#!/bin/bash -li
# git change commit
pushd ~
cb=$(git rev-parse --abbrev-ref HEAD)
[ $# -lt 1 ] || git stash; 
git checkout good-day; 
chmod 644 ~/.ssh/config
git pull --no-edit && chmod 644 ~/.ssh/config && ( [ $# -lt 1 ] || (git stash pop && chmod 644 ~/.ssh/config && git commit -asm "$*" && git push ) ) && git checkout "$cb" && chmod 644 ~/.ssh/config && git merge --no-edit good-day && chmod 644 ~/.ssh/config && popd
cd exalate/
ls
ls
vi vz_in_rule 
vim vz_in_rule 
git status
git add vz_in_rule
git commit -sm "Merge it from Josef"
git commit --no-gpg-sing -sm "Merge it from Josef"
git commit --no-gpg-sign -sm "Merge it from Josef"
git status
diff in_vz_back.txt vz_in_rule.updated.txt 
fg
diff in_vz_back.txt vz_in_rule.updated.txt 
diff vz_in_rule vz_in_rule.updated.txt 
rm vz_in_rule.updated.txt 
fg
clear
tig
git status
git log
git show
git show > changes_Mapping.txt
explorer.exe
explorer.exe .
fg
tig
clear
fg
clear
ls
vi out_rule 
exit
