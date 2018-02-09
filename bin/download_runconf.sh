#########################################################################
# File Name: download_runconf.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: 2018年01月23日 星期二 21时58分03秒
# Version : 1.0
#########################################################################
#!/bin/bash

sudo apt-get install git -y
git clone https://github.com/lisider/AutoConf.git ~/AutoConf
cd ~/AutoConf/bin
source auto_conf.sh

