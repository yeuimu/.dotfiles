;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(use-package fanyi
  :ensure t)
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(require 'init-theme)
(require 'init-basic)
(require 'init-org)

(provide 'init)
;;; end init.el
