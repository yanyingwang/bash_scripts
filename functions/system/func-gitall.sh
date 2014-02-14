#!/usr/bin/env bash

func_gitall() 
{
  comment=$1 

  if [[ $# == 1 ]]
  then
    echo -e "\n\n==============\ngit pull\n=============="
    git pull

    echo -e "\n\n==============\ngit add -f * \n=============="
    git add -f *

    echo -e "\n\n==============\ngit commit -a -m \"$comment\"\n=============="
    git commit -a -m "$comment"

    echo -e "\n\n==============\ngit push\n=============="
    git push

    echo -e "\n\n==============\ngit status\n=============="
    git status

  elif [[ $# == 0 ]]
  then
    echo -e "\n\n==============\ngit pull\n=============="
    git pull


    echo -e "\n\n==============\ngit add -f * \n=============="
    git add -f *

    echo -e "\n\n===============\ngit commit -a -m 'NULL'\n================"
    git commit -a -m "NULL"

    echo -e "\n\n==============\ngit push\n=============="
    git push

    echo -e "\n\n==============\ngit status\n=============="
    git status

  else
    echo "Usage: func_gitall 'some comments'"
  fi
}
