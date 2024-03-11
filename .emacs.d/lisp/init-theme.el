;;; theme-config --- org plugin config
;;; Commentary:
;;; Code:

(use-package doom-themes
  :ensure t
  :defer nil
  :config
  (load-theme 'doom-one t))

(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)

(provide 'init-theme)

