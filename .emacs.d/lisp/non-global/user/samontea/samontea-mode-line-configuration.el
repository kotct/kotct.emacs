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
                    mode-line-misc-info))));

;; Modeline battery notifier config & enabling
(setq-default battery-mode-line-format "[%b%p%%, %t] ")
(display-battery-mode)

;; Modeline clock config & enabling
(setq display-time-format "{%Y-%m-%d, %H:%M}")
(setq display-time-default-load-average nil)
(display-time-mode)

;; Enable the mode line config
(mode-line-configuration-internal--set-mode-line-format)

(provide 'samontea-mode-line-configuration)
