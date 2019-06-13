#!/bin/sh

# Setting this, so the repo does not need to be given on the commandline:
#export BORG_REPO=/media/p/b7f72e09-1bc0-44f5-88b6-93cd4aa8c445/borg
export BORG_REPO=/run/media/pengyu/b7f72e09-1bc0-44f5-88b6-93cd4aa8c445/borg

# Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE='lit2bit@backup'
# or this to ask an external program to supply the passphrase:
#export BORG_PASSCOMMAND='pass show backup'

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:
SOURCE_HOME=/home/pengyu  # if you sudo, $HOME will be /root ...

borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    --compression lz4               \
    --exclude-caches                \
    --exclude '/home/*/.cache/*'    \
    --exclude "$SOURCE_HOME/zz/*"          \
    --exclude "$SOURCE_HOME/z/*"           \
    --exclude "$SOURCE_HOME/d/*"           \
    --exclude "$SOURCE_HOME/snap/*"        \
    --exclude "$SOURCE_HOME/miniconda3/*"  \
    --exclude "$SOURCE_HOME/Android/*"  \
    --exclude "$SOURCE_HOME/Arduino/*"  \
    --exclude "$SOURCE_HOME/boinc-client/*"\
    --exclude "$SOURCE_HOME/oldhome/*"  \
    --exclude "$SOURCE_HOME/e/*"           \
    --exclude "$SOURCE_HOME/Downloads/*"   \
    --exclude "$SOURCE_HOME/.config/electronic-wechat/*" \
    --exclude "$SOURCE_HOME/.local/share/Trash/*" \
    --exclude '/home/boinc/*'       \
    --exclude '/var/cache/*'        \
    --exclude '/var/tmp/*'          \
    --exclude '/var/lib/docker/*'   \
    --exclude '/var/lib/snapd/*'    \
                                    \
    ::'{hostname}-{now}'            \
    /etc                            \
    /home                           \
    /root                           \
    /var                            \

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    --prefix '{hostname}-'          \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  6               \

prune_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup and Prune finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup and/or Prune finished with warnings"
else
    info "Backup and/or Prune finished with errors"
fi

exit ${global_exit}

