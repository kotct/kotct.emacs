(if (require 'ruby-mode nil 'no-error)
    (progn
      (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
      (add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
      (add-to-list 'auto-mode-alist '("\\Rakefile\\'" . ruby-mode))
      (add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))
      (add-to-list 'auto-mode-alist '("\\Guardfile\\'" . ruby-mode))

      (if (require 'smart-tabs-mode nil 'no-error)
          (progn
            (setq ruby-indent-level tab-width)
            (smart-tabs-advice ruby-indent-line ruby-indent-level)))
      (setq ruby-indent-tabs-mode t)
      (add-hook 'ruby-mode-hook (lambda () (smart-tabs-mode t))))
  (progn (message "Skipping Ruby support.")))

(provide 'ruby-configuration)
