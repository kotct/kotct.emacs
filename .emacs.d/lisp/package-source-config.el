(require 'package)

(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" .
               "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" .
               "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("gnu" .
               "http://elpa.gnu.org/packages/") t)

;; Initialize the package manager
(package-initialize)

(provide 'package-source-config)
