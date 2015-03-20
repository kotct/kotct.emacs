;; windmove keybindings with shift
(global-set-key (kbd "C-S-i") 'windmove-up)
(global-set-key (kbd "C-S-j") 'windmove-left)
(global-set-key (kbd "C-S-k") 'windmove-down)
(global-set-key (kbd "C-S-l") 'windmove-right)

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-h") 'help-command)

(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'custom-c-newline-check-comment)))

(provide 'cg505-keybindings)
