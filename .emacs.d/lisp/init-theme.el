;;; theme-config --- org plugin config
;;; Commentary:
;;; Code:

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-nord t))

(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)

(provide 'init-theme)

