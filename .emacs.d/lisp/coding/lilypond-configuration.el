(if (require 'lilypond-mode nil 'no-error)
    (progn
      (add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
      (add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))

      (add-hook 'LilyPond-mode-hook
                (lambda ()
                  (setq indent-tabs-mode t
                        tab-width global-tab-width)))

      (setq LilyPond-indent-level global-tab-width))
  (progn (message "Skipping LilyPond support.")))

(provide 'lilypond-configuration)
