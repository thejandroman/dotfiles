;;; completions.el -- Summary
;;; Code:
;;; Commentary:
(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (substitute-key-definition 'find-tag 'helm-etags-select global-map)
  (substitute-key-definition 'xref-find-definitions 'helm-etags-select global-map)
  :bind (("M-x" . helm-M-x)
         ("M-/" . helm-dabbrev)
         ("C-x b" . helm-mini)
         ("C-x C-b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-h f" . helm-apropos)
         ("C-h r" . helm-info-emacs)))

(provide 'completions)
;;; completions.el ends here
