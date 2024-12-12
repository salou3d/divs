#!/usr/bin/env bash

binsFile="/media/SDisque/Disque-S/Documents/DocsTXT/cmds-apps/cli-tools-links.txt"

cd ~/.local/bin
echo $PWD

bat /media/SDisque/Disque-S/Documents/DocsTXT/cmds-apps/cli-tools-links.txt | fzf -d ';' \
    --preview 'echo $({1} --version); echo {2} | cut -d"/" -f4,5; which $(echo {1})' \
    --bind 'enter:execute%echo {1}%' \
    --bind 'alt-u:execute%echo "Updating {1}..."; eget $(echo {2} | cut -d"/" -f4,5)%' \
    --bind 'alt-x:execute%xdg-open {2}%'


cd
