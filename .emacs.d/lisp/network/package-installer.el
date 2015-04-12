(defun package-installer-install-dependencies (arg &optional update)
  "Installs the dependencies.
With a non-nil or prefix ARG, do not refresh package list."
  (interactive "P")

  (require 'dependencies)

  (unless arg (package-refresh-contents))

  (let ((found nil))
    (mapc
     (lambda (package)
       (if (not (package-installed-p package))
           (progn
             (setq found t)
             (if (y-or-n-p (format "Package %s is missing. Install it? " package))
                 (package-install package)))))
     dependency-list)

    (if found
        (message "Dependency installation completed.")
      (message "No dependencies needing installation."))))

(provide 'package-installer)
