;; load-path expansion
(setq load-path (append '("~/.emacs.d/lisp"
                          "~/.emacs.d/lisp/language-support"
                          "~/local-elisp") load-path))

(require 'package)
(require 'package-list)

;; Check version numbers
(if (not (= emacs-major-version 24))
    (progn
      (message "Not using Emacs 24!")
      (setq install-okay nil))
  (if (not (= emacs-minor-version 3))
      (progn
        (message "Not using Emacs 24.3!")
        (setq install-okay nil))
    (setq install-okay t)))

;; If something went wrong, abort.
(if (not install-okay)
    (progn
      (message "Please install Emacs 24.3!")
      (kill-emacs))
  (progn
    (message "Version checks complete, we should be good to go.")))

(require 'package-source-config)
(package-refresh-contents)

(setq install-all
      (y-or-n-p
       (format "Do you want me to install all of the packages for you? ")))

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if install-all
           (package-install package)
         (if (y-or-n-p (format "Package %s is missing. Install it? " package))
             (package-install package)))))
 want-mah-packagez-list)
