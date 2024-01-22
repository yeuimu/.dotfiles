;;; org-config --- org plugin config
;;; Commentary:
;;; Code:

(use-package org
  :ensure t
  :config
  ;;; Config

  ;; General
  ; auto linefeed on org mode
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
  ; agency file
  (setq org-agenda-files '("~/Projects/orgmode/todo.org"
			   "~/Projects/orgmode/repeat.org"))

  ;; Capture templates
  (setq org-capture-templates '(
				("i" "inbox" entry (file+headline "~/Projects/orgmode/inbox.org" "inbox")
				 "* [#C] %U %i%?" :empty-lines 1)
				("t" "todo" entry (file+datetree "~/Projects/orgmode/todo.org")
				 "* TODO [#B] %U %i%?" :empty-lines 1)
				("s" "someday" entry (file+headline "~/Projects/orgmode/someday.org" "someday")
				 "* [#C] %U %i%?" :empty-lines 1)
				("r" "reference" entry (file+headline "~/Projects/orgmode/reference.org" "reference")
				 "* [#C] %U %i%?" :empty-lines 1)
				("e" "repeat" entry (file+headline "~/Projects/orgmode/repeat.org" "repeat")
				 "* [#C] %U %i%?" :empty-lines 1)
				))
   ; Refile targets
   (setq org-refile-targets '(
			     ("~/Projects/orgmode/inbox.org" :level . 1)
			     ("~/Projects/orgmode/someday.org" :level . 1)
			     ("~/Projects/orgmode/reference.org" :level . 1)
			     ;("~/Projects/orgmode/todo.org" :maxlevel . 3)
			     ("~/Projects/orgmode/repeat.org" :level . 1)
			     ))
  
  ;; Todo
  ; todo state
  (setq org-todo-keywords '((sequence "TODO(t/!)" "DOING(i/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)")))
  ; todo state color
  (setq org-todo-keyword-faces '(
				 ("DOING" . (:foreground "#eec78e" :weight bold))
				 ("CANCEL" . (:foreground "#4C566A" :weight bold))))
  ; todo dependencies
  (setq org-enforce-todo-dependencies t)

  ;;; Shortcutkey setting

  ;; General
  ; clear space binding on normal visual motion
  (evil-define-key '(normal visual motion) org-mode-map (kbd "SPC") nil) 
  ; leader
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'insert (kbd "TAB"))
  ; promote level
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>gh") 'org-metaleft)
  ; demote level
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>gl") 'org-metaright)
  ; C-c C-c key mapping
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>gc") 'org-ctrl-c-ctrl-c)
  ; set property
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>gp") 'org-set-property)

  ;; Quit
  ; switch betwen isert and normal
  (evil-define-key 'insert org-mode-map          
    (kbd "<leader>qq") 'evil-force-normal-state)
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>qw") '(lambda ()
			  (interactive)
			  (save-buffer)
			  (if (eq (length (delq nil (mapcar 'buffer-file-name (buffer-list)))) 1)
			      (save-buffers-kill-emacs)
			    (kill-this-buffer))))

  ;; Headline
  ; outline cycling
  (evil-define-key 'normal org-mode-map
    (kbd "<leader>f") 'org-cycle)
  ; open agency
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>a") 'org-agenda-list)
  ; make headline
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>H") 'org-meta-return)
  ; move up headline
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>K") 'org-move-subtree-up)
  ; move down headline
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>J") 'org-move-subtree-down)

  ;; Todo  
  ; select task state
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>t") 'org-todo)

  ;; Checkbox
  ; insert checkbox
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>i") 'org-insert-todo-heading)

  ;; Date
  ; insert time stamp
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>.") 'org-time-stamp)
  ; insert due date
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>d") 'org-deadline)
  ; insert schedule date
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>s") 'org-schedule)

  ;; Capture
  ; open capture
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>p") 'org-capture)

  ;; Refile
  ; refile to targets
  (evil-define-key 'normal org-mode-map
    (kbd "<leader>rr") 'org-refile)
  ; refile to todo.org
  (evil-define-key 'normal org-mode-map
    (kbd "<leader>rt") 'he/org-refile-to-datetree)

  ;; Clock
  ; start
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>cs") 'org-clock-in)
  ; end
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>ce") 'org-clock-out)
  ; cancel
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>cc") 'org-clock-cancel)
  ; goto
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>cg") 'org-clock-goto)
  ; report
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>cr") 'org-clock-report)

  ;; Dict
  ; search word
  (evil-define-key '(normal insert) org-mode-map
    (kbd "<leader>w") 'fanyi-dwim2)

)
(provide 'org-config)
