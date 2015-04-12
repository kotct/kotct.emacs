(require 'cg505-lib) ;; required first so no weird deps from other files
(require 'cg505-paredit-config)
(require 'cg505-coding-config)
(require 'cg505-interface-config)
(require 'cg505-keybindings)

(defun cg505-hub-unload-function ()
  (unload-feature 'cg505-paredit-config 'force)
  (unload-feature 'cg505-coding-config 'force)
  (unload-feature 'cg505-interface-config 'force)
  (unload-feature 'cg505-keybindings 'force)
  (unload-feature 'cg505-lib 'force))

(provide 'cg505-hub)
