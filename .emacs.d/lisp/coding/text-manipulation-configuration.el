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

;;; Cool C newline commend checker
;; note, this randomly fails sometimes. If you just undo
;; and do it again, it works. If you can figure out why,
;; please fix it.
(defun custom-c-newline-check-comment ()
  "Advanced `newline' command for C and C++ multiline block comments.
Inserts a `*' at the beginning of the new line if inside of a comment."
  (interactive "*")
  (let* ((last (point))
         (is-inside
          (if (search-backward "*/" nil t)
              ;; if there are some comment endings - search forward
              (search-forward "/*" last t)
            ;; only comment - search backward
            (goto-char last)
            (search-backward "/*" nil t))))
    (goto-char last)
    (newline-and-indent)
    (when is-inside
      (progn
        (delete-backward-char 1)
        (let ((last2 (point))
              (mychar (progn (previous-line)
                             (char-after))))
          (goto-char last2)
          (if (or (eq mychar ?\/) (eq mychar ?\ ))
           (insert " ")))
        (insert "* "))
      )))

;;; comment/uncomment line
;; http://endlessparentheses.com/implementing-comment-line.html
(defun toggle-comment-line (n)
  "Comment or uncomment current line and leave point after it.
With positive prefix, apply to N lines including current one.
With negative prefix, apply to -N lines above."
  (interactive "p")
  (let ((range (list (line-beginning-position)
                     (goto-char (line-end-position n)))))
    (comment-or-uncomment-region
     (apply #'min range)
     (apply #'max range)))
  (forward-line 1)
  (back-to-indentation))

(provide 'text-manipulation-configuration)
