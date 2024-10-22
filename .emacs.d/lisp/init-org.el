;;; org-config --- org plugin config
;;; Commentary:
;;; Code:

					; Appoint path to org dir and gtd file
(setq org-path "~/Documents/allinone/Org/")
(setq gtd-path (concat org-path "gtd.org"))
(setq note-path (concat org-path "notes"))

(use-package org
  :ensure t
  :init (setq evil-want-C-i-jump nil)
  :config
  ;; General
  (setq org-agenda-files (list gtd-path)
	org-agenda-time-grid (quote ((daily today require-timed)
                                     (300
                                      600
                                      900
                                      1200
                                      1500
                                      1800
                                      2100
                                      2400)
                                     "......"
                                     "-----------------------------------------------------"
                                     ))
	org-agenda-custom-commands '(("u" "Unscheduled TODOs"
				      ((tags-todo "-SCHEDULED/!TODO"
						  ((org-agenda-overriding-header "Unscheduled TODOs"))))))
	org-capture-templates '(
				("i" "inbox" entry (file+headline gtd-path "💡 收集箱 Inbox")
				 "** %^{headline} \n:PROPERTIES:\n:CREATED: %U\n:END:\n \n %?" :empty-lines 1)
				("t" "tasks" entry (file+headline gtd-path "🚀 任务清单 Tasks")
				 "** %^{headline} \n:PROPERTIES:\n:CREATED: %U\n:END:\n \n %?" :empty-lines 1)
				("p" "projects" entry (file+headline gtd-path "📝 项目清单 Projects")
				 "** %^{headline} \n:PROPERTIES:\n:CREATED: %U\n:END:\n \n %?" :empty-lines 1)
				("v" "review" entry (file+headline gtd-path "Review")
				 "** %^{headline} \n:PROPERTIES:\n:CREATED: %U\n:END:\n \n %?" :empty-lines 1)
				("w" "wait" entry (file+headline gtd-path "⚓ 等待清单 Waiting")
				 "** %^{headline} \n:PROPERTIES:\n:CREATED: %U\n:END:\n \n %?" :empty-lines 1)
				("r" "references" entry (file+headline gtd-path "🗃️ 参考资料 References")
				 "** %^{headline} \n:PROPERTIES:\n:CREATED: %U\n:END:\n \n %?" :empty-lines 1)
				("m" "maybe" entry (file+headline gtd-path "☁️ 可能清单 Maybe")
				 "** %^{headline} \n:PROPERTIES:\n:CREATED: %U\n:END:\n \n %?" :empty-lines 1)
				)
	org-refile-targets '(
                             ( gtd-path :maxlevel . 2)
			     )
	org-refile-use-outline-path 'file
	org-outline-path-complete-in-steps nil
	org-refile-allow-creating-parent-nodes 'confirm
	org-todo-keywords '((sequence "TODO(t/!)" "DOING(i/!)" "SCHEDLED(s/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)"))
	org-todo-keyword-faces '(
				 ("TODO" . (:foreground "#e84545" :weight bold))
				 ("DOING" . (:foreground "#1fab89" :weight bold))
         ("DONE" . (:foreground "#4C566A" :weight bold))
				 ("CANCEL" . (:foreground "#4C566A" :weight bold))
				 ("SCHEDLED" . (:foreground "#6495ED" :weight bold)))
	org-enforce-todo-dependencies t
	)

  ;;; Shortcutkey setting

  ;; Leader
  (evil-define-key '(normal visual motion) org-mode-map (kbd "SPC") nil) 
  (evil-set-leader '(normal insert motion) (kbd "SPC"))

  ;;; Basic opt
  ;; Cycling org-cycle
  (evil-define-key 'normal org-mode-map
    (kbd "TAB") 'org-cycle)
					; Execute Command
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>g;") 'evil-ex) 
					; open agency
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>ga") 'org-agenda)
					; set property
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>gP") 'org-set-property)
					;  code block
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>gc") 'org--src-block)
					; tag view
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>gt") 'org-tags-view)
					; Headline
					; move up headline
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>gK") 'org-move-subtree-up)
					; move down headline
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>gJ") 'org-move-subtree-down)
					; Capture
					; open capture
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>gp") 'org-capture)
					; Theme
					; switch one
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>gg") 'toggle-modus-themes)

  ;; Refile
					; refile to targets
  (evil-define-key 'normal org-mode-map
    (kbd "<leader>rr") 'org-refile)
					; refile to todo.org
  (evil-define-key 'normal org-mode-map
    (kbd "<leader>rt") 'he/org-refile-to-datetree)

  ;; Clock
					; start
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>cs") 'org-clock-in)
					; end
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>ce") 'org-clock-out)
					; cancel
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>cc") 'org-clock-cancel)
					; goto
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>cg") 'org-clock-goto)
					; report
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>cr") 'org-clock-report)

  ;; Other
					; Dict
					; search word
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>ew") 'fanyi-dwim2)
					; search word
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>et") 'modus-themes-toggle)

  ;; Project
					; find file
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>pf") 'project-find-file)
					; switch project
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>pw") 'project-switch-project)

  ;; Modes
					; Display line numbers
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>ml") 'toggle-relative-line-numbers)

  )

(defun he/org-read-datetree-date (d)
  (let ((dtmp (nthcdr 3 (parse-time-string d))))
    (list (cadr dtmp) (car dtmp) (caddr dtmp))))

;; refile 一个 entry 到 gtd.org 文件
					; (defun he/org-refile-to-datetree (&optional bfn)
					;   (interactive)
					;   (require 'org-datetree)
					;   (let* ((bfn (or bfn (find-file-noselect (expand-file-name "~/Documents/org/todo.org"))))
					; 	 (datetree-date (he/org-read-datetree-date (org-read-date t nil))))
					;     (org-refile nil nil (list nil (buffer-file-name bfn) nil
					; 			      (with-current-buffer bfn
					; 				(save-excursion
					; 				  (org-datetree-find-date-create datetree-date)
					; 				  (point)))))))

;; Swicher betwent relative displaying line numbers and absolute one
(defun toggle-relative-line-numbers ()
  "Toggle between relative line numbers and no line numbers."
  (interactive)
  (if (eq display-line-numbers 'relative)
      (progn
        (setq display-line-numbers nil)
        (message "Line numbers turned off."))
    (setq display-line-numbers 'relative)
    (message "Switched to relative line numbers."))
  ;; 刷新行号显示
  (if display-line-numbers
      (display-line-numbers-mode 1)
    (display-line-numbers-mode -1)))

;; Insert Code Block
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "Scheme" "sqlite" "lua" "rust")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(defun my/org-add-created-timestamp ()
  "在 headline 下自动添加创建时间"
  (org-set-property "CREATED" (format-time-string "[%Y-%m-%d %a %H:%M]")))

(add-hook 'org-insert-heading-hook 'my/org-add-created-timestamp)

;; Theme
(defun toggle-modus-themes ()
  ;; "Toggle between `modus-operandi` and `modus-vivendi` themes."
  (interactive)
  (if (eq (car custom-enabled-themes) 'modus-operandi)
      (load-theme 'modus-vivendi)
    (load-theme 'modus-operandi)))
(defun my-auto-theme-adapter ()
  ;; "Automatically switch between `modus-operandi` and `modus-vivendi` based on time.
  ;; Switches to `modus-operandi` between 6 PM and 7 AM, and `modus-vivendi` otherwise."
  (let ((hour (string-to-number (format-time-string "%H"))))
    (if (or (>= hour 18) (< hour 7))
        (load-theme 'modus-vivendi)   ;; 启用 `modus-operandi` 从 18:00 到 7:00
      (load-theme 'modus-operandi))))   ;; 否则启用 `modus-vivendi`
;; 定时器每隔 5 分钟检查一次时间并切换主题
;;(run-at-time "00:00" 300 'my-auto-theme-adapter)
;; Emacs 启动时立即检查一次时间并设置合适的主题
(my-auto-theme-adapter)

;; org-roam
(use-package org-roam
  :ensure t ;; 自动安装
  :custom
  (org-roam-directory note-path) ;; 默认笔记目录, 提前手动创建好
  (org-roam-dailies-directory "daily/") ;; 默认日记目录, 上一目录的相对路径
  (org-roam-db-gc-threshold most-positive-fixnum) ;; 提高性能
  :bind (("C-c n f" . org-roam-node-find)
         ;; 如果你的中文输入法会拦截非 ctrl 开头的快捷键, 也可考虑类似如下的设置
         ;; ("C-c C-n C-f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n l" . org-roam-buffer-toggle) ;; 显示后链窗口
         ("C-c n u" . org-roam-ui-mode)) ;; 浏览器中可视化
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map) ;; 日记菜单
  :config
  (require 'org-roam-dailies)  ;; 启用日记功能
  (org-roam-db-autosync-mode)) ;; 启动时自动同步数据库

(use-package org-roam-ui
  :ensure t ;; 自动安装
  :after org-roam
  :custom
  (org-roam-ui-sync-theme t) ;; 同步 Emacs 主题
  (org-roam-ui-follow t) ;; 笔记节点跟随
  (org-roam-ui-update-on-save t))

;; 像纸一样阅读 org 文档
(use-package visual-fill-column
  :ensure t
  :after org
  :custom
  (visual-fill-column-width 100)   ;; 设置宽度
  (visual-fill-column-center-text t)  ;; 文本居中
  (setq org-cycle-separator-lines 1)
  :hook ((org-mode . visual-fill-column-mode)
         (org-mode . visual-line-mode)
         (org-mode . org-indent-mode)
         (org-mode . word-wrap-whitespace-mode)))

;; Basic
(setq
 org-startup-indented t
 org-src-tab-acts-natively t
 org-hide-emphasis-markers t
 org-fontify-done-headline t
 org-hide-leading-stars t
 org-pretty-entities t
 org-agenda-show-inherited-tags nil
 )

;; Modern Org Mode theme
(use-package org-modern
  :ensure t
  :custom
  ;; (setq org-modern-table-vertical 2)
  (org-modern-tag nil)
  (org-modern-star 'replace)
  (org-modern-checkbox
   '((?X . "󰄵")
     (?- . "󰄗")
     (?\s . "󰄱")))
  (org-modern-todo nil)
  (org-modern-priority
    (quote ((?A . "󰯭")
            (?B . "󰯰")
            (?C . "󰯳"))))
  ;; (org-modern-block-name nil)
  ;; (org-modern-keyword nil)
  ;; (org-modern-timestamp nil)
  ;; (org-modern-block-fringe nil)
  :config (global-org-modern-mode 1))

;; ripgrep
(use-package rg
  :ensure t
  :config
  (rg-enable-default-bindings))

(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)

(find-file "~/Documents/allinone/Org/gtd.org")

(provide 'init-org)
;;; init-org.el ends here
