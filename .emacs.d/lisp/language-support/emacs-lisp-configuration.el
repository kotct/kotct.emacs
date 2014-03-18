;; Don't use tabs in emacslisp
(add-hook 'emacs-lisp-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(provide 'emacs-lisp-configuration)
