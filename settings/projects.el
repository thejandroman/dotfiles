;;; projects --- Summary
;;; Commentary:
;;; Code:
(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(use-package projectile
  :ensure t)

(provide 'projects)
;;; projects.el ends here
