FROM nixos/nix
LABEL maintainer="fireflysuccess@gmail.com"

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-build -A pythonFull '<nixpkgs>'

RUN nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
RUN nix-channel --update
RUN nix-shell '<home-manager>' -A install
COPY .config/nixpkgs/ /root/.config/nixpkgs
RUN home-manager switch -v
COPY dotfiles.tar /root/
WORKDIR /root/
RUN nix-env -i tar
RUN tar --ignore-zeros xvf /root/dotfiles.tar
RUN .fzf/install --all; \
    curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    (yes | timeout 600 vim -u .vimrc_back "+call plug#begin()" +PlugInstall +checkhealth +qa)
RUN sh -c "$(git config --path --get init.templatedir)/../update.sh"
