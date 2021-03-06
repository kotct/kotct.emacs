(require 'window-management-configuration)

(global-set-key (kbd "C-s-l") 'windmove-up)
(global-set-key (kbd "C-s-k") 'windmove-down)
(global-set-key (kbd "C-s-j") 'windmove-left)
(global-set-key (kbd "C-s-;") 'windmove-right)
(global-set-key (kbd "C-M-s-l") 'buf-move-up)
(global-set-key (kbd "C-M-s-k") 'buf-move-down)
(global-set-key (kbd "C-M-s-j") 'buf-move-left)
(global-set-key (kbd "C-M-s-;") 'buf-move-right)
(global-set-key (kbd "<f11>") 'toggle-fullscreen)
(global-set-key (kbd "<f5>") 'recursive-make)

(if (require 'multi-term nil 'no-error)
    (setq term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-y" "<ESC>"))))

;it's getting smexy up in here ;)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; imenu <3 <3 <3 <3
(global-set-key (kbd "C-.") 'imenu-anywhere)

;lord knows what -probably sam because really it's pretty self-explanatory
(global-set-key (kbd "C-x C-c") 'close-current-frame-or-emacs)

;hey buddy :)
(global-set-key (kbd "C-x C-z") 'switch-username)

;;; sex[yp] operaors ;)
(global-set-key (kbd "C-M-w") 'copy-sexp-as-kill)
(global-set-key (kbd "C-M-<backspace>") 'backspace-sexp)

;;; Fancy c comment thingy
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "<RET>") (c-newline-comment-setup "<RET>"))))

;;; Comment/uncomment line
(global-set-key (kbd "C-;") 'toggle-comment-line)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;;; ace jump mode
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

;; rebind C-x C-d from list-directory to dired
(global-set-key (kbd "C-x C-d") 'dired)

(provide 'keybinding-configuration)
