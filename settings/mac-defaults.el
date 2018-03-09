;;; mac-defaults --- Summary
;;; Commentary:
;;; Code:

;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)

;; mac switch meta key
;; (defun mac-switch-meta nil
;;   "switch meta between Option and Command"
;;   (interactive)
;;   (if (eq mac-option-modifier nil)
;;       (progn
;;         (setq mac-option-modifier 'meta)
;;         (setq mac-command-modifier 'hyper))
;;     (progn
;;       (setq mac-option-modifier nil)
;;       (setq mac-command-modifier 'meta))))

;; (defadvice handle-delete-frame (around my-handle-delete-frame-advice activate)
;;   "Hide Emacs instead of closing the last frame"
;;   (let ((frame   (posn-window (event-start event)))
;;         (numfrs  (length (frame-list))))
;;     (if (> numfrs 1)
;;         ad-do-it
;;       (do-applescript "tell application \"System Events\" to tell process \"Emacs\" to set visible to false"))))

;; (define-key mac-apple-event-map [core-event reopen-application] nil)

(provide 'mac-defaults)

;;; mac-defaults.el ends here
