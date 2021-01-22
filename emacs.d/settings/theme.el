;;; theme.el --- Summary
;;; Code:
;;; Commentary:

(use-package color-theme-sanityinc-tomorrow
  :ensure t)

(use-package base16-theme
  :ensure t)

(use-package darktooth-theme
  :ensure t)

(use-package color-theme-sanityinc-solarized
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(use-package sunburn-theme
  :ensure t)

;; (customize-set-variable 'solarized-termcolors 256)
;; (customize-set-variable 'frame-background-mode (quote light))
;; (load-theme 'sunburn t)

(setq current-theme "init")
(defconst light-theme 'sanityinc-tomorrow-day)
(defconst dark-theme 'sanityinc-tomorrow-night)
(load-theme dark-theme 1)

;; will apply a dark theme if the room is dark, and a light theme if the room is
;; bright
(defun change-theme-for-lighting ()
  (let* ((current-light-sensor-reading
          (string-to-number
           (shell-command-to-string "/Users/thejandroman/bin/lmutracker")))
         (lid-open
          (string-to-number
           (shell-command-to-string "/Users/thejandroman/bin/lid-open"))))
    (if (eql lid-open 0)
        (if (< current-light-sensor-reading 11000000)
            (when (not (string-equal current-theme "dark"))
              (load-theme dark-theme 1)
              (setq current-theme "dark"))
          (when (not (string-equal current-theme "light"))
            (load-theme light-theme 1)
            (setq current-theme "light")))
      (when (not (string-equal current-theme "dark"))
        (load-theme dark-theme 1)
        (setq current-theme "dark")))))

;; probably want to run this less frequently than every second
;; (run-at-time 1 1 #'change-theme-for-lighting)

(provide 'theme)

;;; theme.el ends here
