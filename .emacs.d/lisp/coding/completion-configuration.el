;; Configure ido, use it for command-related things.
(if (require 'ido nil 'no-error)
    (progn
      (ido-mode t)
      (setq ido-enable-flex-matching t)))

;; Configure smex.
(if (require 'smex nil 'no-error)
    (progn
      (smex-initialize)
      (setq ido-enable-flex-matching t)))

;; Configure autocompletion.
(if (require 'auto-complete-config nil 'no-error)
    (progn
      (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
      (ac-config-default)))

(provide 'completion-configuration)
