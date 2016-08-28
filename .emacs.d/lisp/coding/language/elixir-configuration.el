(if (require 'elixir-mode nil 'no-error)
    (progn
      (if (require 'smart-tabs-mode nil 'no-error)
          (progn
            (add-hook 'elixir-mode-hook
                      (lambda ()
                        (setq-local indent-tabs-mode nil)
                        (setq-default elixir-indent-level 2)
                        (smart-tabs-advice indent-line-function elixir-indent-level)
                        (smart-tabs-mode f)))))))
(provide 'elixir-configuration)
