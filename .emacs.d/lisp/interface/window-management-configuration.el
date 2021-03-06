(defun toggle-fullscreen ()
  "Toggles the fullscreen aspect of the frame using wmctrl"
  (interactive)
  (if (eq window-system 'x)
      (if (eq (shell-command "wmctrl --help > /dev/null") 0)
          (progn
            (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
        (progn
          (message (format "This Emacs configuration uses wmctrl for fullscreen toggling. Please install wmctrl to use this command."))))
    (progn
      ;; TODO: Windows/Mac OSX Support here? Linux supremacy for now.
      (message (format "Window system is not X, cannot make this window full-screen!")))))

(defun close-current-frame-or-emacs (&optional arg)
  "Closes the current frame or Emacs.

Kills Emacs if 1 frame is in (frame-list) and not a server process,
or if passed an argument, but just current frame if otherwise."
  (interactive "P")
  (message "%s" arg)

  (condition-case nil
      (let ((frame-list (frame-list)))
        (if (or (= (length frame-list) 1) arg)
            (if (not (boundp 'server-process))
                (if (y-or-n-p "Kill Emacs?")
                    (kill-emacs)
                  (message "Didn't do anything, promise!"))
              (if (y-or-n-p "Kill Emacs?")
                  (kill-emacs)
                (if (y-or-n-p "Delete current frame?")
                    (delete-frame)
                  (message "Didn't do anything, promise!"))))
          (delete-frame)))
    (error (kill-emacs))))

;; Set yes-or-no prompt to y or n
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'window-management-configuration)
