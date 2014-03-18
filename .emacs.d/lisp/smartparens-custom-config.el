(require 'smartparens-config)

;; Automatically create a body
(defun create-body (&rest _ignored)
  "Automatically set up a body."
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode)
  (end-of-line))

;; Space after /*
(defun comment-space (&rest _ignored)
  "Space after /*"
  (insert " ")
  (backward-char 1))

;; Customizations
(defun customize-smartparens ()
  "Customizes a part of smartparens.  Adds auto-expansion of bodies."
  (sp-local-pair 'c-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'c++-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'shell-script-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'vala-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'perl-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'java-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'sh-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'csharp-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'json-mode "{" nil :post-handlers '((create-body "RET")))
  (sp-local-pair 'json-mode "[" nil :post-handlers '((create-body "RET")))

  (sp-with-modes '(c-mode
                   c++-mode
                   csharp-mode)
    (sp-local-pair "/*" "*/"
                   :unless '(sp-in-string-p)
                   :post-handlers '((comment-space "SPC")
                                    (create-body "RET"))))

  (sp-with-modes '(markdown-mode
                   gfm-mode)
    (sp-local-pair "*" "*")
    (sp-local-tag "M-*" "**" "**")
    (sp-local-pair "_" "_")
    (sp-local-tag "M-_" "__" "__")))

;; Do the customization-y stuff.
(customize-smartparens)

(provide 'smartparens-custom-config)
