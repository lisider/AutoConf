#########################################################################
# File Name: ../func/optimization.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: Wed 24 Jan 2018 11:55:53 AM CST
# Version : 1.0
#########################################################################
#!/bin/bash


#ATTENTION : source 文件是与路径相关的
source ${BINPWD}/../conf/optimization.conf
#ATTENTION : 下面的函数都是与路径无关的

Timing(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    echo ${PASSWD} | sudo ntpdate ${CHINANATIONALTIMESERVICECENTER}
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}

SudoWithoutPasswd(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    echo ${PASSWD} | sudo sed -i "\$a $USER ALL=(ALL:ALL) NOPASSWD:ALL" /etc/sudoers 
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}

Samba(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
     sudo apt-get install samba -y

     echo 'sudo pdbedit -a -u ${USER}' > ${ROOTDIR}/todo.sh  # 这里面需要交互

     sudo chmod 666 /etc/samba/smb.conf

sudo cat >> /etc/samba/smb.conf <<ipipopopopqru23 
[homes]
     comment = Home Directories
     browseable = no 
     writeable = yes 
     create mode = 0664
     directory mode = 0775 
ipipopopopqru23

     sudo chmod 644 /etc/samba/smb.conf

     sudo /etc/init.d/smbd restart
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}


Vsftpd(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
     sudo apt-get install vsftpd -y
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}

Nfs(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    sudo  apt-get install nfs-kernel-server -y
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}

AutoNfs(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    sudo apt-get install autofs -y

    sudo chmod 666 /etc/auto.master
    sudo echo "/mnt/nfs /etc/auto.nfs" >> /etc/auto.master
    sudo chmod 644 /etc/auto.master
    

    sudo touch /etc/auto.nfs
    sudo chmod 666 /etc/auto.nfs
    sudo echo "dirname -rw,bg,soft,rsize=32768,wsize=32768 172.17.140.77:/home/pop" >> /etc/auto.nfs
    sudo chmod 644 /etc/auto.nfs


    sudo /etc/init.d/autofs restart
    echo "#you need to modify /etc/auto.nfs" >> ${ROOTDIR}/todo.sh
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}

Zsh(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
     sudo apt-get install zsh -y

     cd ${HOME}
     sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

     cd ${HOME}
     git clone https://github.com/powerline/fonts.git --depth=1
     cd fonts;./install.sh
     sudo fc-cache ${HOME}/.local -fv
     
     #修改主题
     sed '10 s/robbyrussell/agnoster/' ${HOME}/.zshrc -i
     
     echo -e "\033[32m you need to modify Graphic interface shell through Edit -> Profile Preferences -> Gernal \033[0m""]]"
     echo -e "\033[32m you can modify the last field of /etc/passwd to /usr/bin/zsh \033[0m""]]"
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"

}


Tmux(){
    echo -e "\033[32m Do $FUNCNAME ... Start\033[0m"
    sudo apt-get install tmux -y
    cd ${HOME}
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
    echo -e "\033[32m Do $FUNCNAME ... End\033[0m"
}

