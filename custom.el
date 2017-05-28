;;; package --- Summary
;;; Code:
;;; Commentary:

;; Disable arrow keys
(setq guru-warn-only nil)

(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

;; (setq interprogram-cut-function 'paste-to-osx)
;; (setq interprogram-paste-function 'copy-from-osx)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode.  Adjust indent."
    ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq linum-format "%4d \u2502 ")
(global-linum-mode 1)

(require 'magit)

(setq ruby-insert-encoding-magic-comment nil)

;;; custom.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(livedown:autostart t)
 '(package-selected-packages
   (quote
    (neotree rbenv zop-to-char zenburn-theme yari yaml-mode which-key web-mode volatile-highlights undo-tree smex smartrep smartparens smart-mode-line scss-mode ruby-tools rainbow-mode rainbow-delimiters ov operate-on-number move-text markdown-mode magit json-mode js2-mode inf-ruby imenu-anywhere ido-ubiquitous helm-projectile helm-descbinds helm-ag guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck flx-ido expand-region elisp-slime-nav editorconfig easy-kill discover-my-major diminish diff-hl crux company-anaconda color-theme-sanityinc-tomorrow coffee-mode browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
