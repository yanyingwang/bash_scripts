#!/usr/bin/env bash
git=(
    "/home/wyy/bash_scripts"
    "/home/wyy/ruby_scripts"
    "/home/wyy/wyying.github.io"
)

for g in "${git[@]}"
do
    chown -R wyy.wyy $g
done


