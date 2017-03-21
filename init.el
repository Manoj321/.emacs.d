;; Turn off GUI, because GUI makes you slow.
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Make sure melpa is added to package-archives.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Install use package.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; From use-package readme.
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; So that Arista specific .el files are loaded.
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Finally load config.org
(org-babel-load-file (concat user-emacs-directory "config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(highlight-indent-guides-method (quote character))
 '(large-file-warning-threshold nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-character-face ((t (:foreground "gray73"))))
 '(highlight ((t (:background "color-237"))))
 '(ledger-font-xact-highlight-face ((t (:background "color-237")))))
