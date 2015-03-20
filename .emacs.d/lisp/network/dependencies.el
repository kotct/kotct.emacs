(setq dependency-list
      '(
        ;; Language support
        ruby-mode
        yaml-mode
        markdown-mode
        web-mode
        c-eldoc
        css-eldoc
        slime ; lisp
        paredit ; lisp
        inf-ruby
        emacs-eclim ; java

        ;; Tag utilities
        ctags
        ctags-update
        etags-select
        etags-table

        ;; Utilities
        magit
        smex
        volume
        uuid
        backtrace-mode
        rainbow-mode
        fic-mode
        auto-complete
        auto-complete-clang-async
        auto-complete-auctex
        auto-complete-c-headers
        auto-complete-chunk
        auto-complete-exuberant-ctags
        multi-term

        ;; Behavior controls
        smart-tabs-mode
        smartparens
        linum-off
        smartscan
        ace-jump-mode

        ;; Theme
        cyberpunk-theme
        monokai-theme
        ))

(provide 'dependencies)
