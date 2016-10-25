;;; package --- Summary
;;; Code:
;;; Commentary:

(setq js-indent-level 2)
(setq js2-basic-offset 2)

(add-hook 'js3-mode-hook
          (lambda ()
            (setq js3-auto-indent-p t
                  js3-curly-indent-offset 0
                  js3-enter-indents-newline t
                  js3-expr-indent-offset 2
                  js3-indent-on-enter-key t
                  js3-lazy-commas t
                  js3-lazy-dots t
                  js3-lazy-operators t
                  js3-paren-indent-offset 2
                  js3-square-indent-offset 4)
            (linum-mode 0)))

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js3-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'js-mode)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;;; js.el ends here
