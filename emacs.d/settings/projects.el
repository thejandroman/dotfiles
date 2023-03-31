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
  (setq neo-vc-integration '(char))
  (setq neo-window-fixed-size nil)
  )

;; Set the neo-window-width to the current width of the
;; neotree window, to trick neotree into resetting the
;; width back to the actual window width.
;; Fixes: https://github.com/jaypei/emacs-neotree/issues/262
(eval-after-load "neotree"
  '(add-to-list 'window-size-change-functions
                (lambda (frame)
                  (let ((neo-window (neo-global--get-window)))
                    (unless (null neo-window)
                      (setq neo-window-width (window-width neo-window)))))))

(use-package projectile
  :ensure t)

(provide 'projects)
;;; projects.el ends here
