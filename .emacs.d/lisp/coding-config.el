;; If we have a region marked, and we start typing, delete it.
(delete-selection-mode t)

;; Copy sexp as kill
(defun copy-sexp-as-kill (arg)
  "Save sexp as if it were killed, but don't kill it."
  (interactive "p")
  (let ((beg (point)))
    (let ((parse-sexp-ignore-comments t))
      (forward-sexp arg))
    (if (= 1 *rlg-count*)
        (append-next-kill))
    (clipboard-kill-ring-save beg (point))
    (setq *rlg-count* 0)))

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
