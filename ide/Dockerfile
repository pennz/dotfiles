FROM registry-intl.ap-southeast-1.aliyuncs.com/search_tool/ide_by_nix:v0.2.0
LABEL maintainer="fireflysuccess@gmail.com"

COPY home.nix /root/.config/nixpkgs/home.nix

#RUN chmod o+x /root && chmod o+r /root \
#  && rm -rf /var/cache/apk/* \
#  && /nix/var/nix/profiles/default/bin/nix-collect-garbage --delete-old \
#  && /nix/var/nix/profiles/default/bin/nix-store --optimise \
#  && /nix/var/nix/profiles/default/bin/nix-store --verify --check-contents

#RUN echo "export PATH=/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:\${PATH}" >> /etc/profile
#RUN addgroup --gid 1001 pengyu
#RUN adduser --disabled-password --gecos '' --uid 1001 -G pengyu pengyu
#USER pengyu
#WORKDIR /home/pengyu

ENTRYPOINT ["tmux"]
