                                        ;
;; ido stuff
(ido-vertical-mode 1)
(setq ido-vertical-show-count t)

(global-git-gutter+-mode t)

(defun vim-new-line-below ()
  "o like functionality from vim, really helpful in org-mode"
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(provide 'samontea-coding-etc-config)
