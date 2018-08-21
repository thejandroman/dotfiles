;;; spelling.el --- Summary
;;; Code:
;;; Commentary:

(dolist (hook '(text-mode-hook
                markdown-mode-hook
                yaml-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (mode '(emacs-lisp-mode-hook
                ruby-mode-hook
                js2-mode-hook
                puppet-mode-hook))
  (add-hook mode
            '(lambda ()
               (flyspell-prog-mode))))

(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))

(provide 'spelling)

;;; spelling.el ends here
