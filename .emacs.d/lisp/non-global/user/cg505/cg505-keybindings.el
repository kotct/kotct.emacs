(electric-indent-mode 0)

;; windmove keybindings with shift
(global-set-key (kbd "C-S-i") 'windmove-up)
(global-set-key (kbd "C-S-j") 'windmove-left)
(global-set-key (kbd "C-S-k") 'windmove-down)
(global-set-key (kbd "C-S-l") 'windmove-right)
(global-set-key (kbd "C-M-S-i") 'buf-move-up)
(global-set-key (kbd "C-M-S-j") 'buf-move-left)
(global-set-key (kbd "C-M-S-k") 'buf-move-down)
(global-set-key (kbd "C-M-S-l") 'buf-move-right)

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-h") 'help-command)
(global-set-key (kbd "C-x h") 'mark-whole-buffer)

(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-j") (c-newline-comment-setup "C-j"))))

(global-set-key (kbd "C-c C-f") 'sudo-edit)

(global-set-key (kbd "M-y") 'browse-kill-ring)

(global-set-key (kbd "C-x C-M-f") 'ffip)

(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(provide 'cg505-keybindings)
