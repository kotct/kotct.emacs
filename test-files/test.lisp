;;; This does things
(defun test (someargs woo)
  (format t "This is some fun ~a stuff" woo)

  (if (= 1 2)
      (setf case1 t)
    (setf case2 nil)))
