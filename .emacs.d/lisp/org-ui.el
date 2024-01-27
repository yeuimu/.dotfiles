(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(use-package org-superstar
    :ensure t
    :config
    (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
)

(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")
)


(custom-theme-set-faces
  'user
  `(org-level-8 ((t (:inherit outline-8 ))))
  `(org-level-7 ((t (:inherit outline-7 ))))
  `(org-level-6 ((t (:inherit outline-6 ))))
  `(org-level-5 ((t (:inherit outline-5 ))))
  `(org-level-4 ((t (:inherit outline-4 :height 1.1))))
  `(org-level-3 ((t (:inherit outline-3 :height 1.25))))
  `(org-level-2 ((t (:inherit outline-2 :height 1.5))))
  `(org-level-1 ((t (:inherit outline-1 :height 1.75))))
  `(org-document-title ((t ( :height 2.0 :underline nil)))))

(provide 'org-ui)
