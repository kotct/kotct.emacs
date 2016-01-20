(setq username-config-alist
      '((() . "base-config")
        (("cooperc" "Christopher" "coope157") . "cg505")
        (("samm" "merciers" ("sam" "jupiter" "jupiter.netgear.com") "smercier") . "samontea")
        (("samc" ("sam" "minint-aimu6do" "trash")) . "Sammidysam")
        ;; (("user" ("altuser" "host")  "altaltuser") . "test")
        ))

(defun username-from-user (&optional user host)
  "Convert from a login user (whoami) to a username"
  (unless user (setq user (user-login-name)))
  (unless host (setq host (system-name)))
  (assoc-default (cons user host)
                 username-config-alist
                 (lambda (alist-val user-host)
                   (cl-some (lambda (elem)
                              (if (listp elem)
                                  (and (equal (car user-host) (car elem))
                                       (member (cdr user-host) (cdr elem)))
                                (equal (car user-host) elem)))
                            alist-val))))

(setq current-username nil)

(defun load-username (username)
  "Load the personal config of username"
  (let ((personal-dir (concat "~/.emacs.d/lisp/non-global/user/" username)))
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
     (load-username username)
   (load-username "base-config")))

(defun switch-username (&optional username)
  "Unload the current personal config and load username's personal config"
  (interactive)
  (unless username (setq username
                         (ido-completing-read "Switch to username: "
                                              (cddr (directory-files "~/.emacs.d/lisp/non-global/user")))))
  (unload-username)
  ;; make sure that if the load fails we reload the stuff we just unloaded
  ;; so that we are actually loaded with current-username's config
  (condition-case err
      (load-username username)
    (error (load-username current-username)
           (signal (car err) (cdr err))))
  ;; maybe then also reload/rerun all the hooks and stuff for open buffers
  )

(provide 'user-config-system)
