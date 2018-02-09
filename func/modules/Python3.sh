#########################################################################
# File Name: Python.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Wed 24 Jan 2018 02:28:11 PM CST
# Version : 1.0
#########################################################################
#!/bin/bash


PYTHON3_TO_CONFIG=0
PYTHON3URL="https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz"
PYTHON3LOCALLIBFULLPATH=`locate libpython3 | grep -v $USER  |grep "\.so" |xargs ls -l |grep "^-" |grep -v loader |awk '{print $9}'`




CheckPython3(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    if [ -z ${python3Version} ];then
        echo 'Python3 is not exist'
    else
        local python3Version=`python3 --version|awk ' {print $2}'`
        echo python verison is ${python3Version}
        if [ ${python3Version%.*} != 3.6 ] && [ ${python3Version%.*} != 3.5 ];then
            ture
        else
            false
        fi
    fi
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}


DownloadPython3(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"

    local python3PackgeName=${PYTHON3URL##*/}
    if [ -f ${SOURCEDIR}/${python3PackgeName}  ];then : ;else
        wget -P ${SOURCEDIR} ${PYTHON3URL}
    fi
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}


InstallPython3(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"

    sudo apt-get install zlibc zlib1g-dev -y

    local python3PackgeName=${PYTHON3URL##*/}
    local python3Path=${python3PackgeName%.*}

    echo delwithPython ...
    tar -xzf ${SOURCEDIR}/${python3PackgeName} -C ${SOURCEDIR}
    cd ${SOURCEDIR}/${python3Path};./configure --prefix=/usr -q
    make -s
    sudo make install -s
    echo done
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}

ConfigurePython3(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    echo configure python3 ...
    echo done
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}
