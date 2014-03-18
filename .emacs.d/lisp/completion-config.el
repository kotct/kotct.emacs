;; Minibuffer completion
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Smex-y stuff
(require 'smex)
(smex-initialize)

;; Actual autocompletion.
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(provide 'completion-config)
