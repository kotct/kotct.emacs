; More natural movement between splits
(global-set-key (kbd "C-S-k") 'windmove-up)
(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-l") 'windmove-right)

;o like functionality from vim, really helpful in org-mode
(global-set-key (kbd "C-o") 'newline)

;it's getting smexy up in here ;)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;HELP! I need somebody HELP! not just anybody
(global-set-key (kbd "C-h") 'help-command)

(provide 'samontea-keybindings-configuration)
