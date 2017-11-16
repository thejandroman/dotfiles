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

;; Disable jshint. We use eslint.
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; Enable eslint.
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'js-mode)

(provide 'javascript)

;;; javascript.el ends here
