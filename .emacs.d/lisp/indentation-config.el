;; Tab size and various other configurations
(setq-default tab-width global-tab-width)
(setq cua-auto-tabify-rectangles nil)

;; Set the smart-tabs style for all available languages
(smart-tabs-insinuate 'c 'c++ 'java 'cperl 'python 'ruby 'nxml 'javascript)

;; By default, use tabs
(setq-default indent-tabs-mode t
              c-basic-offset tab-width
              sh-basic-offset tab-width
              sgml-basic-offset tab-width)

;; And when we backspace, delete a character, don't break up the tab into spaces.
(setq backward-delete-char-untabify-method nil)

(setq tab-always-indent t)

(provide 'indentation-config)
