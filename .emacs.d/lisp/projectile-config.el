(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  ;; 设置默认的项目根目录列表
  (setq projectile-project-search-path '("~/Projects/")))

(use-package counsel-projectile
  :ensure t
  :after projectile
  :config
  (counsel-projectile-mode))

(provide 'projectile-config)
