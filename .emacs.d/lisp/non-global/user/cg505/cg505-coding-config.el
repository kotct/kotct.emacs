;; I don't like delete-selection-mode
(setq delete-selection-mode nil)

;;smartparens bindings like paredit
(define-key sp-keymap (kbd "C-M-f") #'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") #'sp-backward-sexp)
(define-key sp-keymap (kbd "C-M-u") #'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-d") #'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-p") #'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-M-n") #'sp-up-sexp)
;; Deleting and killing
(define-key sp-keymap (kbd "C-M-k") #'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") #'sp-copy-sexp)
;; Depth changing
(define-key sp-keymap (kbd "M-s") #'sp-splice-sexp)
(define-key sp-keymap (kbd "M-<up>") #'sp-splice-sexp-killing-backward)
(define-key sp-keymap (kbd "M-<down>") #'sp-splice-sexp-killing-forward)
(define-key sp-keymap (kbd "M-r") #'sp-splice-sexp-killing-around)
(define-key sp-keymap (kbd "M-?") #'sp-convolute-sexp)
;; Barfage & Slurpage
(define-key sp-keymap (kbd "C-)")  #'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<right>") #'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-}")  #'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-<left>") #'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-(")  #'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-<left>") #'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-{")  #'2sp-backward-barf-sexp)
(define-key sp-keymap (kbd "C-M-<right>") #'sp-backward-barf-sexp)
;; Miscellaneous commands
(define-key sp-keymap (kbd "M-S") #'sp-split-sexp)
(define-key sp-keymap (kbd "M-J") #'sp-join-sexp)
(define-key sp-keymap (kbd "C-M-t") #'sp-transpose-sexp)

;; Some additional bindings for strict mode, which is always enabled so just use sp-keymap
(define-key sp-keymap (kbd "M-q") #'sp-indent-defun)
(define-key sp-keymap (kbd "C-j") #'sp-newline)

(smartparens-global-strict-mode t)

(provide 'cg505-coding-config)
