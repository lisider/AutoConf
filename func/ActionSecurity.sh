#########################################################################
# File Name: ../../func/ActionSecurity.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Wed 24 Jan 2018 04:08:18 PM CST
# Version : 1.0
#########################################################################
#!/bin/bash


NextState(){

    case $1 in 
        "Check")
            echo Download
            ;;
        "Download")
            echo Install
            ;;
         "Install")
            echo Configure
            ;;
         "Configure")
            echo Finish
            ;;
        *)
            echo " \$1:$1,NextState params wrong" 
            ;;
    esac

}

PrevState(){

    case $1 in 
        "Check")
            echo Origin
            ;;
        "Download")
            echo Check
            ;;
         "Install")
            echo Download
            ;;
         "Configure")
            echo Install
            ;;
        *)
            echo " \$1:$1,NextState params wrong" 
            ;;
    esac

}

DoActionRealSecurity(){
    $1$2
}

# DoActionRealSecurity(){
#     #Check Lua
#     #$1$2Security
#
#     #set $2OriginED=1
#     LuaOriginED=1
#     Python3OriginED=1
#     VimOriginED=1
#
#     echo $2$(PrevState $1)ED # 怎么组建一个变量 且 能 存储值
#
#     if [ $2$(PrevState $1)ED == 1 ];then
#         echo begin $2
#
#         $1$2
#         local ret=$?
#         if [ ${ret} == 0 ];then
#             $2$1ED=1
#         fi
#     fi
# }
#

