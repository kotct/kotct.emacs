(require 'samontea-mode-line-configuration)
(require 'samontea-keybindings-configuration)
(require 'samontea-graphical-interface-configuration)
(require 'samontea-scratch-buffer-configuration)
(require 'samontea-theme-configuration)
(require 'samontea-prefs)

(defun samontea-hub-unload-function ()
  (unload-feature 'samontea-graphical-interface-configuration 'force)
  (unload-feature 'samontea-keybindings-configuration 'force)
  (unload-feature 'samontea-mode-line-configuration 'force)
  (unload-feature 'samontea-scratch-buffer-configuration)
  (unload-feature 'samontea-theme-configuration)
  (unload-feature 'samontea-prefs))

(provide 'samontea-hub)
