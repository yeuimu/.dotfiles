;;; org-config --- org plugin config
;;; Commentary:
;;; Code:

(use-package org
  :ensure t
  :config

  ;;; Config

  ;; General
  ; auto linefeed on org mode
  ;(setq truncate-lines nil)
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
  ; agency file
  (setq org-agenda-files '("~/orgmode/"))
  
  ;; Todo
  ; todo state
  (setq org-todo-keywords '((sequence "TODO(t!)" "DOING(i/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)")))
  ; todo state color
  (setq org-todo-keyword-faces '(
				 ("DOING" . (:foreground "#eec78e" :weight bold))
				 ("CANCEL" . (:foreground "#4C566A" :weight bold))))
  ; todo dependencies
  (setq org-enforce-todo-dependencies t)

  ;;; Shortcutkey setting

  ;; General
  ; promote level
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-h") 'org-metaleft)
  ; demote level
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-l") 'org-metaright)
  ; C-c C-c key mapping
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-c") 'org-ctrl-c-ctrl-c)
  
  ;; Headline
  ; outline cycling
  (evil-define-key 'normal org-mode-map
    (kbd "f") 'org-cycle)
  ; open agency
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-a") 'org-agenda-list)
  ; make headline
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-H") 'org-meta-return)
  ; move up headline
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-K") 'org-move-subtree-up)
  ; move down headline
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-J") 'org-move-subtree-down)

  ;; Todo  
  ; select task state
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-t") 'org-todo)
  ; insert checkbox
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-i") 'org-insert-todo-heading)

  ;; Date
  ; insert time stamp
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-.") 'org-time-stamp)
  ; insert due date
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-d") 'org-deadline)
  ; insert schedule date
  (evil-define-key '(normal insert) org-mode-map
    (kbd "M-s") 'org-schedule)
  ; after done, insert time stamp
  (setq org-log-done 'time)
) 

(provide 'org-config)
