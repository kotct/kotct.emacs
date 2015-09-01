;; -*- eval: (rainbow-mode 1) -*-

;; Dynamic right-aligned linum fill width
(setq my-linum-format (lambda (line)
                        (let* ((w (length (number-to-string (count-lines (point-min) (point-max)))))
                               (thing (concat " %" (number-to-string (max 2 w)) "d ")))
                          (propertize (format thing line) 'face 'linum))))

(setq linum-format my-linum-format)

(fringe-mode '(8 . 0))

;;; Git gutter
(require 'git-gutter-fringe+)
(global-git-gutter+-mode)
(global-set-key (kbd "C-x g") 'git-gutter+-mode) ; Turn on/off in the current buffer
(global-set-key (kbd "C-x G") 'global-git-gutter+-mode) ; Turn on/off globally
(eval-after-load 'git-gutter+
  '(progn
     ;;; Jump between hunks
     (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
     (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)

     ;;; Act on hunks
     (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
     (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
     ;; Stage hunk at point.
     ;; If region is active, stage all hunk lines within the region.
     (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
     (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
     (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-commit)
     (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
     (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer)))


(ido-vertical-mode 1)
(setq ido-vertical-show-count t)

;;; none of this nice stuff works with --daemon
;; (setq my-font-list '(;;"Input Mono Light" ;too lazy to fix
;;                      "Monaco"
;;                      "DejaVu Sans Mono"
;;                      "Liberation Mono"))

;; (message "got here")

;; (add-hook 'after-init-hook
;;           (lambda ()
;;             (message "sup")
;;             (some (lambda (font)
;;                     (message "bout")
;;                     (if (member font (font-family-list)) ;(not (null (x-list-fonts font)))
;;                         ;; we have the font
;;                         (progn
;;                           (message "have %s" font)
;;                           (add-to-list 'default-frame-alist `(font . ,(concat font "-10"))) t)
;;                       (progn (message "don't have %s" font) nil)))
;;                   my-font-list)
;;             (message "bros")))


;;; transparency yeah!!!! :D
(add-to-list 'default-frame-alist
             '(alpha . (90 . 80)))
(setq frame-title-format "%[%*%] %b")

;;rainbow-delims
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;; acheive longlines-mode type thing with visual-line-mode
(defvar visual-wrap-column nil)
(defun set-visual-wrap-column (new-wrap-column &optional buffer)
  "Force visual line wrap at NEW-WRAP-COLUMN in BUFFER (defaults
    to current buffer) by setting the right-hand margin on every
    window that displays BUFFER.  A value of NIL or 0 for
    NEW-WRAP-COLUMN disables this behavior."
  (interactive (list (read-number "New visual wrap column, 0 to disable: " (or visual-wrap-column fill-column 0))))
  (if (and (numberp new-wrap-column)
           (zerop new-wrap-column))
      (setq new-wrap-column nil))
  (with-current-buffer (or buffer (current-buffer))
    (visual-line-mode t)
    (set (make-local-variable 'visual-wrap-column) new-wrap-column)
    (add-hook 'window-configuration-change-hook 'update-visual-wrap-column nil t)
    (let ((windows (get-buffer-window-list)))
      (while windows
        (when (window-live-p (car windows))
          (with-selected-window (car windows)
            (update-visual-wrap-column)))
        (setq windows (cdr windows))))))
(defun update-visual-wrap-column ()
  (if (not visual-wrap-column)
      (set-window-margins nil nil)
    (let* ((current-margins (window-margins))
           (right-margin (or (cdr current-margins) 0))
           (current-width (window-width))
           (current-available (+ current-width right-margin)))
      (if (<= current-available visual-wrap-column)
          (set-window-margins nil (car current-margins))
        (set-window-margins nil (car current-margins)
                            (- current-available visual-wrap-column))))))

(provide 'cg505-interface-config)
