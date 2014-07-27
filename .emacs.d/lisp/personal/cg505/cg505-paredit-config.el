(require 'paredit)

;; Use paredit mode, not smartparens
(defun switch-to-paredit ()
  (paredit-mode t)
  (smartparens-mode nil))
(add-hook 'lisp-mode-hook 'switch-to-paredit)
(add-hook 'emacs-lisp-mode-hook 'switch-to-paredit)

(provide 'cg505-paredit-config)
