#########################################################################
# File Name: Vim.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Wed 24 Jan 2018 02:29:55 PM CST
# Version : 1.0
#########################################################################
#!/bin/bash

VIMDEPENDS="Lua Python3"

VIMCONFIGOPTION="--with-features=huge --enable-multibyte --enable-python3interp --with-python-config-dir=${PYTHON3LOCALLIBFULLPATH%/*} --enable-luainterp --enable-gui --enable-cscope --prefix=/usr"
VIMMAKEOPTION="VIMRUNTIMEDIR=/usr/share/vim/vim80"


########################################

CheckVim(){
    local vimVersion=`vim --version |head -1 | awk ' {print $5}'`
    if [ ${vimVersion} != 8.0 ];then
        true
    else
        false
    fi
    echo Vim version ${vimVersion}
}


DownloadVim(){
    
    if [ -d ${SOURCEDIR}/vim ];then : ;else
        git clone https://github.com/vim/vim.git ${SOURCEDIR}/vim
    fi
}


InstallVim(){
    local vimPath=vim

    cd ${SOURCEDIR}/${vimPath};./configure ${VIMCONFIGOPTION}
    make ${VIMMAKEOPTION}
    #sudo make install
}


ConfigureVim(){
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/lisider/.vim/master/config_vim.sh)"
}
