(require 'monokai-theme)

(setq theme-list '(cyberpunk
                   monokai
                   junio
                   wombat
                   wilson
                   twilight-anti-bright
                   jazz))

(defun switch-theme (&optional theme)
  (interactive)
  (unless theme (setq theme (nth (random (length theme-list)) theme-list)))
  (dolist (loaded-theme custom-enabled-themes)
    (disable-theme loaded-theme))
  (load-theme theme t))

(defun current-theme ()
  (interactive)
  (message "%s" (first custom-enabled-themes)))

;;; set random theme on start
(switch-theme)

(provide 'samontea-theme-configuration)
