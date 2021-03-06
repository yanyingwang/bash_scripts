#!/usr/bin/env bash

__FILE__=$(readlink -f $0)

dir=/etc/init.d
ago=${__FILE__/.sh/.ago}
now=${__FILE__/.sh/.now}


if [[ $1 == "update" ]]
then
    ls -a $dir |sort > $ago
    exit 0
fi

if [[ -n $1 ]] && [[ $1 != "update" ]]
then
    echo -e "\n  Valid param should be: update \n"
    exit 0
fi


ls -a $dir |sort > $now

news=$(comm -23 $now $ago)

if [[ -n $news ]]
then
    echo -e "\n\n New sysinit script detected in \"$dir\". "
    echo -e "\n\n Details:"
    for n in $news
    do
        ls -l $dir/$n
    done
    echo -e "\n\n More: Trust in the new sysinit and update snapshot with \"$__FILE__ update\". \n"

    echo -e "\n\n lsof log:  ${__FILE__/.sh/.lsof} \n"
    for n in $news
    do
        pids=$(ps -ef | grep $n | grep -v "grep" | awk '{print $2}' | paste -d ",")
        echo -e "\n\n lsof -p $pids \n"
        lsof -p $pids
    done &> ${__FILE__/.sh/.lsof}

    exit 1
fi
