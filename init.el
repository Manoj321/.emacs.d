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
(require 'netrc)

;; So that Arista specific .el files are loaded.
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Finally load config.org
(org-babel-load-file (concat user-emacs-directory "config.org"))

;; load secrets
(load-library "~/secrets.el.gpg")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(highlight-indent-guides-method (quote character))
 '(kubernetes-logs-arguments (quote ("--tail=500")) t)
 '(package-selected-packages
   (quote
    (hierarchy redditor redditor-mode redittor-mode redittor org-gcal tree-mode htmlize org-mu4e mu4e-alert mu4e js2-mode indium fontawesome ess adaptive-wrap ac-dabbrev pdf-tools go-guru go-autocomplete graphviz-dot-mode tickscript-mode ob-http pdb-mode undo-tree kubernetes yaml-mode waher-theme use-package solarized-theme smartscan smartparens org-journal ob-go monokai-theme markdown-mode magit ledger-mode jedi highlight-indent-guides helm-swoop helm-company gotest flymd flycheck fill-column-indicator exec-path-from-shell elfeed-web elfeed-org dockerfile-mode docker cyberpunk-theme ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "color-237"))))
 '(highlight-indent-guides-character-face ((t (:foreground "gray73"))))
 '(ledger-font-xact-highlight-face ((t (:background "color-237"))))
 '(magit-diff-added ((t (:foreground "#22aa22"))))
 '(magit-diff-added-highlight ((t (:foreground "#22aa22"))))
 '(magit-diff-base ((t (:foreground "#aaaa11"))))
 '(magit-diff-base-highlight ((t (:foreground "#aaaa11"))))
 '(magit-diff-conflict-heading ((t (:inherit nil))))
 '(magit-diff-context-highlight ((t (:foreground "grey50"))))
 '(magit-diff-file-heading-highlight ((t (:inherit nil))))
 '(magit-diff-hunk-heading ((t (:foreground "grey30"))))
 '(magit-diff-hunk-heading-highlight ((t (:foreground "nil"))))
 '(magit-diff-lines-boundary ((t (:inherit nil))))
 '(magit-diff-our ((t nil)))
 '(magit-diff-removed ((t (:foreground "#aa2222"))))
 '(magit-diff-removed-highlight ((t (:foreground "#aa2222"))))
 '(magit-section-highlight ((t nil))))
