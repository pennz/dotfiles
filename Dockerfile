FROM debian:buster
LABEL maintainer="fireflysuccess@gmail.com"

ENV TOOLS 'tig ctags htop tree pv nmap screen time tmux netcat psmisc vim'

RUN apt-get update && apt-get install -y ${TOOLS} --no-install-recommends
    
RUN mkdir /app
COPY .* /app
WORKDIR /app
COPY .git/ ./.git/
COPY bin/ ./bin/

RUN git submodule update --init && .fzf/install --all && \
    curl -fLo .vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    vim -e -u .vimrc_back +PlugInstall +q && \
    echo "unalias vim" >> .bash_aliases && source .bashrc && \
    vim -e +function +q

ENTRYPOINT ["/usr/bin/vim"]
