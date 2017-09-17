;;; package -- Summary
;;; Commentary:
;;; Code:

(use-package json-mode
  :ensure t
  :config
  (setq json-reformat:indent-width 2))

(use-package js2-mode
  :ensure t
  :config
  (setq js2-basic-offset 2))

(use-package web-mode
  :ensure t
  :mode (("\\.jsx$" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

;; Disable jshint. We use eslint.
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; Enable eslint.
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'js-mode)

;;; javascript.el ends here
