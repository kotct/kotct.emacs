;; Dynamic right-aligned linum fill width
(setq linum-format (lambda (line)
                     (let* ((w (length (number-to-string (count-lines (point-min) (point-max)))))
                            (thing (concat " %" (number-to-string (max 2 w)) "d ")))
                       (propertize (format thing line) 'face 'linum))))

(provide 'cg505-interface-config)
