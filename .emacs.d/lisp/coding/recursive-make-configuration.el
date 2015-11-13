(defun recursive-make ()
  "Recursively search for a make function."
  (interactive)
  (kill-buffer "*recursive-make*")
  (start-process "recursive-make" "*recursive-make*" "~/.emacs.d/python/findmake.py" (buffer-file-name (current-buffer)))
  (display-buffer "*recursive-make*"))

(provide 'recursive-make-configuration)
