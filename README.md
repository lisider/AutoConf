## 是什么

```c
这个工程的目标是配置一个新装的linux发行版(适用于ubuntu)
采用脚本和一些已经存在的git工程来实现配置
```

## 怎么使用这个工程

- 在线使用
```c

方法1
bash -c "$(curl -fsSL https://raw.githubusercontent.com/lisider/AutoConf/master/bin/download_runconf.sh)"

方法2
bash -c "$(wget https://raw.githubusercontent.com/lisider/AutoConf/master/bin/download_runconf.sh -O -)"

```

- 下载使用

```c
在有网络的机器中下载东西,只需要执行

sh -c "$(curl -fsSL https://raw.githubusercontent.com/lisider/AutoConf/master/bin/download_runconf.sh)"

将下载的东西(auto_conf文件夹)打包复制到没有网络的机器中
然后解压并执行


```

## 目前工程中配置了什么

```c


     sudo 免密码

     vim 及其插件

          为了安装vim插件 装了 lua 及 python3

     常见服务器
          samba nfs ftp  ssh

```

## 执行的流程

```c

0/   非软件安装部分

1/
     解决依赖
2/
     依次检测 依次下载 打包  依次安装 依次 配置


注意:目前检测 对下载没有影响
```

---

## 这个工程的架构

```c

工程管理的是软件的检查,下载,安装,配置 及 不属于此类的 一些环境配置


软件模块
     每一个软件的 检查,下载,安装,配置 都在 func/modules/
     例如 func/modules/Lua.sh
     func/modules/ 中的文件可以自己添加,但函数名需类似

     在 func/modules/Xxx.sh 中你可以使用一些变量,例如 SOURCEDIR

软件模块的依赖
     你需要考虑依赖,并写入conf/base.conf 中的 DEPENDS 变量,配置方式见 conf/base.conf

```

---


##这个工程有什么问题

```c

脆弱,很容易就死了

不能检测 本地的 lua 和 python 是否能够支持 vim ,强行安装 lua 和 python


凌乱

```


---

## 这个工程的目标
```c

配置 linux 发行版

配置内容

     自动校时 crontab

     配置常见服务器

     安装vim及其插件

     能够读取配置文件,实现运行时配置 rc

```
