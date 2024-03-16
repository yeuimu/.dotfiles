;basic
(setq org-startup-indented t
      org-src-tab-acts-natively t
      org-hide-emphasis-markers t
      org-fontify-done-headline t
      org-hide-leading-stars nil
      org-pretty-entities t
      org-agenda-show-inherited-tags nil)

;; Modern Org Mode theme
(use-package org-modern
  :ensure t
  :init
;  (setopt org-modern-star '("↓"))
;  (setopt org-modern-hide-stars "↓")
;  (setopt org-modern-list '((?- . "•")))
;  (setopt org-modern-checkbox '((?X . "􀃰") (?- . "􀃞") (?\s . "􀂒")))
;  (setopt org-modern-progress '("􀛪" "􀛩" "􀺶" "􀺸" "􀛨"))
  (setopt org-modern-table-vertical 2)
 ; (setopt org-modern-todo nil)
 ; (setopt org-modern-tag nil)
 ; (setopt org-modern-block-name nil)
 ; (setopt org-modern-keyword nil)
 ; (setopt org-modern-timestamp nil)
 ; (setopt org-modern-block-fringe nil)
  :config (global-org-modern-mode 1))

;(use-package org-superstar
;  :ensure t
;  :hook
;  (org-mode . org-superstar-mode))

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '((?A . " A ")
                                  (?B . " B ")
                                  (?C . " C ")
                                  (?D . " D ")
                                  )))

; hide ':' for tags
;(font-lock-add-keywords 'org-mode
;  '(("^\\*+ "
;     ":" nil nil
;     (0 (put-text-property (match-beginning 0) (match-end 0) 'display "  ")))))
;
;(use-package org-pretty-tags
;  :demand t
;  :config
;  (setq org-pretty-tags-surrogate-strings
;        (quote
;         (("org" . "ORG")
;          ("nvim" . "NVIM")
;          ("linux" . "LINUX")
;          ("arch" . "ARCH")
;          ("os" . "⚙️ ")
;          ("textbook" . "📚️")
;          ("resources" . "🔗")
;          ("chore" . "📝")
;          ("jp" . "🇯🇵"))))
;  (org-pretty-tags-global-mode))

(custom-theme-set-faces
  'user
  `(org-level-8 ((t (:inherit outline-8 ))))
  `(org-level-7 ((t (:inherit outline-7 ))))
  `(org-level-6 ((t (:inherit outline-6 ))))
  `(org-level-5 ((t (:inherit outline-5 ))))
  `(org-level-4 ((t (:inherit outline-4 ))))
  `(org-level-3 ((t (:inherit outline-3 ))))
  `(org-level-2 ((t (:inherit outline-2 ))))
  `(org-level-1 ((t (:inherit outline-1 ))))
  `(org-document-title ((t ( :height 2.0 :underline nil)))))

(provide 'org-ui)
