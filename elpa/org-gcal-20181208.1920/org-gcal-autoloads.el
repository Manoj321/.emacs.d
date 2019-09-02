;;; org-gcal-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-gcal" "org-gcal.el" (0 0 0 0))
;;; Generated autoloads from org-gcal.el

(autoload 'org-gcal-sync "org-gcal" "\
Import events from calendars.
Using A-TOKEN and export the ones to the calendar if unless
SKIP-EXPORT.  Set SILENT to non-nil to inhibit notifications.

\(fn &optional A-TOKEN SKIP-EXPORT SILENT)" t nil)

(autoload 'org-gcal-fetch "org-gcal" "\
Fetch event data from google calendar.

\(fn)" t nil)

(autoload 'org-gcal-post-at-point "org-gcal" "\
Post entry at point to current calendar.
If SKIP-IMPORT is not nil, do not import events from the
current calendar.

\(fn &optional SKIP-IMPORT)" t nil)

(autoload 'org-gcal-delete-at-point "org-gcal" "\
Delete entry at point to current calendar.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-gcal" '("org-gcal-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-gcal-autoloads.el ends here
