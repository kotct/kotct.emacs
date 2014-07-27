(defun package-installer-install-dependencies ()
  "Installs the dependencies"
  (interactive "*")

  (progn
    (require 'dependencies)

    (package-refresh-contents)

    (mapc
     (lambda (package)
       (if (not (package-installed-p package))
           (if (y-or-n-p (format "Package %s is missing. Install it? " package))
               (package-install package))))
     dependency-list)))

(provide 'package-installer)
