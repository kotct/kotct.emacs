(electric-indent-mode 0)

;; windmove keybindings with shift
(global-set-key (kbd "C-S-i") 'windmove-up)
(global-set-key (kbd "C-S-j") 'windmove-left)
(global-set-key (kbd "C-S-k") 'windmove-down)
(global-set-key (kbd "C-S-l") 'windmove-right)

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-h") 'help-command)

(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-j") (c-newline-comment-setup "C-j"))))

(provide 'cg505-keybindings)
