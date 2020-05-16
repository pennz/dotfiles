FROM debian:buster
LABEL maintainer="fireflysuccess@gmail.com"

ENV TOOLS 'curl tig ctags htop tree pv nmap screen time tmux netcat psmisc vim neovim ca-certificates fish' 

RUN apt-get update && apt-get install -y ${TOOLS} --no-install-recommends
    
# RUN mkdir /app
COPY .* /root/
WORKDIR /root
COPY .git/ ./.git/
COPY bin/ ./bin/

RUN git submodule update --init && .fzf/install --all; \
    ( curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    vim -u .vimrc_back "+call plug#begin()" +PlugInstall +qa ) &
RUN echo "unalias vim" >> .bash_aliases && bash -c "source .profile; fish"
RUN ( curl -fLo /root/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    nvim -u .vimrc_back "+call plug#begin()" +PlugInstall +checkhealth +qa )

ENTRYPOINT ["/usr/bin/vim"]
