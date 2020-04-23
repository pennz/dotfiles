#!/bin/sh

# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO=/Volumes/mac_files/borg

# Setting this, so you won't be asked for your repository passphrase:
# or this to ask an external program to supply the passphrase:
export BORG_PASSCOMMAND='pass borg'

# some helpers and error handling:
info() {
    #osascript -e "display notification \"$*\" with title \"Borgbackup\""
    printf "\n%s %s\n\n" "$( date )" "$*" >&2;
}
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM


# Backup the most important directories into an archive named after
# the machine this script is currently running on:
SOURCE_HOME=/Users/v  # if you sudo, $HOME will be /root ...

backup () {
    (
    info "Starting backup"
    borg create                         \
        --progress                      \
        --filter AME                    \
        --list                          \
        --stats                         \
        --show-rc                       \
        --compression lz4               \
        --exclude-caches                \
        --exclude '/home/*/.cache/*'    \
        --exclude '/Applications/Xcode.app/*'   \
        --exclude "/usr/local/texlive/*"          \
        --exclude "/usr/local/Homebrew/.git/*"          \
        --exclude "/usr/local/Homebrew/.github/*"          \
        --exclude "$SOURCE_HOME/Library/Containers/com.docker.docker/Data/vms" \
        --exclude "$SOURCE_HOME/works/android_build/aosp.sparseimage" \
        --exclude "$SOURCE_HOME/VirtualBox\ VMs/*"          \
        --exclude "$SOURCE_HOME/VirtualBox VMs/*"       \
        --exclude "$SOURCE_HOME/not-backup/*"           \
        --exclude "$SOURCE_HOME/d/*"           \
        --exclude "$SOURCE_HOME/anaconda3/*"           \
        --exclude "$SOURCE_HOME/snap/*"        \
        --exclude "$SOURCE_HOME/miniconda3/*"  \
        --exclude "$SOURCE_HOME/.Genymobile/*" \
        --exclude "$SOURCE_HOME/Android/*"  \
        --exclude "$SOURCE_HOME/Arduino/*"  \
        --exclude "$SOURCE_HOME/Library/Caches/*"\
        --exclude "$SOURCE_HOME/oldhome/*"  \
        --exclude "$SOURCE_HOME/e/*"           \
        --exclude "$SOURCE_HOME/Downloads/*"   \
        --exclude "$SOURCE_HOME/.android/avd/*" \
        --exclude "$SOURCE_HOME/.docker/*" \
        --exclude "$SOURCE_HOME/.config/electronic-wechat/*" \
        --exclude "$SOURCE_HOME/.local/share/Trash/*" \
        --exclude "$SOURCE_HOME/works/android_build/aosp/*" \
        --exclude '/home/boinc/*'       \
        --exclude '/Users/Shared/*'       \
        --exclude '/var/cache/*'        \
        --exclude '/var/tmp/*'          \
        --exclude '/var/lib/docker/*'   \
        --exclude '/var/lib/snapd/*'    \
        --exclude '/private/tmp/*'    \
        --exclude '/tmp/*'    \
        \
        ::'{hostname}-{now}'            \
        /etc                            \
        $SOURCE_HOME                    \
        /Applications                   \
        /usr/local                      \
        /Library/Services                      \
        /Library/Haskell                      \
        /var/log                      \
        && info "Backup completed" \
        && touch $SOURCE_HOME/.lastbackup ) \
        || ( [ "$1" -ge 604800 ] && info "ERROR: Backup was failed during week" )
}


remove_old_backup () {
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
        --keep-monthly  6               
}



check_and_backup () {
    if [ ! -f ~/.lastbackup ]; then
        touch ~/.lastbackup
        backup 604801
    else
        LASTBACKUP=$(date -r ~/.lastbackup +%s)
        CURTIME=$(date +%s)
        DIFF=$((CURTIME - LASTBACKUP))
        #echo $DIFF
        if [ $DIFF -ge 86400 ]; then
            backup $DIFF
            backup_exit=$?

            remove_old_backup
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
        else
            info "Last backup is within one day old, no need to backup now"
        fi
    fi
}

check_and_backup
# diskutil eject /dev/disk2
