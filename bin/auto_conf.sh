##################################################

source ../conf/base.conf

##################################################

source ${BINPWD}/../func/optimization.sh
source ${BINPWD}/../func/recipes.sh

for module in ${SOURCE}
do
    source ${BINPWD}/../func/modules/${module}.sh
done


source ${BINPWD}/../func/ActionSecurity.sh

##################################################

PackDownload(){
    cd ${SOURCEDIR}

    if [ -f source.tar.gz  ];then
        rm source.tar.gz
    fi

    tar zcvf source.tar.gz ${SOURCEDIR}
}


##################################################


#每个资源的名字 是 $var ,参见 DoActionsReal
#每个资源的动作有四个 ,参见 DoAction

#特定资源的动作 函数名 为 名字与动作的连接 参见 DoAction

DoActionsReal(){
    for var in ${SOURCE}
    do
        DoActionRealSecurity $1 ${var}
        #echo DoActionRealSecurity $1 ${var}
        #$1${var}Security
    done
}



DoAction(){

    case $1 in 
        [Cc][Hh][Ee][Cc][Kk])
            DoActionsReal Check
            ;;
        [Dd][Oo][Ww][Nn][Ll][Oo][Aa][Dd])
            DoActionsReal Download
            ;;
        [Ii][Nn][Ss][Tt][Aa][Ll][Ll])
            DoActionsReal Install
            ;;
        [Cc][Oo][Nn][Ff][Ii][Gg][Uu][Rr][Ee])
            DoActionsReal Configure
            ;;
        *)
            echo " \$1:$1,DoAction params wrong" 
            ;;
    esac

}

##################################################

OptimizationSystem(){
   # Timing
    SudoWithoutPasswd
    Samba
    vsftpd
    Nfs
    AutoNfs
    Zsh
    Tmux
}

DoActions(){
    DoAction check
    DoAction download

    PackDownload

    DoAction install
    DoAction Configure
}

CreateSourceDirectory(){

    if [ -d ${SOURCEDIR} ];then : ;else
        mkdir ${SOURCEDIR} -p
    fi
}

Recipes(){
    echo Recipes...
    Sort
    echo ${SOURCE}
    echo Recipes... done
}

Main(){
    OptimizationSystem
    #################

    CreateSourceDirectory
    Recipes
    DoActions
}

Main $*
