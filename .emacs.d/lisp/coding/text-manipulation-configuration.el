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

;; Backspace sexp
(defun backspace-sexp (arg)
  "Kill sexp before the cursor (backspace for sexp's)."
  (interactive "p")
  (let ((beg (point))
        (parse-sexp-ignore-comments t))
    (backward-sexp arg)
    (clipboard-kill-region (point) beg)))

(provide 'text-manipulation-configuration)
