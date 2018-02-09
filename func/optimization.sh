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
    echo ${PASSWD} | sudo ntpdate ${CHINANATIONALTIMESERVICECENTER}
}

SudoWithoutPasswd(){
    echo ${PASSWD} | sudo sed -i "\$a $USER ALL=(ALL:ALL) NOPASSWD:ALL" /etc/sudoers 
}

Samba(){
     sudo apt-get install samba -y

     echo 'sudo pdbedit -a -u ${USER}' > ~/todo.sh  # 这里面需要交互

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
}


Vsftpd(){
     sudo apt-get install vsftpd -y
}

Nfs(){
    sudo  apt-get install nfs-kernel-server -y
}

AutoNfs(){
    sudo apt-get install autofs -y

    echo -----------------
    sudo chmod 666 /etc/auto.master
    sudo echo "/mnt/nfs /etc/auto.nfs" >> /etc/auto.master
    sudo chmod 644 /etc/auto.master
    
    echo -----------------2

    sudo touch /etc/auto.nfs
    sudo chmod 666 /etc/auto.nfs
    sudo echo "dirname -rw,bg,soft,rsize=32768,wsize=32768 172.17.140.77:/home/pop" >> /etc/auto.nfs
    sudo chmod 644 /etc/auto.nfs

    echo -----------------3

    sudo /etc/init.d/autofs restart
    echo -e "\033[32m you need to modify /etc/auto.nfs \033[0m""]]"
}

Zsh(){
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

}


Tmux(){
    sudo apt-get install tmux -y
    cd ${HOME}
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
}

