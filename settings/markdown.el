;;; package --- Summary
;;; Code:
;;; Commentary:

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/personal/emacs-livedown"))

(use-package markdown-mode
  :ensure t)

(use-package livedown
  :config
  (defvar livedown-autostart)
  (setq livedown-autostart t))

(define-minor-mode livedown-mode
  "Override markdown mode to use livedown for preview"
  :lighter " livedown"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c C-c p") 'livedown-preview)
            map))

(add-hook 'markdown-mode-hook 'livedown-mode)

(provide 'markdown)

;;; markdown.el ends here
