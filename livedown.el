;;; package --- Summary
;;; Code:
;;; Commentary:

(add-to-list 'load-path (expand-file-name "~/.emacs.d/personal/emacs-livedown"))

(custom-set-variables
 '(livedown:autostart t) ; automatically open preview when opening
                                        ; markdown files
 '(livedown:open t)        ; automatically open the browser window
 '(livedown:port 1337))    ; port for livedown server

(require 'livedown)

;;; livedown.el ends here
