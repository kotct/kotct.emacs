(require 'smartparens-config)

;; Function relating to customizing something relating to smartparens
(defun create-body (&rest _ignored)
  "Automatically set up a body."
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode)
  (end-of-line)
  ;; Re-indent everything to fix problems
  (save-excursion
	(forward-line -1)
	(indent-according-to-mode)
	(forward-line)
	(indent-according-to-mode)
	(forward-line)
	(indent-according-to-mode))
  ;; Indent again
  (indent-according-to-mode))

(defun space-and-space-on-each-side (&rest _ignored)
  "Put a space on each side."
  (insert " ")
  (backward-char 1))

(defun space-on-each-side (&rest _ignored)
  "Insert space, then space-and-space-on-each-side."
  (insert " ")
  (space-and-space-on-each-side))

;; possibly unused
(defun erb-end (&rest _ignored)
  "Insert <% end %> on line below current line."
  (save-excursion
	(end-of-line)
	(newline)
	(insert "<% end %>")
	(indent-according-to-mode)))

;; There *can* actually be whitespace between "#" and "include".
;; If this function is for use by others, make sure to handle that correctly.
(defun c-in-preprocessor-include-p (&rest _ignored)
  "Sees if the first character of the line is '#', which marks it to be a preprocessor line."
  (save-excursion
	(back-to-indentation)
	(when (string= (buffer-substring-no-properties (point) (+ (point) (length "#include"))) "#include")
	  "t")))

(defun sp-web-mode-is-code-context (id action context)
  (when (and (eq action 'insert)
             (not (or (get-text-property (point) 'part-side)
                      (get-text-property (point) 'block-side))))
    t))

(sp-with-modes '(
                 c-mode
                 c++-mode
                 shell-script-mode
                 vala-mode
                 perl-mode
                 java-mode
                 sh-mode
                 csharp-mode
                 json-mode
                 scss-mode
                 js-mode
                 web-mode
                 less-css-mode
                 )
  (sp-local-pair "{" nil :post-handlers '((create-body "RET"))))
(sp-local-pair 'json-mode "[" nil :post-handlers '((create-body "RET")))

(sp-with-modes '(
                 c-mode
                 c++-mode
                 csharp-mode
                 web-mode
                 )
  (sp-local-pair "/*" "*/"
                 :unless '(sp-in-string-p)
                 :post-handlers '(
                                  (space-and-space-on-each-side "SPC")
                                  (create-body "RET")
                                  )))
(sp-with-modes '(
                 c-mode
                 c++-mode
                 )
  (sp-local-pair "<" ">"
                 :when '(c-in-preprocessor-include-p)))

(sp-with-modes '(
                 markdown-mode
                 gfm-mode
                 )
  (sp-local-pair "*" "*")
  (sp-local-tag "M-*" "**" "**")
  (sp-local-pair "_" "_")
  (sp-local-tag "M-_" "__" "__"))

(sp-with-modes '(web-mode)
  (sp-local-pair "%" "%"
                 :unless '(sp-in-string-p sp-point-after-word-p sp-in-comment-p)
                 :post-handlers '(
                                  (space-and-space-on-each-side "SPC")
                                  (space-on-each-side "=" "#")
                                  ))
  (sp-local-pair "<" nil :when '(sp-web-mode-is-code-context)))

(sp-local-pair 'LilyPond-mode "{" nil :post-handlers '((space-and-space-on-each-side "SPC") (create-body "RET")))

(provide 'smartparens-configuration)
