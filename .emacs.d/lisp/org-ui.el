
;basic
(setq org-startup-indented t
      org-src-tab-acts-natively t
      org-hide-emphasis-markers t
      org-fontify-done-headline t
      org-hide-leading-stars t
      org-pretty-entities t
      org-agenda-show-inherited-tags nil)

(use-package nerd-icons)

(use-package org-superstar
  :ensure t
  :hook
  (org-mode . org-superstar-mode))

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '((?A . "󰲠")
                                  (?B . "󰲢")
                                  (?C . "󰲤"))))

; hide ':' for tags
(font-lock-add-keywords 'org-mode
  '(("^\\*+ "
     ":" nil nil
     (0 (put-text-property (match-beginning 0) (match-end 0) 'display "  ")))))

(use-package org-pretty-tags
  :demand t
  :config
  (setq org-pretty-tags-surrogate-strings
        (quote
         (("org" . "")
          ("nvim" . "")
          ("linux" . "")
          ("arch" . "󰣇")
          ("os" . "")
          ("textbook" . "")
          ("resources" . "")
          ("jp" . "󰬑"))))
  (org-pretty-tags-global-mode))

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
