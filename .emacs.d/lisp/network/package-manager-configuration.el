(require 'package)

;; Add Marmalade repository
(add-to-list 'package-archives
             '("marmalade" .
               "https://marmalade-repo.org/packages/") t)

;; Add ELPA repository
(add-to-list 'package-archives
             '("elpa" .
               "http://tromey.com/elpa/") t)

;; Add MELPA repository
(add-to-list 'package-archives
             '("melpa" .
               "https://melpa.org/packages/") t)

;; Add GNU repository
(add-to-list 'package-archives
             '("gnu" .
               "https://elpa.gnu.org/packages/") t)

;; Initialize the package manager.
(package-initialize)

(provide 'package-manager-configuration)
