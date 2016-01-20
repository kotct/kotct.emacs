(defun timing-new (name)
  (interactive "MTiming name: ")
  (find-file "~/emacs_timings")
  (goto-char (point-max))
  (insert (format-time-string "%F (%a) %T | ") name "\n")
  (save-buffer))

(provide 'cg505-timings)
