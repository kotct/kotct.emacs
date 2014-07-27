(setq line-number-mode t)
(setq column-number-mode t)

(defun mode-line-configuration-internal--get-extra-information-string ()
  "Returns an extra-information string to be used in the mode-line."

  (progn
    (format "<%s>" (format-time-string "%Y-%m-%d, %H:%M:%S"))))

(defun mode-line-configuration-internal--get-minor-mode-active-string (alist-element)
  "Returns a string representing the minor mode alist-element, if the car of the alist-element is non-nil (i.e. the minor mode is active)."

  (if (car alist-element)
      (car (cdr alist-element))
    nil))

(defun mode-line-configuration-internal--get-minor-mode-string ()
  "Returns a string representing all of the active minor modes."

  (progn
    (mapcar 'mode-line-configuration-internal--get-minor-mode-active-string minor-mode-alist)))

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
                    (#("%[" 0 2 ()) "<" (:propertize ("" mode-name)) ("" mode-line-process) (:propertize ("" minor-mode-alist)) #("%n" 0 2 ()) ">" #("%]" 0 2 ()))
                    " "
                    "<%l,%c>"
                    " "
                    (vc-mode vc-mode)
                    " "
                    (:eval (mode-line-configuration-internal--get-extra-information-string))))))

(add-hook 'prog-mode-hook 'mode-line-configuration-internal--set-mode-line-format)

(run-with-timer (- 1 (+ (/ (nth 2 (current-time)) 1000000.0) (/ (nth 3 (current-time)) 1000000000000.0))) 0.25 'force-mode-line-update)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator ":")

(provide 'mode-line-configuration)
