;;; javascript.el -- Summary
;;; Commentary:
;;; Code:

;; Cribbed from:
;; - https://github.com/CSRaghunandan/.emacs.d/blob/master/setup-files/setup-js.el
;;  - http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;;  - https://patrickskiba.com/emacs/2019/09/07/emacs-for-react-dev.html

;; json-mode: Major mode for editing JSON files with emacs
;; https://github.com/joshwnj/json-mode
(use-package json-mode
  :ensure t
  :mode "\\.js\\(?:on\\|[hl]int\\(rc\\)?\\)\\'"
  :config
  (add-hook 'json-mode-hook #'prettier-js-mode)
  (setq json-reformat:indent-width 2)
  (setq json-reformat:pretty-string? t)
  (setq js-indent-level 2))

;; js2-mode: enhanced JavaScript editing mode
;; https://github.com/mooz/js2-mode
(use-package js2-mode
  :ensure t
  :mode (("\\.js$" . js2-mode))
  :hook ((js2-mode . (lambda ()
                       (flycheck-mode))))
  :config
  ;; have 2 space indentation by default
  (setq js-indent-level 2
        js2-basic-offset 2
        js-chain-indent t)

  ;; ;; use eslint_d insetad of eslint for faster linting
  ;; (defvar flycheck-javascript-eslint-executable)
  ;; (setq flycheck-javascript-eslint-executable "eslint_d")

  ;; Try to highlight most ECMA built-ins
  (setq js2-highlight-level 3)
  ;; have a shorter idle time delay
  (setq js2-idle-timer-delay 0.1)
  ;; turn off all warnings in js2-mode
  (setq js2-mode-show-parse-errors t
        js2-mode-show-strict-warnings nil
        js2-strict-missing-semi-warning nil
        js2-strict-trailing-comma-warning nil))

;; prettier-emacs: minor-mode to prettify javascript files on save
;; https://github.com/prettier/prettier-emacs
(use-package prettier-js
  :ensure t
  :hook ((js2-mode . prettier-js-mode)))

;; Adds the node_modules/.bin directory to the buffer exec_path. E.g. support project local eslint installations.
;; https://github.com/codesuki/add-node-modules-path/tree/master
(use-package add-node-modules-path
  :ensure t
  :hook ((js2-mode . add-node-modules-path)))


;; eslintd-fix: Emacs minor-mode to automatically fix javascript with eslint_d.
;; https://github.com/aaronjensen/eslintd-fix/tree/master
;; (use-package eslintd-fix
;;   :ensure t)

(use-package web-mode
  :ensure t
  ;; :mode (("\\.jsx$" . web-mode))
  :config
  (defvar web-mode-markup-indent-offset)
  (setq web-mode-markup-indent-offset 2)
  (defvar web-mode-css-indent-offset)
  (setq web-mode-css-indent-offset 2)
  (defvar web-mode-code-indent-offset)
  (setq web-mode-code-indent-offset 2))

;; ;; Disable all flycheckers. We use standard
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
                      ;; '(javascript-jscs)
                      ;; '(javascript-eslint)))

;;
;; Enable standard
(flycheck-add-mode 'javascript-standard 'web-mode)
(flycheck-add-mode 'javascript-standard 'js2-mode)
(flycheck-add-mode 'javascript-standard 'js-mode)

;; https://github.com/felipeochoa/rjsx-mode
(use-package rjsx-mode
  :ensure t
  :mode (("components\\/.*\\.js\\'" . rjsx-mode))
  )

;; (add-hook 'web-mode-hook 'prettier-js-mode)

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))

(provide 'javascript)

;;; javascript.el ends here
