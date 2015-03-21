(setq global-tab-width 4)
(setq-default tab-width global-tab-width)

(require 'language-hub)

(if (require 'smart-tabs nil 'no-error)
    (smart-tabs-insinuate 'c 'c++ 'java 'cperl 'python 'ruby 'nxml 'javascript 'vala 'csharp))

(setq-default indent-tabs-mode t
              c-basic-offset tab-width
              sh-basic-offset tab-width
              sgml-basic-offset tab-width
              LilyPond-indent-level 4)

(setq backward-delete-char-untabify-method nil)
(setq tab-always-indent t)

(defun indent-file (file)
  (interactive "GWhich file do you want to indent:")
  (print file)
  (if (file-regular-p file)
      (progn
        (find-file file)
        (indent-region (point-min) (point-max))
        (save-buffer)
        (kill-buffer))
    (dolist (loop-file (directory-files file t))
      (when (not (string= (substring (file-name-nondirectory loop-file) 0 1) "."))
        (indent-file loop-file)))))

(provide 'indentation-configuration)
