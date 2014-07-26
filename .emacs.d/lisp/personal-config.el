(setq username-config-alist
      '((("cooperc" "Christopher") . "cg505")
        ;; (("user" "login") . "test")
        ))

(defun username-from-user (&optional user)
  "Convert from a login user (whoami) to a username"
  (unless user (setq user (user-login-name)))
  (assoc-default user username-config-alist (lambda (x y) (member y x))))

(setq current-username nil)

(defun load-username (username)
  "Load the personal config of username"
  (let ((personal-dir (concat "~/.emacs.d/personal/" username)))
    (unless (file-exists-p personal-dir) (error "%s has no personal config directory" username))
    (add-to-list 'load-path personal-dir)
    (require (intern (concat username "-hub")))
    (setq current-username username)))

(defun unload-username (&optional username)
  "Unload the personal config of username"
  (unless username (setq username current-username))
  (unload-feature (intern (concat username "-hub")) 'force))

;; Load the current username, based on login user
(let ((username (username-from-user)))
 (if username
     (load-username username)))

(defun switch-username (username)
  "Unload the current personal config and load username's personal config"
  (interactive "sSwitch to username: ")
  (unload-username)
  ;; make sure that if the load fails we reload the stuff we just unloaded
  ;; so that we are actually loaded with current-username's config
  (condition-case err
      (load-username username)
    (error (load-username current-username)
           (signal (car err) (cdr err)))))

(provide 'personal-config)
