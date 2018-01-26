#########################################################################
# File Name: test.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Thu 25 Jan 2018 10:38:57 AM CST
# Version : 1.0
#########################################################################
#!/bin/bash






SOURCECOUNT=`echo $SOURCE | sed 's/ /\n/g' |wc -l`
DEPENDSCOUNT=${#DEPENDS[@]}


TheLast(){
    #$1 SOURCE #注意,不是 $SOURCE
    #$2 :$N 待检查的数据
    local rightVar=
    local rightNum=
    #local tmpVar=$1
     
    for var in $(echo $* | sed 's/^\w*//')  #被排序的数据
    do
        num=0
        for var2 in ${SOURCE} #所有的数据
        do
            num=`expr $num + 1`
            if [ ${var} == ${var2}  ];then
                #rightNum=`echo ${rightVar#*:}` #去掉空格
                #echo rightNum :${rightNum}
                if [  -z ${rightVar}  ];then #第一次赋值
                    rightVar="$var:$num"
                    break 1
                else
                    rightNum=`echo ${rightVar#*:}`
                    #echo rightNum:${rightNum}

                    if [ ${num} -gt ${rightNum}  ];then #第N次赋值
                        rightVar="$var:$num"
                        break 1
                    fi

                fi
            fi
        done
    done


    echo ${rightVar%%:*}
}


AddBack(){
    #   $1 待移动的值
    #   $2 相对对标
    #   $3 作用的字符串
    #echo ${tmpSource} | awk  '{printf "%s %s %s\n",$2,$3,$1}'
    #echo $1
    #echo $2

    echo ${SOURCE} | sed 's/ /\n/g' |sed -e "/$1/ h; /$2/ G" | xargs echo  | sed "s/$1 //"

}

Sort(){
    local tmpVar=

    for var in `seq 0 $(expr ${DEPENDSCOUNT} - 1)`
    do
        #echo ---------------------------
        #echo ${SOURCE}
        tmpVar=${DEPENDS[$var]}
        leftVar=${DEPENDS[$var]%%:*}
        rightVar=${DEPENDS[$var]#*:}
        theLastVar=$(TheLast SOURCE ${rightVar})
        #echo theLastVar:${theLastVar}
        SOURCE=$(AddBack ${leftVar} ${theLastVar} )
        #echo ${SOURCE}
        #echo ---------------------------
        #echo ---------------------------
        #echo ---------------------------

    done
}

