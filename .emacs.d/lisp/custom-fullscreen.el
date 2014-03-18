;; Toggles the current frame's fullscreen-ness
(defun custom-toggle-fullscreen (&optional f)
  "Toggles the current frame's fullscreen-ness"
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(provide 'custom-fullscreen)
