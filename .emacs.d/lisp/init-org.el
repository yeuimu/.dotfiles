;;; org-config --- org plugin config
;;; Commentary:
;;; Code:

(use-package org
  :ensure t
  :init (setq evil-want-C-i-jump nil)
  :config
  ;;; Config
  ;; General
  ; auto linefeed on org mode
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

  (setq org-agenda-files '("~/Dropbox/orgmode/todo.org"
                           "~/Dropbox/orgmode/repeat.org"
                           "~/Dropbox/orgmode/inbox.org")
        org-capture-templates '(
                                ("i" "inbox" entry (file "~/Dropbox/orgmode/inbox.org")
                                 "* %^{headline} %^g \n\n%? \n\n%U" :empty-lines 1)
                                ("t" "todo" entry (file+datetree "~/Documents/orgmode/todo.org")
                                 "* TODO [#B] %U %i%?" :empty-lines 1)
                                ("s" "someday" entry (file+headline "~/Documents/orgmode/someday.org" "someday")
                                 "* [#C] %U %i%?" :empty-lines 1)
                                ("r" "reference" entry (file+headline "~/Documents/orgmode/reference.org" "reference")
                                 "* [#C] %U %i%?" :empty-lines 1)
                                ("e" "repeat" entry (file+headline "~/Documents/orgmode/repeat.org" "repeat")
                                 "* [#C] %U %i%?" :empty-lines 1))
        org-refile-targets '(
                             ("~/Documents/orgmode/inbox.org" :level . 1)
			                       ("~/Documents/orgmode/someday.org" :level . 1)
			                       ("~/Documents/orgmode/reference.org" :level . 1)
			                       ;("~/Documents/orgmode/todo.org" :maxlevel . 3)
			                       ("~/Documents/orgmode/repeat.org" :level . 1))
        org-todo-keywords '((sequence "TODO(t/!)" "DOING(i/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)"))
        org-todo-keyword-faces '(
                                 ("DOING" . (:foreground "#eec78e" :weight bold))
                                 ("CANCEL" . (:foreground "#4C566A" :weight bold)))
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
    (kbd "<leader>ga") 'org-agenda-list)
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

  ;; Project
  ; find file
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>pf") 'project-find-file)
  ; switch project
  (evil-define-key '(normal ) org-mode-map
    (kbd "<leader>pw") 'project-switch-project)
)
(require 'org-utility)
(require 'org-ui)
(provide 'init-org)
;;; init-org.el ends here
