;; -*- eval: (rainbow-mode 1) -*-

;;; THEMES
(setq theme-list '(cyberpunk
                   sanityinc-tomorrow-night
                   sanityinc-tomorrow-blue
                   sanityinc-tomorrow-eighties
                   sanityinc-tomorrow-bright
                   zenburn
                   solarized-dark
                   monokai
                   ample
                   ample-flat
                   brin
                   granger
                   spolsky
                   graham
                   odersky
                   hickey
                   fogus
                   wilson
                   junio
                   smyx
                   warm-night
                   jazz
                   tuntu
                   material
                   twilight-anti-bright
                   spacegray
                   ;; darktooth ;disabled for now b/c "color-229" can't be loaded
                   ;possibly due to init load: (display-graphic-p) => nil?
                   purple-haze))

(defun switch-theme (&optional theme)
  (interactive "P")
  (if (not theme)
      (setq theme (nth (random (length theme-list)) theme-list))
    (if (numberp (car theme))
        (setq theme (my-ido-completing-symbol-read "Select theme: " theme-list))))
  (dolist (loaded-theme custom-enabled-themes)
    (disable-theme loaded-theme))
  (message "Loading theme %s" theme)
  (enable-theme theme))

(defun current-theme ()
  (interactive)
  (message "%s" (first custom-enabled-themes)))

;; load all the themes
(mapc (lambda (x) (load-theme x 'no-confirm 'no-enable)) theme-list)

;; make various theme fixes
;; idk whytf we have to have the theme enabled, but whatevs
(let ((class '((class color) (min-colors 89))))
  (enable-theme 'material)
  (custom-theme-set-faces
   'material
   `(mode-line ((,class
                 (:foreground "#ffffff" :background "#1c1f26" ;:family "Lucida Grande"
                              )))))
  (disable-theme 'material)

  (enable-theme 'jazz)
  (custom-theme-set-faces
   'jazz
   `(show-paren-mismatch ((,class
                           (:foreground "#151515" :background "#953331" :weight bold))))
   `(show-paren-match ((,class
                        (:foreground "#151515" :background "#385e6b" :weight bold)))))
  (disable-theme 'jazz)

  (enable-theme 'hickey)
  (custom-theme-set-faces
   'hickey
   `(region ((t
              (;:foreground "#465459"
               :background "#36404D")))))
  (disable-theme 'hickey)

  ;; TODO this for all sanityinc-tomorrows
  (enable-theme 'sanityinc-tomorrow-bright)
  (custom-theme-set-faces
   'sanityinc-tomorrow-bright
   `(linum ((,class
             (:background "#000000" :foreground "#b9ca4a" :italic nil)))))
  (disable-theme 'sanityinc-tomorrow-bright))
;; more todos in this regard
; active modeline font for spacegrey
; linum graham, tomorrow-blue, tomorrow-night
; linum color odersky


;; overrides to reset weird theme behaviors I dislike
(advice-add 'enable-theme :after
            (lambda (&rest ignore)
              (set-face-attribute 'mode-line nil :box nil)
              (set-face-attribute 'mode-line-inactive nil :box nil)
              (setq linum-format my-linum-format)
              (fringe-mode 0)
              ))

;; set random theme on start
(switch-theme)
(run-at-time t (* 30 60) 'switch-theme)

(defun cg505-interface-config-unload-function ()
  ;; unload theme
  (dolist (loaded-theme custom-enabled-themes)
    (disable-theme loaded-theme)))

(provide 'cg505-theme-config)
