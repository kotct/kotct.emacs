(if (require 'web-mode nil 'no-error)
    (progn
      (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.jsonp?\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

      (setq web-mode-engines-alist '(("ctemplate" . "\\.html\\'")))
      (add-to-list 'auto-mode-alist '("ctemplate" . "\\.html\\'"))

      (setq web-mode-markup-indent-offset 4
            web-mode-css-indent-offset 4
            web-mode-code-indent-offset 4
            web-mode-script-padding 0)


      (add-hook 'web-mode-hook
                (lambda nil
                  (setq indent-tabs-mode t
                        web-mode-enable-auto-pairing nil)
                  (if (require 'smart-tabs-mode nil 'no-error)
                      (smart-tabs-mode t))))))

;; Do not compile SCSS at save.
(setq scss-compile-at-save nil)

(provide 'web-configuration)
