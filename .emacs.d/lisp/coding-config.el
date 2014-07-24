;; If we have a region marked, and we start typing, delete it.
(delete-selection-mode t)

;; Copy sexp as kill
(setq *sexp-copy-count* 0)
(defun count-commands () (setq *sexp-copy-count* (+ 1 *sexp-copy-count*)))
(add-hook 'pre-command-hook 'count-commands)
(defun copy-sexp-as-kill (arg)
  "Save sexp as if it were killed, but don't kill it."
  (interactive "p")
  (let ((beg (point)))
    (let ((parse-sexp-ignore-comments t))
      (forward-sexp arg))
    (if (= 1 *sexp-copy-count*)
        (append-next-kill))
    (clipboard-kill-ring-save beg (point))
    (setq *sexp-copy-count* 0)))

(global-set-key "\e\^W" 'copy-sexp-as-kill)

;; Show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Blink matching parentheses
(setq blink-matching-paren t)

;; Fic-mode
(require 'fic-mode)
(add-hook 'prog-mode-hook 'fic-mode)

;; Smartparens config
(require 'smartparens-custom-config)

(provide 'coding-config)
