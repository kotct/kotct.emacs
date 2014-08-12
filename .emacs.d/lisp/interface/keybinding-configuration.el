(require 'window-management-configuration)

(global-set-key (kbd "C-s-l") 'windmove-up)
(global-set-key (kbd "C-s-k") 'windmove-down)
(global-set-key (kbd "C-s-j") 'windmove-left)
(global-set-key (kbd "C-s-;") 'windmove-right)
(global-set-key (kbd "<f11>") 'toggle-fullscreen)

(global-unset-key (kbd "C-h"))
(if (require 'multi-term nil 'no-error)
    (setq term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-y" "<ESC>"))))

(global-set-key (kbd "C-x C-c") 'close-current-frame-or-emacs)

(global-set-key (kbd "C-x C-z") 'switch-username)

(global-set-key (kbd "C-M-w") 'copy-sexp-as-kill)

(provide 'keybinding-configuration)
