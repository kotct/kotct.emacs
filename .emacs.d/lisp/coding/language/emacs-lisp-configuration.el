(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(font-lock-add-keywords 'emacs-lisp-mode
                        '(("setq" . font-lock-builtin-face)
                          ("load-theme" . font-lock-builtin-face)
                          ("add-hook" . font-lock-builtin-face)
                          ("add-to-list" . font-lock-builtin-face)))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(provide 'emacs-lisp-configuration)
