;;; init.el -- Summary
;;; Code:
;;; Commentary:

(package-initialize)

;; Set up load path
(defvar settings-dir)
(defvar site-lisp-dir)
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Are we on a mac?
(defvar is-mac)
(setq is-mac (equal system-type 'darwin))

;; Set up things!
(require 'setup-package)
(require 'defaults)

;; Add some mac defaults
(when is-mac
    (require 'mac-defaults))

;; Add features
(require 'theme)
(require 'completions)
(require 'syntax-checking)
(require 'vcs)
(require 'programming)
(require 'markdown)
(require 'ruby)
(require 'javascript)
(require 'yaml)
(require 'puppet)

;;; init.el ends here
