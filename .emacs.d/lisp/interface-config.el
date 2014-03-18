;; Hide the menubar
(menu-bar-mode -1)

;; Hide the toolbar
(if (functionp 'tool-bar-mode)
    (tool-bar-mode -1))

;; Hide the scrollbar (it's for nübs)
(scroll-bar-mode -1)

;; Line numbering and column numbering
(add-hook 'prog-mode-hook (lambda () (linum-mode t)))
(setq linum-format " %d ")
(setq line-number-mode t)
(setq column-number-mode t)
(setq global-linum-mode t)

;; Disable alert bell (it's annoying)
(setq ring-bell-function 'ignore)

;; Color themes
;(load-theme 'wombat)
;(load-theme 'tango t)
;(load-theme 'tango-dark t)
(load-theme 'ample t)
;(load-theme 'monokai t)
;(load-theme 'molokai t)
;(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)
;(load-theme 'afternoon t)

;; (if (display-graphic-p)
;;     (progn
;;       (load-theme 'monokai t))
;;   (progn
;;     (load-theme 'wombat t))

;; Clock configuration
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 15)
(display-time-mode t)

;; Change unique buffer name styles
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator ":")

;; Size 9 font for the stuffs.
;(set-face-attribute 'default nil :height 90)

;; Disable the fringe on emacs buffers.
(custom-set-variables
 '(fringe-mode 0 nil (fringe)))

(provide 'interface-config)
