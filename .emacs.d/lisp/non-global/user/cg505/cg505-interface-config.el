;; -*- eval: (rainbow-mode 1) -*-

;; Dynamic right-aligned linum fill width
(setq my-linum-format (lambda (line)
                        (let* ((w (length (number-to-string (count-lines (point-min) (point-max)))))
                               (thing (concat " %" (number-to-string (max 2 w)) "d ")))
                          (propertize (format thing line) 'face 'linum))))

(setq linum-format my-linum-format)

(fringe-mode 0)

(ido-vertical-mode 1)
(setq ido-vertical-show-count t)

;;; none of this nice stuff works with --daemon
;; (setq my-font-list '(;;"Input Mono Light" ;too lazy to fix
;;                      "Monaco"
;;                      "DejaVu Sans Mono"
;;                      "Liberation Mono"))

;; (message "got here")

;; (add-hook 'after-init-hook
;;           (lambda ()
;;             (message "sup")
;;             (some (lambda (font)
;;                     (message "bout")
;;                     (if (member font (font-family-list)) ;(not (null (x-list-fonts font)))
;;                         ;; we have the font
;;                         (progn
;;                           (message "have %s" font)
;;                           (add-to-list 'default-frame-alist `(font . ,(concat font "-10"))) t)
;;                       (progn (message "don't have %s" font) nil)))
;;                   my-font-list)
;;             (message "bros")))

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

;;; transparency yeah!!!! :D
(add-to-list 'default-frame-alist
             '(alpha . (90 . 80)))
(setq frame-title-format "%[%*%] %b")

;;rainbow-delims
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;; acheive longlines-mode type thing with visual-line-mode
(defvar visual-wrap-column nil)
(defun set-visual-wrap-column (new-wrap-column &optional buffer)
  "Force visual line wrap at NEW-WRAP-COLUMN in BUFFER (defaults
    to current buffer) by setting the right-hand margin on every
    window that displays BUFFER.  A value of NIL or 0 for
    NEW-WRAP-COLUMN disables this behavior."
  (interactive (list (read-number "New visual wrap column, 0 to disable: " (or visual-wrap-column fill-column 0))))
  (if (and (numberp new-wrap-column)
           (zerop new-wrap-column))
      (setq new-wrap-column nil))
  (with-current-buffer (or buffer (current-buffer))
    (visual-line-mode t)
    (set (make-local-variable 'visual-wrap-column) new-wrap-column)
    (add-hook 'window-configuration-change-hook 'update-visual-wrap-column nil t)
    (let ((windows (get-buffer-window-list)))
      (while windows
        (when (window-live-p (car windows))
          (with-selected-window (car windows)
            (update-visual-wrap-column)))
        (setq windows (cdr windows))))))
(defun update-visual-wrap-column ()
  (if (not visual-wrap-column)
      (set-window-margins nil nil)
    (let* ((current-margins (window-margins))
           (right-margin (or (cdr current-margins) 0))
           (current-width (window-width))
           (current-available (+ current-width right-margin)))
      (if (<= current-available visual-wrap-column)
          (set-window-margins nil (car current-margins))
        (set-window-margins nil (car current-margins)
                            (- current-available visual-wrap-column))))))

(defun cg505-interface-config-unload-function ()
  ;; unload theme
  (dolist (loaded-theme custom-enabled-themes)
    (disable-theme loaded-theme)))

(provide 'cg505-interface-config)
