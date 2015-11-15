(delete-selection-mode 1)

(setq c-user-style-list '("libconjugar" "StudyHelper"))

(c-add-style "user"
             `("linux"
               (c-basic-offset . ,tab-width)
			   (c-offsets-alist
				(case-label . +))))

;; Newline from middle of line
(global-set-key (kbd "<C-return>") (kbd "C-e C-j"))

(setq flycheck-less-executable "/usr/lib/node_modules/less/bin/lessc")

;; This is for using a remote-terminal.
(setq explicit-shell-file-name "/bin/bash")
(defun remote-term (new-buffer-name cmd &rest switches)
  (setq term-ansi-buffer-name (concat "*" new-buffer-name "*"))
  (setq term-ansi-buffer-name (generate-new-buffer-name term-ansi-buffer-name))
  (let ((clean-switches (delq 'nil switches)))
    (setq term-ansi-buffer-name (apply 'make-term term-ansi-buffer-name cmd nil clean-switches)))
  (set-buffer term-ansi-buffer-name)
  (term-mode)
  (term-char-mode)
  (term-set-escape-char ?\C-x)
  (switch-to-buffer term-ansi-buffer-name))

;; ANSI Term configuration
(defun my-term ()
  (interactive)
  (if (and (buffer-file-name) (string-match "sftp:host=\\(.+\\),user=\\([^/]+\\)\\(.+\\)" (buffer-file-name)))
      (let ((host (match-string 1 (buffer-file-name)))
            (user (match-string 2 (buffer-file-name)))
            (directory (match-string 3 (buffer-file-name)))
            (port-provided (string-match-p ",port=" (match-string 1 (buffer-file-name)))))
        (remote-term host
                     "ssh"
                     (when port-provided
                       "-p")
                     (when port-provided
                       (string-match ",port=\\(.+\\)" host)
                       (match-string 1 host))
                     (concatenate 'string user "@" (if port-provided
                                                       (progn
                                                         (string-match "\\(.+\\),port=.*" host)
                                                         (match-string 1 host))
                                                     host))
                     "-t"
                     (concatenate 'string "cd " (file-name-directory directory) " && $SHELL -l")))
    (ansi-term explicit-shell-file-name)))

;; Use solarized-light during the day and solarized-dark at night.
(setq calendar-latitude 40.3994
      calendar-longitude -86.8617
      calendar-location-name "West Lafayette, Indiana")
(require 'theme-changer)
(change-theme 'solarized-light 'solarized-dark)

(defun mute-bell ()
  (interactive)
  (setq ring-bell-function 'ignore))

;; Set correct height
(set-face-attribute 'default nil :height 100)

(setq server-socket-dir "/tmp/emacs-shared")

(require 'auto-indent-mode)
(auto-indent-global-mode)
(setq auto-indent-assign-indent-level 4)
(require 'smartparens)
(smartparens-global-mode 1)
(require 'smartparens-configuration)

;; Auto-insertion
; Remove the default auto-insert-alist because it has stupid stuff.
(auto-insert-mode)
(setq auto-insert-directory "~/.insert/"
	  auto-insert-query nil
	  auto-insert-alist nil)

;; Auto-insert-mode templates
(define-auto-insert
  '("\\.\\([Hh]\\|hh\\|hpp\\)\\'" . "C / C++ header")
  ; Translates filename into header name, stores in variable `str'.
  '((upcase (concat (file-name-nondirectory
					 (file-name-sans-extension buffer-file-name))
					"_"
					(file-name-extension buffer-file-name)))
	"#ifndef " str \n
	"#define " str \n \n
	_ \n \n "#endif"))

(define-auto-insert
  '("\\.\\([Cc]\\|cc\\|cpp\\)\\'" . "C / C++ program")
  ; Set str to nil, as no str variable is needed.
  '(nil
	"#include \""
	; Sets stem to the full path of the new file minus the extension.
	(let ((stem (file-name-sans-extension buffer-file-name)))
	  ; Checks if header files exist.
										; If one does, will put the stem minus directory plus extension into file.
	  (cond ((file-exists-p (concat stem ".h"))
			 (file-name-nondirectory (concat stem ".h")))
			((file-exists-p (concat stem ".hpp"))
			 (file-name-nondirectory (concat stem ".hpp")))
			((file-exists-p (concat stem ".H"))
			 (file-name-nondirectory (concat stem ".H")))
			((file-exists-p (concat stem ".hh"))
			 (file-name-nondirectory (concat stem ".hh")))))
	; If one of the conditions succeeded, put a quotation mark into the file.
	; If none succeeded, delete the last 10 characters of the file (everything put in).
	& ?\" | -10))

;; Custom layout creation function
(defun create-shell-layout ()
  "Creates my shell layout used in programming."
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (my-term)
  (set-window-dedicated-p (selected-window) t)
  (split-window-vertically)
  (my-term)
  (set-window-dedicated-p (selected-window) t)
  (other-window 1))

(defun create-homework-layout ()
  "Creates my layout used when doing homework."
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (my-term)
  (set-window-dedicated-p (selected-window) t)
  (shrink-window (/ (window-height (next-window)) 2))
  (other-window 1))

(defun create-git-layout ()
  "Creates my Git layout used in programming."
  (interactive)
  (split-window-horizontally)
  (magit-status)
  (split-window-vertically)
  (my-term)
  (set-window-dedicated-p (selected-window) t)
  (set-window-dedicated-p (next-window) t)
  (other-window 2))

;; Set key binding for creating nice layout
; Comment and uncomment bindings aren't consistent, so create new bindings.
(global-set-key [f7] 'create-shell-layout)
(global-set-key [f8] 'create-homework-layout)
(global-set-key [f9] 'create-git-layout)

(provide 'Sammidysam-stuff)
