;;; kapacitor-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "kapacitor" "kapacitor.el" (0 0 0 0))
;;; Generated autoloads from kapacitor.el

(defvar kapacitor-mode-map (let ((keymap (make-sparse-keymap))) (define-key keymap (kbd "p") #'magit-section-backward) (define-key keymap (kbd "n") #'magit-section-forward) (define-key keymap (kbd "M-p") #'magit-section-backward-sibling) (define-key keymap (kbd "M-n") #'magit-section-forward-sibling) (define-key keymap (kbd "C-i") #'magit-section-toggle) (define-key keymap (kbd "^") #'magit-section-up) (define-key keymap [tab] #'magit-section-toggle) (define-key keymap (kbd "q") #'quit-window) (define-key keymap (kbd "g") #'kapacitor-overview-refresh) (define-key keymap (kbd "RET") #'kapacitor-show-task) (define-key keymap (kbd "c") #'kapacitor-set-url) (define-key keymap (kbd "d") #'kapacitor-disable-task) (define-key keymap (kbd "e") #'kapacitor-enable-task) (define-key keymap (kbd "D") #'kapacitor-delete-task) (define-key keymap (kbd "?") #'kapacitor-overview-popup) (define-key keymap (kbd "w") #'kapacitor-watch-popup) (define-key keymap (kbd "S") #'kapacitor-show-stats-popup) (define-key keymap (kbd "l") #'kapacitor-log-popup) keymap) "\
Keymap for `kapacitor-mode'.")

(autoload 'kapacitor-overview "kapacitor" "\
Display kapacitor overview in a buffer.

If QUIET is set then additional questions are not asked in case
the server is not reachable.

\(fn &optional QUIET)" t nil)

(autoload 'kapacitor-mode "kapacitor" "\
Base mode for Kapacitor modes.

\\{kapacitor-mode-map}

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "kapacitor" '("kapacitor-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; kapacitor-autoloads.el ends here
