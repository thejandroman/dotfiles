(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

(add-hook 'before-save-hook 'whitespace-cleanup)

(provide 'programming)

;;; programming.el ends here
