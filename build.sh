#!/bin/bash
make gen_tarball
docker build -t ide-nix .
