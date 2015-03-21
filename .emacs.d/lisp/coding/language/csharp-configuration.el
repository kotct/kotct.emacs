(add-hook 'csharp-mode-hook
		  (lambda ()
			(c-set-style "C#")))

(smart-tabs-add-language-support vala vala-mode-hook
	((c-indent-line . c-basic-offset)
	 (c-indent-region . c-basic-offset)))

(provide 'csharp-configuration)
