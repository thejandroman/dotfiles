;;; projects --- Summary
;;; Commentary:
;;; Code:
(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle))
  :config
  (defvar neo-theme)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (defvar neo-vc-integration)
  (setq neo-vc-integration (quote (face)))
  )

(use-package projectile
  :ensure t)

(provide 'projects)
;;; projects.el ends here
