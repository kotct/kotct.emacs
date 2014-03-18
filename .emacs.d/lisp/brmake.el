(setq brmake-compilation-filenames '("Makefile"
                                     "makefile"))

(defun brmake-get-nearest-compilation-file ()
  "Search for the compilation file traversing backwards up the directory tree."
  (let ((dir default-directory)
        (parent-dir (file-name-directory (directory-file-name default-directory)))
        (nearest-compilation-file 'nil))
    (while (and (not (string= dir parent-dir))
                (not nearest-compilation-file))
      (dolist (filename brmake-compilation-filenames)
        (setq file-path (concat dir filename))
        (when (file-readable-p file-path)
          (setq nearest-compilation-file file-path)))
      (setq dir parent-dir
            parent-dir (file-name-directory (directory-file-name parent-dir))))
    nearest-compilation-file))

(defun brmake-directory-containing-nearest-compilation-file ()
  "Get the directory name for the nearest compilation file"
  (file-name-directory (brmake-get-nearest-compilation-file)))

(defun brmake-compile-using-nearest-compilation-file ()
  "Searches recursively backwards up the directory tree and uses the nearest compilation file."
  (interactive)
  (compile (format "cd %s && make -f %s" (brmake-directory-containing-nearest-compilation-file) (brmake-get-nearest-compilation-file))))

(provide 'brmake)
