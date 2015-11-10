(defun recursive-make ()
  "Recursively search for a make function."
  (interactive)
  (shell-command (concat "~/.emacs.d/python/findmake.py " (buffer-file-name (current-buffer)))))

(provide 'recursive-make-configuration)
