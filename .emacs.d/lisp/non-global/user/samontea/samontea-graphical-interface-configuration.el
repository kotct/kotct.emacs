(set-face-attribute 'default nil :height 100)

(defun create-normal-layout ()
  "Creates the layout I use generally when working."
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (split-window-vertically)
  (other-window 1)
  (multi-term)
  (other-window 1))

;;; transparency yeah!!!! :D
(add-to-list 'default-frame-alist
             '(alpha . (95 . 80)))

(provide 'samontea-graphical-interface-configuration)
