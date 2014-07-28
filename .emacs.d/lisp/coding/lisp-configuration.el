;; Slime
(if (require 'slime-autoloads nil 'no-error)
    ;; Please put the following line in your machine config
    ;; (setq inferior-lisp-program "/path/to/my/lisp/program")
    (setq slime-contribs '(slime-fancy slime-asdf slime-banner slime-indentation slime-autodoc))

  (add-hook 'lisp-mode-hook
            (lambda ()
              (slime-mode t)))

  (add-hook 'inferior-lisp-mode-hook
            (lambda ()
              (inferior-slime-mode t))))

(add-hook 'lisp-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(provide 'lisp-configuration)
