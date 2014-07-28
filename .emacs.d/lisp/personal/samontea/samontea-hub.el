(require 'samontea-mode-line-configuration)
(require 'samontea-keybindings-configuration)
(require 'samontea-graphical-interface-configuration)
(require 'samontea-scratch-buffer-configuration)

(defun samontea-hub-unload-function ()
  (unload-feature 'samontea-graphical-interface-configuration 'force)
  (unload-feature 'samontea-keybindings-configuration 'force)
  (unload-feature 'samontea-mode-line-configuration 'force)
  (unload-feature 'samontea-scratch-buffer-configuration))

(provide 'samontea-hub)
