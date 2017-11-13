;;; package --- Summary
;;; Code:
;;; Commentary:

;; List of possible locations for rbenv
(defvar rbenv-paths)
(setq rbenv-paths
      '("/usr/local/rbenv"
        "/usr/local/bin/rbenv"))

;; Use the first rbenv path that responds as executable
(defvar rbenv-path)
(setq rbenv-path
      (cl-find 't rbenv-paths :key 'file-executable-p))

(use-package rbenv
  :ensure t
  :config
  (defvar rbenv-installation-dir)
  (setq rbenv-installation-dir rbenv-path)
  (global-rbenv-mode))

(use-package ruby-mode
  :config
  (setq ruby-insert-encoding-magic-comment nil))

(provide 'ruby)

;;; ruby.el ends here