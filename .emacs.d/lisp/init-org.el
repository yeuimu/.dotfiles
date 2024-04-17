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

  (setq org-agenda-files '("~/Dropbox/org/todo.org"
                           "~/Dropbox/org/inbox.org")
        org-capture-templates '(
                                ("i" "inbox" entry (file "~/Dropbox/org/inbox.org")
                                 "* %^{headline} %^g \n\n%? \n\n%U" :empty-lines 1)
                                ("t" "todo" entry (file+datetree "~/Dropbox/org/todo.org")
                                 "* TODO [#B] %U %i%?" :empty-lines 1)
                                ("s" "someday" entry (file+headline "~/Dropbox/org/maybe.org" "someday")
                                 "* [#C] %U %i%?" :empty-lines 1)
                                ("r" "reference" entry (file+headline "~/Dropbox/org/reference.org" "reference")
                                 "* [#C] %U %i%?" :empty-lines 1)
                                ("e" "repeat" entry (file+headline "~/Dropbox/org/repeat.org" "repeat")
                                 "* [#C] %U %i%?" :empty-lines 1))
        org-refile-targets '(
                             ("~/Dropbox/org/inbox.org" :maxlevel . 2)
			                       ("~/Dropbox/org/maybe.org" :maxlevel . 9)
			                       ("~/Dropbox/org/reference.org" :maxlevel . 9)
			                       ("~/Dropbox/org/todo.org" :maxlevel . 9)
			                       ("~/Dropbox/org/project.org" :maxlevel . 9)
			                       )
        org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil
        org-refile-allow-creating-parent-nodes 'confirm
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

(defun he/org-read-datetree-date (d)
  (let ((dtmp (nthcdr 3 (parse-time-string d))))
    (list (cadr dtmp) (car dtmp) (caddr dtmp))))

;; refile 一个 entry 到 gtd.org 文件
(defun he/org-refile-to-datetree (&optional bfn)
  (interactive)
  (require 'org-datetree)
  (let* ((bfn (or bfn (find-file-noselect (expand-file-name "~/Dropbox/org/todo.org"))))
     (datetree-date (he/org-read-datetree-date (org-read-date t nil))))
    (org-refile nil nil (list nil (buffer-file-name bfn) nil
                  (with-current-buffer bfn
                (save-excursion
                  (org-datetree-find-date-create datetree-date)
                  (point)))))))

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite" "lua")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

;; Theme
(use-package doom-themes
  :ensure t
  :defer nil
  :config
  (load-theme 'doom-one-light t))

;; Basic
(setq
      ;;org-startup-indented t
      ;;org-src-tab-acts-natively nil
      org-hide-emphasis-markers t
      org-fontify-done-headline t
      org-hide-leading-stars nil
      org-pretty-entities t
      ;;org-agenda-show-inherited-tags nili
      )

;; Modern Org Mode theme
;;(use-package org-modern
;;  :ensure t
;;  :init
;;  (setopt org-modern-table-vertical 2)
;;  (setopt org-modern-tag nil)
;;  (setopt org-modern-todo nil)
;;  (setopt org-modern-block-name nil)
;;  (setopt org-modern-keyword nil)
;;  (setopt org-modern-timestamp nil)
;;  (setopt org-modern-block-fringe nil)
;;  :config (global-org-modern-mode 1))

;;(use-package org-pretty-tags
;;  :demand t
;;  :config
;;  (setq org-pretty-tags-surrogate-strings
;;        (quote
;;         (("org" . "ORG")
;;          ("nvim" . "NVIM")
;;          ("linux" . "LINUX")
;;          ("arch" . "ARCH")
;;          ("os" . "⚙️ ")
;;          ("textbook" . "📚️")
;;          ("resources" . "🔗")
;;          ("chore" . "📝")
;;          ("jp" . "🇯🇵"))))
;;  (org-pretty-tags-global-mode))

(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)

(provide 'init-org)
;;; init-org.el ends here
