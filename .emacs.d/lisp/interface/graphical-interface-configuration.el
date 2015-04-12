;; Get rid of graphical interface things
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(set-fringe-mode 0)
(show-paren-mode 1)

(require 'volatile-highlights)
(volatile-highlights-mode t)

;; hide extra minor modes in the mode line
(require 'diminish)
;; (diminish 'page-break-lines-mode)
;(if (require 'volatile-highlights nil 'noerror) (diminish 'volatile-highlights-mode))
(diminish 'volatile-highlights-mode)
(if (require 'anzu nil 'noerror) (diminish 'anzu-mode))

(provide 'graphical-interface-configuration)
