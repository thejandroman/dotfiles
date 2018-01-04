;;; theme.el --- Summary
;;; Code:
;;; Commentary:

(use-package base16-theme
  :ensure t)

(use-package darktooth-theme
  :ensure t)

(use-package color-theme-solarized
  :ensure t)

(use-package zenburn-theme
  :ensure t)

;; (customize-set-variable 'solarized-termcolors 256)
;; (customize-set-variable 'frame-background-mode (quote light))
(load-theme 'zenburn t)


(provide 'theme)

;;; theme.el ends here
