(defun my-ido-completing-symbol-read (prompt symbol-list)
  (let ((alist (mapcar (lambda (x) (cons (symbol-name x) x)) symbol-list)))
    (assoc-default (ido-completing-read prompt (mapcar 'car alist)) alist)))

(provide 'cg505-lib)
