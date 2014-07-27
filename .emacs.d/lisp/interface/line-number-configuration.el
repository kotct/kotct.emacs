(setq linum-format " %d ")
(global-linum-mode 1)

(if (require 'linum-off nil 'noerror)
    (progn
      (add-to-list 'linum-disabled-modes-list 'package-menu-mode)
      (add-to-list 'linum-disabled-modes-list 'magit--mode)))

(linum-on)

(provide 'line-number-configuration)
