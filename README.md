# stttt2003pk_csserver

## Introduction

* 国庆期间复习了一些以往写过的shell脚本，发觉现在的工作主要集中在python和变更，写shell脚本生疏了不少，想重操旧业撸点什么，恰逢近期看到**steamcmd**可以对经典的**cstrike1.6**进行部署和操作，并且用tmux进行管理，就拿cs1.6来练练手
* 另外在学习了各类多机运维工具像salt、木偶以及ansible之类的，ansible的剧本在做快速部署的时候有着极其容易编写的编排和api回调，顺带也就撸了个**ansible的剧本**进行相应的部署，后来证明还是挺好用的的
* 两天撸完了还有点时间，按照ansible的建议格式撸了个**cstrike1.6服务器操作的ansible**模块感觉还是蛮不错的，结合剧本让整个多机自动化运维规范化了很多
* 从中也能看到ansbile阻塞的很厉害的问题，毕竟轻量级的框架嘛

## [csserver_linux_server_shell](https://github.com/stttt2003pk/stttt2003pk.csserver/tree/master/csserver_linux_server_shell)

* [操作菜单](https://github.com/stttt2003pk/stttt2003pk.csserver/blob/master/csserver_linux_server_shell/core_opt.sh)

![](https://raw.github.com/stttt2003pk/stttt2003pk.csserver/master/screenshot/core.png)

* [安装](https://github.com/stttt2003pk/stttt2003pk.csserver/blob/master/csserver_linux_server_shell/functions/command_install.sh)

安装脚本会检查需要的依赖并且补全，并且会产生默认的配置文件，linux系统版本下面的游戏服务器都需要libstdc++的依赖

![](https://raw.github.com/stttt2003pk/stttt2003pk.csserver/master/screenshot/install.png)

* [变量内容](https://github.com/stttt2003pk/stttt2003pk.csserver/blob/master/csserver_linux_server_shell/var.sh)

* [通过tmux启动并且管理服务器](https://github.com/stttt2003pk/stttt2003pk.csserver/blob/master/csserver_linux_server_shell/functions/command_start.sh)
![](https://raw.github.com/stttt2003pk/stttt2003pk.csserver/master/screenshot/console.png)

## [stttt2003pk.installCsserver](https://github.com/stttt2003pk/stttt2003pk.csserver/tree/master/stttt2003pk.installCsserver)

* 包括系统依赖的部分，顺带将他写成了ansible的部署playbook

## [stttt2003pk.csserverController](https://github.com/stttt2003pk/stttt2003pk.csserver/tree/master/stttt2003pk.csserverController)

* 这部分将操作多台csserver的内容编写成了ansible的[lib模块](https://github.com/stttt2003pk/stttt2003pk.csserver/blob/master/stttt2003pk.csserverController/roles/base.csserverController/library/csserverController/csserver_controller)
* 模块是按照ansible的建议规范格式编写的，并且在[playbook](https://github.com/stttt2003pk/stttt2003pk.csserver/blob/master/stttt2003pk.csserverController/roles/base.csserverController/tasks/start_cstrike_server.yml)当中进行调用