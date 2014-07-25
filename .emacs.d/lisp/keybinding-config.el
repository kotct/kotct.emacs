;; Make emacs work with the global (X) clipboard
(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-y") 'clipboard-yank)

;; Super-kill for quick line-killing (like vim's dd)
(global-set-key (kbd "s-k") 'kill-whole-line)

;; Handy buffer killing shortcut
(global-set-key (kbd "M-k") 'kill-buffer)

;; Change the replace keybinding to work by regexps, not strings, because literals are a pain in the ass.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)

;; Smex-related replacements
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Always indent on newline
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'newline-and-indent)

;; Window manipulation
(global-set-key (kbd "C-s-i") 'windmove-up)
(global-set-key (kbd "C-s-j") 'windmove-left)
(global-set-key (kbd "C-s-k") 'windmove-down)
(global-set-key (kbd "C-s-l") 'windmove-right)
(global-set-key (kbd "C-s-u") 'delete-window)
(global-set-key (kbd "C-S-i") 'windmove-up)
(global-set-key (kbd "C-S-j") 'windmove-left)
(global-set-key (kbd "C-S-k") 'windmove-down)
(global-set-key (kbd "C-S-l") 'windmove-right)
;(global-set-key (kbd "C-S-u") 'delete-window) ; won't work because unicode stuff

;; Use BRMake to compile with key "f5"
(global-set-key (kbd "<f5>") 'brmake-compile-using-nearest-compilation-file)

;; Fullscreen-y stuff
(require 'custom-fullscreen)
(global-set-key (kbd "<f11>") 'custom-toggle-fullscreen)

(provide 'keybinding-config)
