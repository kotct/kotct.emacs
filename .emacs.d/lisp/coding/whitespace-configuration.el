;; Ensure newline at end of file on save.
(setq require-final-newline t)

;; Delete trailing whitespace on lines before save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'whitespace-configuration)
