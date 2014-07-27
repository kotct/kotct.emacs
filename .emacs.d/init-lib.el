(defun init--add-directory-to-load-path (path)
  "Adds a directory to the load-path"

  (let ((default-directory path))
    (setq load-path
          (append
           (let ((load-path (copy-sequence load-path)))
             (normal-top-level-add-subdirs-to-load-path))
           load-path)))
  (message "Added %s to the load-path" path))

(provide 'init-lib)
