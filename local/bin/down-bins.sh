#!/usr/bin/env bash

# depends on eget
# curl -o eget.sh https://zyedidia.github.io/eget.sh && bash eget.sh

if [ ! -d ~/Downloads/eget-downs ]; then
    mkdir ~/Downloads/eget-downs
fi


binsFile="/media/SDisque/Disque-S/Documents/DocsTXT/cmds-apps/cli-tools-links.txt"


cat "$binsFile" | awk -F';' '/^[^#]/{split($2, A, /\//); url = A[4] "/" A[5]; system("eget " url) }'


cpwd="$PWD"
cd ~/Downloads/eget-downs

function update_appimages() {
    mv -fv *.AppImage* ~/Apps/appimages/
}

function update_eget() {
    mkdir ./eget
    tar zxf eget*.tar.gz -C ./eget
    cd ./eget
    mv -fv ./eget ~/.local/bin/
    mv -fv ./eget.1 ~/.local/share/man/man1/
    cd ..
    rm -rv ./eget

}

function update_rmpc() {
    mkdir ./rmpc
    tar zxf rmpc*.tar.gz -C ./rmpc
    cd ./rmpc
    mv -fv ./rmpc ~/.local/bin/
    mv -fv ./completions/rmpc.bash ~/.local/share/bash-completion/completions/
    mv -fv ./man/rmpc.1 ~/.local/share/man/man1/
    cd ..
    rm -rv ./rmpc

}

function update_rustic() {
    mkdir ./rustic
    tar zxf "$(ls rustic*.tar.gz)" -C ./rustic
    cd ./rustic
    mv -fv ./rustic ~/.local/bin/
    if [ ! -d ~/.local/share/rustic ]; then
        mkdir ~/.local/share/rustic
    fi
    mv -uv ./config ./docs ~/.local/share/rustic/
    cd ..
    rm -rv ./rustic
}

function update_satty() {
    mkdir ./satty
    tar zxf "$(ls satty*.tar.gz)" -C ./satty
    cd ./satty
    mv -fv ./satty ~/.local/bin/
    mv -fv ./satty.desktop ~/.local/share/applications/
    mv -fv ./assets/satty.svg ~/.local/share/icons/hicolor/32x32/apps/
    mv -fv ./completions/satty.bash ~/.local/share/bash-completion/completions/
    cd ..
    rm -rv ./satty
}

function update_xh() {
    mkdir ./xh
    tar zxf hx*.tar.gz -C ./xh
    cd ./xh
    mv -fv ./xh ~/.local/bin/
    mv -fv ./completions/xh.bash ~/.local/share/bash-completion/completions/
    mv -fv ./man/xh.1 ~/.local/share/man/man1/
    cd ..
    rm -rv ./xh
}

if ls *.AppImage* >/dev/null 2>&1 ; then
    update_appimages
    if [ $? -eq 0 ]; then
        rm -v *.AppImage*
    fi
fi

if ls eget*.tar.gz >/dev/null 2>&1 ; then
    update_eget
    if [ $? -eq 0 ]; then
        rm -v eget*.tar.gz
    fi
fi

if ls rmpc*.tar.gz >/dev/null 2>&1 ; then
    update_rmpc
    if [ $? -eq 0 ]; then
        rm -v rmpc*.tar.gz
    fi
fi

if ls satty*.tar.gz  >/dev/null 2>&1 ; then
    update_satty
    if [ $? -eq 0 ]; then
        rm -v satty*.tar.gz
    fi
fi

if ls rustic*.tag.gz  >/dev/null 2>&1 ; then
    update_rustic
    if [ $? -eq 0 ]; then
        rm -v rustic*.tar.gz
    fi
fi

if ls xh*.tar.gz  >/dev/null 2>&1 ; then
    update_xh
    if [ $? -eq 0 ]; then
        rm -v xh*.tar.gz
    fi
fi

cd "$cpwd"
