(defun mode-line-configuration-internal--get-extra-information-string ()
  "Returns an extra-information string to be used in the mode-line."

  (progn
    (format "\{%s\}" (format-time-string "%Y-%m-%d, %H:%M:%S"))))

(defun mode-line-configuration-internal--set-mode-line-format ()
  "Sets the mode-line-format to the value that it should be set to globally."

  (interactive)
  (progn
    (setq-default mode-line-format
                  '("%e"
                    mode-line-mule-info
                    mode-line-client
                    "<%*%+>"
                    "%@"
                    mode-line-frame-identification
                    (#("%16b" 0 4 (local-map mode-line-highlight face mode-line-buffer-id)))
                    " "
                    "(%l,%c)"
                    " "
                    (vc-mode vc-mode)
                    " "
                    (:eval (mode-line-configuration-internal--get-extra-information-string))))))

(mode-line-configuration-internal--set-mode-line-format)

(provide 'samontea-mode-line-configuration)
