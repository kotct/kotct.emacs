(defun save-buffers-on-kill-emacs (&optional arg)
  "Offer to save each buffer (do this once only), then kill this Emacs process.
With prefix ARG, silently save all file-visiting buffers, and then kill."
  (interactive "P")
  (save-some-buffers arg t)
  (and (or (not (fboundp 'process-list))
           (let ((processes (process-list))
                 active)
             (while processes
               (and (memq (process-status (car processes)) '(run stop open listen))
                    (process-query-on-exit-flag (car processes))
                    (setq active t))
               (setq processes (cdr processes)))
             (or (not active)
                 (progn (list-processes t)
                        (yes-or-no-p "Active processes exist; kill them and exit anyway? ")))))
       (run-hook-with-args-until-failure 'kill-emacs-query-functions)
       (or (null confirm-kill-emacs)
           (funcall confirm-kill-emacs "Really exit Emacs? "))
       (kill-emacs)))

(fset 'save-buffers-kill-emacs 'save-buffers-on-kill-emacs)

(defun insert-signoff ()
  "Insert a signoff tag"
  (interactive "*")
  (insert-file-contents "~/.signoff.txt"))

(provide 'command-replacement-config)
