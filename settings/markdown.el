;;; package --- Summary
;;; Code:
;;; Commentary:

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/personal/emacs-livedown"))

(use-package livedown
  :config
  (defvar livedown-autostart)
  (setq livedown-autostart t))

(use-package markdown-mode
  :ensure t)

(provide 'markdown)

;;; markdown.el ends here
