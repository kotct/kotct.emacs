(setq global-tab-width 4)
(setq-default tab-width global-tab-width)

(require 'language-hub)

(if (require 'smart-tabs nil 'no-error)
    (smart-tabs-insinuate 'c 'c++ 'java 'cperl 'python 'ruby 'nxml 'javascript))

(setq-default indent-tabs-mode t
              c-basic-offset tab-width
              sh-basic-offset tab-width
              sgml-basic-offset tab-width)

(setq backward-delete-char-untabify-method nil)
(setq tab-always-indent t)

(provide 'indentation-configuration)
