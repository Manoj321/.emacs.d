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
 '(highlight-indent-guides-method (quote character))
 '(large-file-warning-threshold nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-character-face ((t (:foreground "gray73"))))
 '(highlight ((t (:background "color-237"))))
 '(ledger-font-xact-highlight-face ((t (:background "color-237"))))
 '(magit-diff-added ((t (:foreground "#22aa22"))))
 '(magit-diff-added-highlight ((t (:foreground "#22aa22"))))
 '(magit-diff-base ((t (:foreground "#aaaa11"))))
 '(magit-diff-base-highlight ((t (:foreground "#aaaa11"))))
 '(magit-diff-conflict-heading ((t (:inherit nil))))
 '(magit-diff-context-highlight ((t (:foreground "grey50"))))
 '(magit-diff-file-heading-highlight ((t (:inherit nil))))
 '(magit-diff-hunk-heading ((t (:foreground "grey30"))))
 '(magit-diff-hunk-heading-highlight ((t (:foreground "grey30"))))
 '(magit-diff-lines-boundary ((t (:inherit nil))))
 '(magit-diff-our ((t nil)))
 '(magit-diff-removed ((t (:foreground "#aa2222"))))
 '(magit-diff-removed-highlight ((t (:foreground "#aa2222"))))
 '(magit-section-highlight ((t nil))))

