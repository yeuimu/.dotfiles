;; 为 Unicode Symbol 设置 Nerd Font，以解决可能的乱码问题
(set-fontset-font t 'symbol "Symbols Nerd Font" nil 'prepend)
(set-fontset-font t 'unicode "Symbols Nerd Font" nil 'prepend)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-fancy-priorities org-pretty-tags org-modern counsel ivy which-key fanyi doom-themes evil use-package))
 '(warning-suppress-types '((comp) (comp) (comp) (comp) (comp))))

(set-face-attribute 'default nil :height 120)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2)))))
