#!/usr/bin/env bash

binsFile="/media/SDisque/Disque-S/Documents/DocsTXT/cmds-apps/cli-tools-links.txt"

function get_latest_tag() {
    tag=$(wget -O latest.html "$1/latest" | htmlq -t .d-inline.mr-3 | head -1)
}

binsNames=$(awk -F';' '{ if ($1 != "#") print $1 }' $binsFile)
idx="0"
for i in $binsNames; do
    ver=`$i --version | head -1`
    if [ $? -ne 0 ]; then
        verarg=$($i --help | grep version | awk '{print $1}')
        ver=`$i $verarg`
#         verarg=""
    fi
    binLink=$(grep "$i" $binsFile | awk -F';' '{print $2}' )
#     tags=$(wget --force-html "$binLink" | htmlq -t .Link--primary )
#     tags=$(htmlq -t -f ~/releases.$idx .Link--primary)
    tags=$(curl "$binLink" | htmlq -t .Link--primary ) # -s or --silent for quiet mode

    curver=$(echo "$tags" | head -1)

#     v=$(echo $ver | awk '{ gsub(/[a-zA-Z \-_]/, ""); print }')
    v=$(echo $ver | awk '{ print $2}')
    cv=$(echo $curver | awk '{ gsub(/[a-zA-Z \-_]/, ""); print }')

    if [ "$v" != "$cv" ]; then
        echo "--> '$i' needs update; installed: $v; new: $cv"
        xdg-open "$binLink"
    fi

    idx=$((idx+1))
    ver=""
    curver=""
    v=""
    cv=""
    tags=""

done
