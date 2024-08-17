我的配置文件分别有: 

Bspwm 桌面环境：
- bspwm: 窗口管理器
- sxhkd: 快捷键管理器
- kitty: 终端
- feh: 桌面壁纸
- x: x11 配置
- polybar: 状态栏
- rofi: 程序启动器
- fontconfig: 字体
- picom: 混合器

其他配置:
- zsh: shell
- nvim, .emacas.d: 编辑器
- mpd, ncmpcpp: 音乐播放器
- tmux: 终端分屏

安装配置文件，进入当前仓库，赋予 install 执行权限，然后运行

```bash
./install.sh
```

之后配置文件将以软连接形式出现在它该出现的位置
