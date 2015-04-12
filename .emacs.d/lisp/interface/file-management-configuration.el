;;; Use recentf to find from recent files
(require 'recentf)

;; enable recent files mode.
(recentf-mode t)
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (let ((recent-alist (recentf-show-basenames (recentf-menu-elements recentf-max-saved-items))))
    (if (find-file (assoc-default
                    (ido-completing-read "Find recent file: " (mapcar 'car recent-alist))
                    recent-alist))
        (message "Opening file...")
      (message "Aborting"))))

;; let find-file-in-project load all files in project
(setq ffip-patterns '("*"))

(provide 'file-management-configuration)
