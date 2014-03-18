;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Have a newline at the end of the file when we save
(setq require-final-newline t)

;; Continuous PDF viewing is helpful
(setq doc-view-continuous t)

;; Load across symlinks
(setq vc-follow-symlinks t
      vc-suppress-confirm t)

;; Autosaves
(setq auto-save-default t)
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.saves"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; C style stuffies
(setq c-block-comment-prefix (quote set-from-style))
(setq c-default-style (quote
                       ((c-mode . "linux")
                        (java-mode . "java")
                        (awk-mode . "awk"))))

;; Global revert
(setq global-auto-revert-mode t)

;; Don't compile SCSS on save
(setq scss-compile-at-save nil)

(provide 'behavior-config)
