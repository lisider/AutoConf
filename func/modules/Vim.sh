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
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    if [ -z ${vimVersion} ];then
        echo 'vim is not exist'
    else
        local vimVersion=`vim --version |head -1 | awk ' {print $5}'`
        echo Vim version ${vimVersion}
        if [ ${vimVersion} != 8.0 ];then
            true
        else
            false
        fi
    fi
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}


DownloadVim(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"

    if [ -d ${SOURCEDIR}/vim ];then : ;else
        git clone https://github.com/vim/vim.git ${SOURCEDIR}/vim
    fi
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}


InstallVim(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    local vimPath=vim

    echo delwithVim ...
    cd ${SOURCEDIR}/${vimPath};./configure ${VIMCONFIGOPTION} -q
    make ${VIMMAKEOPTION} -s
    sudo make install -s
    echo done
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}


ConfigureVim(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    echo configuer Vim ...
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/lisider/.vim/master/config_vim.sh)"
    echo done
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}
