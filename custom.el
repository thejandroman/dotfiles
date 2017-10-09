;;; package --- Summary
;;; Code:
;;; Commentary:

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq linum-format "%4d \u2502 ")
(global-linum-mode 1)

;;; custom.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("25c06a000382b6239999582dfa2b81cc0649f3897b394a75ad5a670329600b45" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" default)))
 '(package-selected-packages
   (quote
    (base16-theme rbenv use-package zop-to-char zenburn-theme yari yaml-mode which-key web-mode volatile-highlights vkill undo-tree solarized-theme smex smartrep smartparens smart-mode-line scss-mode ruby-tools rainbow-mode rainbow-delimiters puppetfile-mode puppet-mode ov operate-on-number nodejs-repl neotree move-text markdown-mode magit jsx-mode json-mode js3-mode js2-mode inf-ruby imenu-anywhere ido-ubiquitous helm-projectile helm-mt helm-descbinds helm-ag guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine git-rebase-mode git-commit-mode gist geiser flymake-puppet flycheck flx-ido expand-region exec-path-from-shell elisp-slime-nav editorconfig easy-kill dockerfile-mode discover-my-major diminish diff-hl crux company-anaconda color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized browse-kill-ring beacon anzu ack-and-a-half ace-window ace-jump-buffer))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
