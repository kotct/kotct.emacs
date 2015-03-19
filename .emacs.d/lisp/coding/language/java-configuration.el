(require 'eclim)
(global-eclim-mode)

;;; run with C-c C-e c
(add-hook 'java-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-e c") 'eclim-run-class)))

;;; autocomplete
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(provide 'java-configuration)
