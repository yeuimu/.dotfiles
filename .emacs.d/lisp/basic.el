;;; basic.el --- basic config
;;; Commentary:
;;; Code:

; start
(setq initial-major-mode 'org-mode)
(defun open-project-list-if-no-file ()
  "如果没有打开特定文件，则打开项目列表。"
  (unless (cl-some #'buffer-file-name (buffer-list))
    (counsel-projectile-switch-project)))

(add-hook 'emacs-startup-hook 'open-project-list-if-no-file)

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

; 不创建临时文件
;; Don't generate backups or lockfiles. While auto-save maintains a copy so long
;; as a buffer is unsaved, backups create copies once, when the file is first
;; written, and never again until it is killed and reopened. This is better
;; suited to version control, and I don't want world-readable copies of
;; potentially sensitive material floating around our filesystem.
(setq create-lockfiles nil
      make-backup-files nil
      ;; But in case the user does enable it, some sensible defaults:
      version-control t     ; number each backup file
      backup-by-copying t   ; instead of renaming current file (clobbers links)
      delete-old-versions t ; clean up after itself
      kept-old-versions 5
      kept-new-versions 5)
;; But turn on auto-save, so we have a fallback in case of crashes or lost data.
;; Use `recover-file' or `recover-session' to recover them.
(setq auto-save-default t
      ;; Don't auto-disable auto-save after deleting big chunks. This defeats
      ;; the purpose of a failsafe. This adds the risk of losing the data we
      ;; just deleted, but I believe that's VCS's jurisdiction, not ours.
      auto-save-include-big-deletions t
      auto-save-file-name-transforms
      (list (list "\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'"
                  ;; Prefix tramp autosaves to prevent conflicts with local ones
                  (concat auto-save-list-file-prefix "tramp-\\2") t)
            (list ".*" auto-save-list-file-prefix t)))

;; disable menu bar, tool-bar
(push '(menu-bar-lines . 0)   default-frame-alist)
(push '(tool-bar-lines . 0)   default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Keeping buffers automatically up-to-date.
(require 'autorevert)
(global-auto-revert-mode 1)
(setq auto-revert-verbose t
      auto-revert-use-notify nil
      auto-revert-stop-on-user-input nil)

;; oh my freaking god, just take my damn answer
(defalias 'yes-or-no-p 'y-or-n-p)

(defun he/org-read-datetree-date (d)
  (let ((dtmp (nthcdr 3 (parse-time-string d))))
    (list (cadr dtmp) (car dtmp) (caddr dtmp))))

;; refile 一个 entry 到 gtd.org 文件
(defun he/org-refile-to-datetree (&optional bfn)
  (interactive)
  (require 'org-datetree)
  (let* ((bfn (or bfn (find-file-noselect (expand-file-name "~/orgmode/todo.org"))))
     (datetree-date (he/org-read-datetree-date (org-read-date t nil))))
    (org-refile nil nil (list nil (buffer-file-name bfn) nil
                  (with-current-buffer bfn
                (save-excursion
                  (org-datetree-find-date-create datetree-date)
                  (point)))))))

(provide 'basic)
