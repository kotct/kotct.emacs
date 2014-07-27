(defun set-font-size (font-size)
  "Sets the font hegiht to `font-size'"

  (interactive "nEnter the font size: ")

  (set-face-attribute 'default nil
                      :height font-size))

(provide 'set-font-size)
