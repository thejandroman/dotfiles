;;; setup-package.el -- Summary
;;; Code:
;;; Commentary:

;; Configure repos
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; Setup use-package
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package diminish
  :ensure t)

;; (require 'diminish)
(require 'bind-key)

(provide 'setup-package)

;;; setup-package.el ends here
