;; Set the tab width
(setq global-tab-width 4)

;; Disable initial startup screen
(setq inhibit-startup-screen t)

;; Set the scratch buffer message
(setq initial-scratch-message ";; This buffer is mostly useless.
;; It has EmacsLISP powers, though, if you want to use those.

")

(require 'package-list)

(if (require 'local-elisp-hub nil 'no-error)
    (progn
      (message "Loaded \"local-elisp\"")))

(provide 'pre-config-config)
