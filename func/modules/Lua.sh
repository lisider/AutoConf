#########################################################################
# File Name: Lua.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Wed 24 Jan 2018 02:24:15 PM CST
# Version : 1.0
#########################################################################
#!/bin/bash


LUAURL="https://www.lua.org/ftp/lua-5.3.4.tar.gz"


CheckLua(){
    local luaVersion=`lua -v|awk ' {print $2}'`
    if [ -z $(which lua) ];then
        echo 'lua is not exist'
    else
        LUACHECKED=1
        echo lua version is ${luaVersion}
    fi
}


DownloadLua(){

    local luaPackgeName=${LUAURL##*/}
    if [ -f ${SOURCEDIR}/${luaPackgeName} ];then : ;else
        wget -P ${SOURCEDIR} ${LUAURL}
    fi
}


InstallLua(){
    sudo apt-get install libreadline6-dev libreadline-dev -y #lua 需要的

    local luaPackgeName=${LUAURL##*/}
    echo luaPackgeName :${luaPackgeName} #lua-5.3.4.tar.gz

    #local luaPath="lua-5.3.4"
    local luaPath=${luaPackgeName%.tar.gz}
    #echo luaPath :${luaPath}
    echo delwithLua ...
    
    tar -xzf ${SOURCEDIR}/${luaPackgeName}  -C ${SOURCEDIR}
    make linux -C${SOURCEDIR}/${luaPath} -s
    sudo make install -C${SOURCEDIR}/${luaPath} -s
    echo done
}


ConfigureLua(){
    echo configure lua ...
    echo done
}

