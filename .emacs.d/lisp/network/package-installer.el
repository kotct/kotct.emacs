(defun package-up-to-date (package)
  (every (lambda (x) (package-installed-p package (package-desc-version x))) (cdr (assq package package-archive-contents))))

(defun package-installer-install-dependencies (arg &optional update)
  "Installs the dependencies.
With a non-nil or prefix ARG, do not refresh package list.
If UPDATE is non-nil, out-of-date packages will be updated."
  (interactive "P")

  (require 'dependencies)

  (unless arg (package-refresh-contents))

  (let ((found nil)
        (install-list nil))
    (dolist (package dependency-list)
      (let ((updating nil))
        (if (or (not (package-installed-p package)) (and update (not (package-up-to-date package)) (setq updating t)))
            (progn
              (setq found t)
              (if auto-install
                  (add-to-list 'install-list (cons package
                                                   ;; haxily say we need the next version by adding a .1 to the version
                                                   ;; ie if we have version 2.3.0 ask for 2.3.0.1
                                                   (if updating (list (append (package-desc-version (cadr (assq package package-alist))) '(1))))))
                (if (y-or-n-p (format "Package %s is %s. Install it? " package (if updating "out of date" "missing")))
                    (add-to-list 'install-list (cons package
                                                     ;; haxily say we need the next version by adding a .1 to the version
                                                     ;; ie if we have version 2.3.0 ask for 2.3.0.1
                                                     (if updating (list (append (package-desc-version (cadr (assq package package-alist))) '(1))))))))))))

    (if found
        (progn (package-download-transaction (package-compute-transaction () install-list))
               (message "Dependency installation completed."))
      (message "No dependencies needing installation."))))

(defun package-installer-packup (arg)
  "The new & improved package updater"
  (interactive "P")

  (require 'dependencies)

  (unless arg (package-refresh-contents))

  (let ((found nil)
        (install-list nil))
    (dolist (package dependency-list)

      (let ((updating nil))
        (if (or (not (package-installed-p package)) (and (not (package-up-to-date package)) (setq updating t)))
            (progn
              (setq found t)
              (add-to-list 'install-list (cons package
                                               ;; haxily say we need the next version by adding a .1 to the version

                                               ;; ie if we have version 2.3.0 ask for 2.3.0.1
                                               (if updating (list (append (package-desc-version (cadr (assq package package-alist))) '(1))))))))))


    (let ((install-list-string "Packages to be installed:") (print-quoted nil))
      (dolist (package install-list)
        (message (symbol-name (car package)))
        (setq install-list-string (concat install-list-string "\n" (symbol-name (car package)))))
      (if found
          (with-output-to-temp-buffer "*packup: packages to upgrade*"
            (with-current-buffer "*packup: packages to upgrade*"
              (setq cursor-type nil)
              (insert install-list-string)))))

    (if (and found (y-or-n-p "Auto install/update these package?"))
        (progn (package-download-transaction (package-compute-transaction () install-list))
               (message "Dependency installation completed.")
               (kill-buffer "*packup: packages to upgrade*"))
      (if found
          (let ((manual-install-list nil))
            (dolist (package install-list)
              (if (y-or-n-p (format "Package %s is %s. Install it? " (car package) (if (cdr package) "out of date" "missing")))
                  (add-to-list 'manual-install-list package)))
            (progn (package-download-transaction (package-compute-transaction () manual-install-list))
                   (message "Dependency installation completed.")
                   (kill-buffer "*packup: packages to upgrade*")))
        (message "No dependencies needing installation.")))))

(provide 'package-installer)
