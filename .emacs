;; load-path expansion
(setq load-path (append '("~/.emacs.d/lisp"
                          "~/.emacs.d/lisp/language-support"
                          "~/local-elisp") load-path))

(require 'pre-config-config)
(require 'package-source-config)
(require 'external-package-config)
(require 'command-replacement-config)
(require 'brmake)
(require 'keybinding-config)
(require 'interface-config)
(require 'coding-config)
(require 'behavior-config)
(require 'indentation-config)
(require 'completion-config)
(require 'language-support-hub)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds (quote ("http://xkcd.com/atom.xml" "https://github.com/four04.private.atom?token=1566689__eyJzY29wZSI6IkF0b206L2ZvdXIwNC5wcml2YXRlLmF0b20iLCJleHBpcmVzIjoyOTcyOTI3ODA3fQ==--c669659b7ae51836d8a2826c9b90953a0345d9c1" "http://victoriawasbored.blogspot.com/feeds/posts/default")))
 '(fringe-mode 0 nil (fringe)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
