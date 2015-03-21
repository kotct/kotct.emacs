(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))

(smart-tabs-add-language-support vala vala-mode-hook
	((c-indent-line . c-basic-offset)
	 (c-indent-region . c-basic-offset)))

(provide 'vala-configuration)
