(load-file "~/.emacs.d/init-lib.el")
(require 'init-lib)

(init--add-directory-to-load-path "~/.emacs.d/elpa/")
(init--add-directory-to-load-path "~/.emacs.d/lisp/")

;Put machine dependent lisp configs in ~/elisp/ :) 
(init--add-directory-to-load-path "~/elisp/")

(require 'interface-hub)
(require 'network-hub)
(require 'coding-hub)
(require 'non-global-hub)
