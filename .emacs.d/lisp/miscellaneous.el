(defun read-contents-from-file (file-path)
  "Returns the contents of the file at file-path."
  (with-temp-buffer
    (insert-file-contents file-path)
    (buffer-string)))

(defun read-lines-from-file (file-path)
  "Returns a list of the lines from the file at file-path."
  (split-string (read-contents-from-file file-path) "\n" t))

(provide 'miscellaneous)
