FROM debian:buster
LABEL maintainer="fireflysuccess@gmail.com"

ENV TOOLS 'rsync curl tig ctags htop tree pv nmap screen time tmux netcat psmisc vim neovim ca-certificates fish' 

RUN apt-get update && apt-get install -y ${TOOLS} --no-install-recommends
    
# RUN mkdir /app
COPY .* /root/
WORKDIR /root
COPY .git/ ./.git/
COPY bin/ ./bin/

RUN git submodule update --init && .fzf/install --all; \
    curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    (yes | timeout 600 vim -u .vimrc_back "+call plug#begin()" +PlugInstall +checkhealth +qa) 
RUN bash -c "source .bashrc; timeout 3 fish"
RUN sh -c "$(git config --path --get init.templatedir)/../update.sh"

ENTRYPOINT ["/usr/bin/vim"]
