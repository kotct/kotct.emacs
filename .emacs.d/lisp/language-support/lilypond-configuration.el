;; Configures emacs to work nicely with LilyPond files.

(if (require 'lilypond-mode nil 'no-error)
    (progn
      (add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
      (add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))

      (add-hook 'LilyPond-mode-hook
                (lambda ()
                  (setq indent-tabs-mode t
                        tab-width global-tab-width)))

      (setq LilyPond-indent-level global-tab-width)
      (message "%16s ... OK!" "LilyPond"))
  (progn (message "%16s ... FAIL!" "LilyPond")))

(provide 'lilypond-configuration)
