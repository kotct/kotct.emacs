(if (require 'org nil 'no-error)
    (progn
      (add-hook 'org-mode-hook
                (lambda () (setq indent-tabs-mode nil)))
      (message "%16s ... OK!" "ORG"))
  (progn (message "%16s ... FAIL!" "ORG")))

(provide 'org-configuration)
