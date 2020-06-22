tig
du -sh .git
tar czf git_renamed_301.tar.gz .git 
bg
clear
ls
jobs
clear
ls
git branch -a
tig --all
tig 0605_BF
git checkout cd285e073ef859b3f25 
git switch -c before_overwritten
tig
clear
ls
clear
tig
clear
tig
clear
git whatchanged --help
tig
git log --author Zhou Pengyu
git log --author "Zhou Pengyu"
git log --oneline --author "Zhou Pengyu"
tig
git log --oneline --author "ZhouPengyu"
tig
git log --oneline --author "Zhou?Pengyu"
git log --oneline --author="Zhou?Pengyu"
git log --oneline --author="Zhou.?Pengyu"
git log --oneline --author="Zhou.Pengyu"
git log --oneline --author="\(Zhou Pengyu\)"
git log --oneline --author="\(Zhou Pengyu\)|\(ZhouPengyu\)"
git log --oneline --author="\(Zhou Pengyu\)\|\(ZhouPengyu\)"
git log --oneline --author="\(Zhou Pengyu\)\|\(ZhouPengyu\)" > Change_List_Z
vi Change_List_Z 
less Change_List_Z 
tig --all
vim Change_List_Z 
man git-am
man git-apply
tig
cut -d" " -f1 Change_List_Z 
cut -d" " -f1 Change_List_Z | xargs -I{} git format-patch -1
rm *.patch
cut -d" " -f1 Change_List_Z | xargs -I{} git format-patch -1 {}
mkdir formated_patches
mv *.patch formated_patches/
cd formated_patches/
ls
ls -lht
man git-am
ls
ls -lht
head ../Change_List_Z 
ls -t
head 0001-Added-Posix_p2pcomif-cfg-to-solve-link-problem-for-C.patch 
vim 0001-Added-Posix_p2pcomif-cfg-to-solve-link-problem-for-C.patch 
cd ..
tar czf patched.tgz formated_patches/
. ~/.fzf.bash 
scp patched.tgz  zhoupengyu@172.26.253.203:~
tmux
ssh zhoupengyu@172.26.253.203
rm formated_patches/
rm formated_patches/*
cut -d" " -f1 Change_List_Z| xargs -I{} bash -c 'git format-patch -1 {}; sleep 1'
tar czf p.tgz *.patch
rsync -a *.patch zhoupengyu@172.26.253.203:/home/zhoupengyu/works/beip_dev/beip30
cd ../../workspace/kaggle_runner/
git grep 
git grep "<3"
ls -t *.patch
ls
c -
ls
ls -t *.patch
clear
tig
q
clear
tig
tig origin/integration/master
tig origin/integration/master_merge_update_258 
git log --oneline --author="\(Zhou Pengyu\)\|\(ZhouPengyu\)" > Change_List_Z
vi Change_List_Z 
vim Change_List_Z 
git checkout integration/master
git log --oneline --author="\(Zhou Pengyu\)\|\(ZhouPengyu\)" > Change_List_Z
vim Change_List_Z 
cut -d" " -f1 Change_List_Z | xargs -I{} bash -c 'git format-patch -1 {}; sleep 1;'
rsync -a *.patch zhoupengyu@172.26.253.203:/home/zhoupengyu/works/beip_dev/
ls *.patch
rm *.patch
cut -d" " -f1 Change_List_Z | xargs -I{} bash -c 'git format-patch -1 {}; sleep 1;'
rsync -a *.patch zhoupengyu@172.26.253.203:/home/zhoupengyu/works/beip_dev/
mkdir patched
mv *.patch patched
cut -d" " -f1 Change_List_Z | xargs -I{} bash -c 'git format-patch -1 {}^; sleep 1;'
head Change_List_Z 
tig
ls
ls -t *.patch
ls -t patched/*
vi patched/0001-EPH-2077-Manually-modify-Dcm_Lcfg.c-for-compilation.patch 
vim patched/0001-EPH-2077-Manually-modify-Dcm_Lcfg.c-for-compilation.patch 
rm -rf patched
rm *.patch
cut -d" " -f1 Change_List_Z | xargs -I{} bash -c 'git format-patch -1 {}; echo {};sleep 1;'
tig 31a8bbae
tig 923469ff
tig 1a6969c6
tig
clear
tig
clear
tig
tig --all
exit
tmux attach
clear
ls
clear
ls
cd /mnt/d/PIE/
cd SAIC_EP21H2_SW011_PIE-CD10-217/
ls
rg TracePMRunTime
rg -l TracePMRunTime
rg -l PMRunTime
exit
clear
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org
gcc
which gcc
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org
ssh-copy-id -p 29922 v@vtool.duckdns.org
clear
exit
ssh zhoupengyu@172.26.253.203
/
clear
ssh -p 29932 pengyu@pengyuzhou.com
ssh -p 29922 v@vtool.duckdns.org
ssh-keygen -f "/home/pengyu/.ssh/known_hosts" -R "[vtool.duckdns.org]:29922"
ssh -p 29922 v@vtool.duckdns.org
ssh -p 29922 v@vtool.duckdns.org
ssh-copy-id -p 29922 v@vtool.duckdns.org
ssh -p 29922 v@vtool.duckdns.org
clear
LC_ALL='en_US.UTF-8' mosh --ssh="ssh -p 29922" v@vtool.duckdns.org --server /Users/v/.nix-profile/bin/mosh-server
LC_ALL='en_US.UTF-8' mosh --ssh="ssh -p 29922" v@vtool.duckdns.org 
LC_ALL='en_US.UTF-8' mosh --ssh="ssh -p 29922" v@vtool.duckdns.org 
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org
clear
git fetch
tig --all
git checkout 0605_BF_merge_PH00 
tig
clear
git checkout 0605_BF_merge_PH00 
tig
git pull
git branch --set-upstream-to=origin/0605_BF_merge_PH00 0605_BF_merge_PH00
git remote show
git remote show b3
ssh zhoupengyu@172.26.253.203
git remote add origin ssh://git@git.technomous.com.cn:7999/eph/beip_dev.git
git branch --set-upstream-to=origin/0605_BF_merge_PH00 0605_BF_merge_PH00
git fetch
git pull
git branch --set-upstream-to=origin/0605_BF_merge_PH00 0605_BF_merge_PH00
exit
exit
exit
exit
exit
exit
cd /mnt/d/PIE/BEIP_dev/
ls
clear
ls
git push
git pull
exit
git pull
git config --global pull.rebase false
git status
git fetch
tig --all
c
git pull
git push
clear
. ~/.bashrc
clear
git status
clear
pwd
cd ../..
cd ..
rg -l BC_WDGM_SUPERVISION
git commit -asm "undef BC_WDGM_ in Rte_Type.h"
git push
clear
tig
clear
fg
ls
clear
git show
nvim
git push
tig
q
qq
cd /mnt/d/PIE/BEIP_dev/
cd beip301_bugfix/
vim 
nvim
git push
tig
qqq
:q
:q
bash
git pull
git push
fg
cd /mnt/d/PIE/BEIP_dev/
git lg2
git push
git diff 
git diff --cached
git commit -asm "LCSS_PH00: added LCS_SM src"
git commit -asm "LCSS_PH00: added LCS_SM src" --no-gpg
git push
tig
fg
clear
jobs
tig
nvim
git status
git branch
fzf
fg
tig
tig beip301_bugfix/1700-configout/build/swc/Posix_CtCdLCSS_PH00.ini
fg
git diff
git diff --cached
git commit -asm "Fixed some var should be P2VAR"
git push
fg
tig
fg
fg
clear
tig
git revert 2cf7e050c7f04f10b10a3b4
tig
fg
git diff
 git status
tig
git commit -asm "Fix trace"
git push
fg
git push
fg
git revert HEAD
fg
git push
fg
clear
tig
tig
clear
git status
git diff
git diff --cached
git stash
gtig
tig
git push
git pull
tig --all
git rebase -i c100a00420b2dcb9bc7704d^
git reflog
git reset --hard c26524c0e
tig
git rebase -i c100a00420b2dcb9bc7704d^
git mergetool
git rebase --continue
tig
git rebase -i  149e1953b240^
tig
git rebase -i  751218a59^
tig
git rebase -i  06055^
tig
clear
tig --all
git rebase -i 4c229cda6ca6c7789
tig
git push
git push --force
tig
tig --all
clear
exit
fg
exit
cd  /d/PIE/BEIP_dev/beip301_bugf*
cd  /mnt/d/PIE/BEIP_dev/beip301_bugf*
tig 1500-build/LB/scripts/
tig 1500-build/LB/scripts/MoWi_QNX.py
git pull
tig
git push
tig
clear
fg
ping 192.168.56.102
ip route
ping 192.168.56.102
clear
cd /mnt/d/new/
ls
mkdir swc
mv * swc
ls
scp -r swc/ kali@192.168.56.102:/media/kali/82ac350d-7415-4011-8944-f38c220d8042/update/
scp -r swc/ root@192.168.56.102:/media/kali/82ac350d-7415-4011-8944-f38c220d8042/update
scp -r swc/ root@192.168.56.102:/media/kali/82ac350d-7415-4011-8944-f38c220d8042/update
scp -r swc/ root@192.168.56.102:/media/kali/82ac350d-7415-4011-8944-f38c220d8042/update
scp -r swc/ kali@192.168.56.102:/media/kali/82ac350d-7415-4011-8944-f38c220d8042/update/
cd swc/
md5sum CtApADASDecision 
md5sum CtApADASDecision 
ping 192.168.1.70
ls
scp * root@192.168.1.70://opt/tttech/motionwise/app/bin
ls -lh
ls -l
exit
cd /mnt/d/new/swc/

cd /mnt/d/new/swc/
ls -lh libSchedTable.so 
ls -l libSchedTable.so 
ps exit
exit
LC_ALL='en_US.UTF-8' mosh --ssh="ssh -p 29922" v@vtool.duckdns.org 
bash
ssh root@172.26.253.164
ssh root@172.26.253.167
scp root@172.26.253.167:~/\*pdf /mnt/d
cd /mnt/d/
cd workspace/git_sources/
ls
cd SV51/
ls
cd jenkins_integration/
ls
tig
git reset f7edff63eae12dfff4caa61a11484c25a8b53998 
tig
tig
git reset --hard f7edff63eae12dfff4caa61a11484c25a8b53998 
tig
git push --force
tig
git push --force
tig
git checkout um_file
git checkout -b um_file
git push
git push --set-upstream origin um_file
cd /mnt/d/workspace/git_sources/SV51/
ls
cd jenkins_integration/
git fetch
vi .git/config 
cat ~/.ssh/id_rsa.pub 
fg
git pull
git branch
git checkout um21_update_src 
git --all
tig --all
tig --all
git checkout um21_update_src
git fetch
git pull
ls
clear
ls
tig
tig
clear
ls
vi Dockerfile 
nvim Dockerfile 
git commit -asm "Change to Template name"
git push
tig
clear
ls
fg
tig
fg
git status
tig
fg
clar
clear
ls
fg
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org

~
clear
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org
exit
cd /mnt/d/PIE/SAIC_EP21H2_SW011_PIE-CD10-217/
cd 0900_System/03_flashing/
ls
cd 01_Debug/
ls
cd PH00/
ls
clear
ls
cd QNX/
ls
ls
ls -lh
hexdump ifs-update-image.bin | head
hexdump -d ifs-update-image.bin | head
man hexdump
hexdump -C ifs-update-image.bin | head
hexdump -C ifs-update-image.bin | head -n 100
hexdump -C ifs-update-image.bin > ifs-update.hexdump
tmux
clear
ls
cd /mnt/d/new/swc/
ls *bin
scp *bin kali@192.168.56.102:/media/kali/B2\*
md5sum *bin
ssh-copy-id kali@192.168.56.102
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org
clear
exit
cd /mnt/d/new/swc/
ssh-copy-id qnx@172.26.253.188
scp * qnx@172.26.253.188:/home/qnx/z/src_git/1300-os-iecu-qnx/0137_SWC
ssh qnx@172.26.253.188
exit
ssh zhoupengyu@172.26.253.203
ssh -f -N -L 9001:localhost:10001  -p 29922 v@vtool.duckdns.org
ssh zhoupengyu@172.26.253.203
cd /mnt/d/workspace/kaggle_runner/
ls
git pull
exit
LC_ALL='en_US.UTF-8' mosh --ssh="ssh -p 29922" v@vtool.duckdns.org 
ssh -f -N -L 9001:localhost:10001  -p 29922 v@vtool.duckdns.org
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org
clear
ls
clear
cd ../../Users/ZhouPengyu/Documents/
grep "float" -n *csv
exit
cd ../../Users/ZhouPengyu/Documents/
ls
grep padding -n *.csv
grep PAD -n *.csv
grep float -n *.csv
grep Pad -n *.csv
vim Dt_RECORD_Environment_InitData.csv 
clear
exit
ssh zhoupengyu@172.26.253.203
exit
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org
ssh -f -N -L 9000:localhost:10000  -p 29922 v@vtool.duckdns.org
. ~/.bashrc
cd
pwd
clear
git status
cd v
clear
git pull
