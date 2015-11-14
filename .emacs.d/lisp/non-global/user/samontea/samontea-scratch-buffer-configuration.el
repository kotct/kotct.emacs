(add-hook 'after-init-hook
          (lambda () (setq initial-scratch-message (concat
                                                    ";; init: " (emacs-init-time) (format-time-string " @ %T on %F")  "\n;; " (user-login-name) "@" (system-name) "\n"
                                                    ";;        Scratch teh thangs!
;;
;;        / \\             / \\
;;       / Δ \\           / Δ \\
;;     -------------------------
;;   /                           \\
;;  |    ----            ----     |
;;  |    |  |            |  |     |
;;  |    | Θ|            | Θ|     |
;;  |    ----            ----     |
;;  |              ^              |
;;  |           -------           |
;;  |           \\     /           |
;;   \\            ---            /
;;    \\                         /
;;      -----------------------
;;     |           λ           |
;;      -----------------------
;;
;;\n\n"))))

(provide 'samontea-scratch-buffer-configuration)
