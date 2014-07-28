;; Load octave-mode on *.m files
(autoload 'octave-mode "octave-mod" nil t)
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(provide 'octave-configuration)
