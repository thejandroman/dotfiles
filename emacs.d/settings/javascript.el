;;; javascript.el -- Summary
;;; Commentary:
;;; Code:

(use-package json-mode
  :ensure t
  :config
  (defvar json-reformat:indent-width)
  (setq json-reformat:indent-width 2))

(use-package js2-mode
  :ensure t
  :config
  (setq js2-basic-offset 2))

(use-package web-mode
  :ensure t
  :mode (("\\.jsx$" . web-mode))
  :config
  (defvar web-mode-markup-indent-offset)
  (setq web-mode-markup-indent-offset 2)
  (defvar web-mode-css-indent-offset)
  (setq web-mode-css-indent-offset 2)
  (defvar web-mode-code-indent-offset)
  (setq web-mode-code-indent-offset 2))

;; Disable all flycheckers. We use standard
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)
                      '(javascript-jscs)
                      '(javascript-eslint)))
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;; Enable standard
(flycheck-add-mode 'javascript-standard 'web-mode)
(flycheck-add-mode 'javascript-standard 'js2-mode)
(flycheck-add-mode 'javascript-standard 'js-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))

(provide 'javascript)

;;; javascript.el ends here
