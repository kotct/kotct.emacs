;; Some file associations

(if (require 'ruby-mode nil 'no-error)
    (progn
      (add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
      (add-to-list 'auto-mode-alist '("\\Rakefile\\'" . ruby-mode))
      (add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))
      (add-to-list 'auto-mode-alist '("\\Guardfile\\'" . ruby-mode))
      (message "%16s ... OK!" "Ruby"))
  (progn (message "%16s ... FAIL!" "Ruby")))

(provide 'ruby-configuration)
