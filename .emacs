;; load-path expansion
(setq load-path (append '("~/.emacs.d/lisp"
                          "~/.emacs.d/lisp/language-support"
                          "~/.emacs.d/machine"
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
(require 'personal-config)
(require 'machine-config nil 'no-error)
