
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

(provide 'init-org-ui)
