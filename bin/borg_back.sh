#!/bin/sh

# Setting this, so the repo does not need to be given on the commandline:
test -d /Volumes/mac_files/borg && export BORG_REPO=/Volumes/mac_files/borg

HOSTNAME=${HOSTNAME:-$(hostname)}

echo "Hostname is ${HOSTNAME}"

TRY=$(ls -d /media/*/b7f72e09-1bc0-44f5-88b6-93cd4aa8c445/borg)
test -d $TRY && export BORG_REPO=$TRY

# Setting this, so you won't be asked for your repository passphrase:
# or this to ask an external program to supply the passphrase:
which pass >/dev/null 2>&1 && export BORG_PASSCOMMAND='pass borg'

# some helpers and error handling:
info() {
    #osascript -e "display notification \"$*\" with title \"Borgbackup\""
    printf "\n%s %s\n\n" "$(date)" "$*" >&2
}
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

# Backup the most important directories into an archive named after
# the machine this script is currently running on:
TRY=/Users/v
test -d $TRY && SOURCE_HOME=$TRY # if you sudo, $HOME will be /root ...
TRY=/home/v
test -d $TRY && SOURCE_HOME=$TRY # if you sudo, $HOME will be /root ...

TRY=$(getent passwd $USER | cut -d: -f6)
test -d $TRY && SOURCE_HOME=$TRY # if you sudo, $HOME will be /root ...

BORG=$(which borg 2>/dev/null)
if which borg 2>/dev/null >&2; then
    echo "borg used: $(which borg)"
else
    echo >&2 "Error: borg not found."
    exit 1
fi

BORG="sudo $BORG"
TRY=/home/v/miniconda3/bin/borg
test -e $TRY && BORG="sudo $TRY"

# https://manpages.debian.org/testing/borgbackup/borg-patterns.1.en.html
# if a given pattern ends in a path separator, a '*' is appended before
# matching is attempted.

backup() {
    (
        info "Starting backup"
        #set -x
        $BORG create \
            --progress \
            --filter AME \
            --stats \
            --show-rc \
            --compression lz4 \
            --exclude-caches \
            --exclude '/home/*/.cache/' \
            --exclude '/Applications/Xcode.app/' \
            --exclude "/usr/local/texlive/" \
            --exclude "/usr/local/Homebrew/.git/" \
            --exclude "/usr/local/Homebrew/.github/" \
            --exclude "$SOURCE_HOME/Library/Containers/com.docker.docker/Data/vms" \
            --exclude "$SOURCE_HOME/VirtualBox\ VMs/" \
            --exclude "$SOURCE_HOME/VirtualBox VMs/" \
            --exclude "$SOURCE_HOME/not-backup/" \
            --exclude "$SOURCE_HOME/d/" \
            --exclude "$SOURCE_HOME/works/" \
            --exclude "$SOURCE_HOME/Dropbox/" \
            --exclude "$SOURCE_HOME/not_backup/" \
            --exclude "$SOURCE_HOME/anaconda3/" \
            --exclude "$SOURCE_HOME/snap/" \
            --exclude "$SOURCE_HOME/miniconda3/" \
            --exclude "$SOURCE_HOME/.Genymobile/" \
            --exclude "$SOURCE_HOME/Android/" \
            --exclude "$SOURCE_HOME/Arduino/" \
            --exclude "$SOURCE_HOME/Library/Caches/" \
            --exclude "$SOURCE_HOME/oldhome/" \
            --exclude "$SOURCE_HOME/e/" \
            --exclude "$SOURCE_HOME/Downloads/" \
            --exclude "$SOURCE_HOME/.android/avd/" \
            --exclude "$SOURCE_HOME/.docker/" \
            --exclude "$SOURCE_HOME/.config/electronic-wechat/" \
            --exclude "$SOURCE_HOME/.local/share/Trash/" \
            --exclude "$SOURCE_HOME/.local/share/Steam/" \
            --exclude '/home/boinc/' \
            --exclude '/Users/Shared/' \
            --exclude '/var/cache/' \
            --exclude '/var/tmp/' \
            --exclude '/var/lib/docker/' \
            --exclude '/var/lib/snapd/' \
            --exclude '/private/tmp/' \
            --exclude '/tmp/' \
            --exclude '/user/local/Cellar/' \
            \
            "$BORG_REPO"::"${HOSTNAME}-$(date | sed -e 's/ /_/g' -e 's/:/_/g')" \
            /etc \
            $SOURCE_HOME \
            /usr/local \
            /nix \
            /var/log &&
            info "Backup completed" &&
            touch $SOURCE_HOME/.lastbackup
        #set +x
    ) ||
        ([ "$1" -ge 604800 ] && info "ERROR: Backup was failed during week")
}

remove_old_backup() {
    info "Pruning repository"

    # Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
    # archives of THIS machine. The '{hostname}-' prefix is very important to
    # limit prune's operation to this machine's archives and not apply to
    # other machines' archives also:

    $BORG prune \
        --list \
        --prefix "${HOSTNAME}-" \
        --show-rc \
        --keep-daily 7 \
        --keep-weekly 4 \
        --keep-monthly 6 \
        "$BORG_REPO"
}

check_and_backup() {
    if [ ! -f $SOURCE_HOME/.lastbackup ]; then
        touch $SOURCE_HOME/.lastbackup
        backup 604801
    else
        LASTBACKUP=$(date -r $SOURCE_HOME/.lastbackup +%s)
        CURTIME=$(date +%s)
        DIFF=$((CURTIME - LASTBACKUP))
        #echo $DIFF
        if [ $DIFF -ge 86400 ]; then
            backup $DIFF
            backup_exit=$?

            remove_old_backup
            prune_exit=$?
            # use highest exit code as global exit code
            global_exit=$((backup_exit > prune_exit ? backup_exit : prune_exit))

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
