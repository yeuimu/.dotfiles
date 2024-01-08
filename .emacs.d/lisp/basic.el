;;; basic.el --- basic config
;;; Commentary:
;;; Code:

; 自动折行
(setq truncate-lines nil)

; 自动补全括号
(electric-pair-mode t)

; 编程模式下，高亮括号对
(add-hook 'prog-mode-hook #'show-paren-mode) 

; 实时更新 Buffer
(global-auto-revert-mode t)

; 在 Mode line 上显示列号
(column-number-mode t)

; 显示相对行号
(setq display-line-numbers-type 'relative)

; 关闭启动 Emacs 时的欢迎界面
(setq inhibit-startup-message t)

; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook #'hs-minor-mode)

; 在 Window 显示行号
(global-display-line-numbers-mode 1)

; 打开 Buffer 历史记录保存
(savehist-mode 1)

; 关闭自动备份
(setq make-backup-files nil)
(provide 'basic)
