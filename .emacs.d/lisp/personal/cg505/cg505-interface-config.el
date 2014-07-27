;; Dynamic right-aligned linum fill width
(setq linum-format (lambda (line)
                     (let* ((w (length (number-to-string (count-lines (point-min) (point-max)))))
                            (thing (concat " %" (number-to-string (max 2 w)) "d ")))
                       (propertize (format thing line) 'face 'linum))))

;; windmove keybindings with shift
(global-set-key (kbd "C-S-i") 'windmove-up)
(global-set-key (kbd "C-S-j") 'windmove-left)
(global-set-key (kbd "C-S-k") 'windmove-down)
(global-set-key (kbd "C-S-l") 'windmove-right)

;; woah
(load-theme 'cyberpunk)

(provide 'cg505-interface-config)
