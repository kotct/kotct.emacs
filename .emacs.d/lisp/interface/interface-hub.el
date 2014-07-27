(require 'keybinding-configuration)
(require 'editor-startup-configuration)
(require 'line-number-configuration)
(require 'mode-line-configuration)
(require 'graphical-interface-configuration)
(require 'terminal-interface-configuration)

(setq custom-safe-themes t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/interface/themes/")


(require 'tuntu-theme)
(load-theme 'tuntu)

(require 'set-font-size)

(provide 'interface-hub)
