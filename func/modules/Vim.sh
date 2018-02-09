#########################################################################
# File Name: Vim.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Wed 24 Jan 2018 02:29:55 PM CST
# Version : 1.0
#########################################################################
#!/bin/bash

VIMDEPENDS="Lua Python3"

VIMCONFIGOPTION="--with-features=huge --enable-multibyte --enable-python3interp --with-python-config-dir=${PYTHON3LOCALLIBFULLPATH%/*} --enable-luainterp --with-lua-prefix=/usr/local/ --enable-gui --enable-cscope --prefix=/usr"
VIMMAKEOPTION="VIMRUNTIMEDIR=/usr/share/vim/vim80"


########################################

CheckVim(){
    local vimVersion=`vim --version |head -1 | awk ' {print $5}'`
    if [ -z ${vimVersion} ];then
        echo Vim version ${vimVersion}
        if [ ${vimVersion} != 8.0 ];then
            true
        else
            false
        fi
    else
        echo 'vim is not exist'
    fi
}


DownloadVim(){

    if [ -d ${SOURCEDIR}/vim ];then : ;else
        git clone https://github.com/vim/vim.git ${SOURCEDIR}/vim
    fi
}


InstallVim(){
    local vimPath=vim

    echo delwithVim ...
    cd ${SOURCEDIR}/${vimPath};./configure ${VIMCONFIGOPTION} -q
    make ${VIMMAKEOPTION} -s
    sudo make install -s
    echo done
}


ConfigureVim(){
    echo configuer Vim ...
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/lisider/.vim/master/config_vim.sh)"
    echo done
}
