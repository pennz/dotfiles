# life
Enjoy the moment


*parts*

# 15, 18:33
worked on antlr thing, just retrieve memory.
Test gg
Test Done
Antl4 thing, so it is the problem for go target generation, but the language is for CPP.
It really takes time. Go to eat now.
Another 25min ... still handle the error.
And another time. Issue found , it can be search in the github. So always search.
So for the frida thing?


## useful commands
base ❯ docker save kylemanna/aosp:latest-add-py3-repo |  pv | docker $(docker-machine config default) load
1.04GiB 0:00:25 [42.5MiB/s] [                               <=>                                                                  ]
1ea5a27b0484: Loading layer [==================================================>]  123.5MB/123.5MB
24ab7de5faec: Loading layer [==================================================>]  11.78kB/11.78kB
10e46f329a25: Loading layer [==================================================>]  15.87kB/15.87kB
92d3f22d44f3: Loading layer [==================================================>]  3.072kB/3.072kB
5a3d7821e6b6: Loading layer [==================================================>]  886.3kB/886.3kB
bb9616be04f5: Loading layer [==================================================>]  850.2MB/850.2MB
43e454790a63: Loading layer [==================================================>]  32.26kB/32.26kB
ed3e3b3a3b18: Loading layer [==================================================>]  32.26kB/32.26kB
c0a999cad957: Loading layer [==================================================>]   2.56kB/2.56kB
3ddac0d72c0f: Loading layer [==================================================>]  3.072kB/3.072kB
4436acb6e930: Loading layer [==================================================>]  1.536kB/1.536kB
445f81a2bf00: Loading layer [==================================================>]  4.096kB/4.096kB
b7cda028720d: Loading layer [==================================================>]  131.5MB/131.5MB
4c0a9a5eab20: Loading layer [==================================================>]  7.459MB/7.459MB
Loaded image: kylemanna/aosp:latest-add-py3-repo

# 16, 09:24
start of the day
# todo setup heroku

## website
https://devcenter.heroku.com/articles/getting-started-with-go#set-up
brew install heroku/brew/heroku
To use the Heroku CLI's autocomplete --                                                                                                                       │+   1                                                                                   Via homebrew's shell completion:                                                                                                                            │  47
    1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion                                                                           │~
        NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded                                                                            │~
              and called, either explicitly or via a framework like oh-my-zsh.                                                                                │~
    2) Then run                                                                                                                                               │~      $ heroku autocomplete --refresh-cache
    heroku autocomplete --refresh-cache
#// it will log you in too
then find your app name in the website for your created app

now 
heroku git:clone -a YOUR_APP # authentication will be set up automatically

Then you change your code, and 
```sh
make heroku
```
which will create related docker and push to the heroku server and then run our server

 
heroku container:login # so you can push to the heroku registry
# 10:24
check the tda4 thing, ~ do it this afternoon

# 4/17 9:17

go rest api client
we found this https://github.com/go-resty/resty

http://hoagland.org/Dot.html
https://manpages.debian.org/stretch/graphviz/dotty.1.en.html

https://dreampuf.github.io/GraphvizOnline/#digraph%20G%20%7B%0A%0A%20%20subgraph%20cluster_0%20%7B%0A%20%20%20%20style%3Dfilled%3B%0A%20%20%20%20color%3Dlightgrey%3B%0A%20%20%20%20node%20%5Bstyle%3Dfilled%2Ccolor%3Dwhite%5D%3B%0A%20%20%20%20a0%20-%3E%20a1%20-%3E%20a2%20-%3E%20a3%3B%0A%20%20%20%20label%20%3D%20%22process%20%231%22%3B%0A%20%20%7D%0A%0A%20%20subgraph%20cluster_1%20%7B%0A%20%20%20%20node%20%5Bstyle%3Dfilled%5D%3B%0A%20%20%20%20b0%20-%3E%20b1%20-%3E%20b2%20-%3E%20b3%3B%0A%20%20%20%20label%20%3D%20%22process%20%232%22%3B%0A%20%20%20%20color%3Dblue%0A%20%20%7D%0A%20%20start%20-%3E%20a0%3B%0A%20%20start%20-%3E%20b0%3B%0A%20%20a1%20-%3E%20b3%3B%0A%20%20b2%20-%3E%20a3%3B%0A%20%20a3%20-%3E%20a0%3B%0A%20%20a3%20-%3E%20end%3B%0A%20%20b3%20-%3E%20end%3B%0A%0A%20%20start%20%5Bshape%3DMdiamond%5D%3B%0A%20%20end%20%5Bshape%3DMsquare%5D%3B%0A%7D
// so we can copy it...

http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.22.2068&rep=rep1&type=pdf
memory graph

# so we use antlr for parse our files , do translation, then push it to our web server, and do data analysis
v2ray_client set up
borg-backup
kaggle
.config/clash
.spacevim.d
notes.md 
rm bin/upnp
sudo vim /etc/systemd/system/snap.docker.dockerd.service
[Unit]
# Auto-generated, DO NOT EDIT
Description=Service for snap application docker.dockerd
Requires=snap-docker-423.mount
Wants=network.target
After=snap-docker-423.mount network.target
X-Snappy=yes

[Service]
Environment="HTTP_PROXY=http://172.26.20.7:7890/"
ExecStart=/usr/bin/snap run docker.dockerd
SyslogIdentifier=docker.dockerd
Restart=on-failure
WorkingDirectory=/var/snap/docker/423
TimeoutStopSec=30
Type=simple

[Install]
WantedBy=multi-user.target
