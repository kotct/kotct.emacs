(require 'window-management-configuration)

(global-set-key (kbd "C-s-l") 'windmove-up)
(global-set-key (kbd "C-s-k") 'windmove-down)
(global-set-key (kbd "C-s-j") 'windmove-left)
(global-set-key (kbd "C-s-;") 'windmove-right)
(global-set-key (kbd "<f11>") 'toggle-fullscreen)

;HELP! I need somebody HELP! not just anybody
(global-unset-key (kbd "C-h"))
(global-set-key (kbd "C-x h") 'help-command)

(if (require 'multi-term nil 'no-error)
    (setq term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-y" "<ESC>"))))

;it's getting smexy up in here ;)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;lord knows what
(global-set-key (kbd "C-x C-c") 'close-current-frame-or-emacs)

;hey buddy :)
(global-set-key (kbd "C-x C-z") 'switch-username)

(global-set-key (kbd "C-M-w") 'copy-sexp-as-kill)

(provide 'keybinding-configuration)
