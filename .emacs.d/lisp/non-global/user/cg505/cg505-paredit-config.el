(require 'paredit)

;; Use paredit mode, not smartparens
(defun switch-to-paredit ()
  (paredit-mode 1)
  (smartparens-mode 0)
  (smartparens-strict-mode 0))
(add-hook 'lisp-mode-hook 'switch-to-paredit)
(add-hook 'emacs-lisp-mode-hook 'switch-to-paredit)
(add-hook 'slime-repl-mode-hook 'switch-to-paredit)
;; make C-j work in *scratch*
(add-hook 'lisp-interaction-mode-hook
          (lambda ()
            (let ((oldmap (cdr (assoc 'paredit-mode minor-mode-map-alist)))
                  (newmap (make-sparse-keymap)))
              (set-keymap-parent newmap oldmap)
              (define-key newmap (kbd "C-j") nil)
              (make-local-variable 'minor-mode-overriding-map-alist)
              (push `(paredit-mode . ,newmap) minor-mode-overriding-map-alist))))

(provide 'cg505-paredit-config)
