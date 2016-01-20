(defvar *inital-scratch-message-value* initial-scratch-message)

;; use a hook so that we can use emacs-init-time
(add-hook 'after-init-hook
          (lambda ()
            (if (equal initial-scratch-message *inital-scratch-message-value*)
                (setq initial-scratch-message
                      (concat ";; init: " (emacs-init-time) (format-time-string " @ %T on %F")
                              "\n;; " (user-login-name) "@" (system-name) " loaded config for " current-username
                              "\n;; scratch away\n\n")))))

(provide 'scratch-buffer-configuration)
