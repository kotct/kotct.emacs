;; I don't like delete-selection-mode
(setq delete-selection-mode nil)

;; doesn't really belong here but yeah
(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;;smartparens bindings like paredit
(define-key smartparens-mode-map (kbd "C-M-f") #'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "C-M-b") #'sp-backward-sexp)
(define-key smartparens-mode-map (kbd "C-M-u") #'sp-backward-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-d") #'sp-down-sexp)
(define-key smartparens-mode-map (kbd "C-M-p") #'sp-backward-down-sexp)
(define-key smartparens-mode-map (kbd "C-M-n") #'sp-up-sexp)
;; Deleting and killing
(define-key smartparens-mode-map (kbd "C-M-k") #'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-M-w") #'sp-copy-sexp)
;; Depth changing
(define-key smartparens-mode-map (kbd "M-s") #'sp-splice-sexp)
(define-key smartparens-mode-map (kbd "M-<up>") #'sp-splice-sexp-killing-backward)
(define-key smartparens-mode-map (kbd "M-<down>") #'sp-splice-sexp-killing-forward)
(define-key smartparens-mode-map (kbd "M-r") #'sp-splice-sexp-killing-around)
(define-key smartparens-mode-map (kbd "M-?") #'sp-convolute-sexp)
;; Barfage & Slurpage
(define-key smartparens-mode-map (kbd "C-)")  #'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-<right>") #'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-}")  #'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-<left>") #'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-(")  #'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") #'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-{")  #'2sp-backward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-M-<right>") #'sp-backward-barf-sexp)
;; Miscellaneous commands
(define-key smartparens-mode-map (kbd "M-S") #'sp-split-sexp)
(define-key smartparens-mode-map (kbd "M-J") #'sp-join-sexp)
(define-key smartparens-mode-map (kbd "C-M-t") #'sp-transpose-sexp)

;; Some additional bindings for strict mode, which is always enabled so just use smartparens-mode-map
(define-key smartparens-mode-map (kbd "M-q") #'sp-indent-defun)
(define-key smartparens-mode-map (kbd "C-j") #'sp-newline)

(smartparens-global-strict-mode t)

(provide 'cg505-coding-config)
