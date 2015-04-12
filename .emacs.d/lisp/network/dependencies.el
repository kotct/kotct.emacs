(setq dependency-list
      '(
        ;; Language support
        ruby-mode
        yaml-mode
        markdown-mode
        markdown-mode+
        web-mode
        c-eldoc
        css-eldoc
        less-css-mode
        scss-mode
        slime ; lisp
        paredit ; lisp
        elisp-slime-nav
        inf-ruby
        emacs-eclim ; java
        coffee-mode
        csharp-mode
        gitignore-mode
        gnuplot-mode
        groovy-mode
        json-mode
        vala-mode

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
        inflections

        ;; Behavior controls
        smart-tabs-mode
        smartparens
        linum-off
        smartscan
        ace-jump-mode

        ;; Theme
        cyberpunk-theme
        monokai-theme
        solarized-theme
        color-theme-sanityinc-tomorrow
        zenburn-theme
        ample-theme
        sublime-themes
        smyx-theme
        warm-night-theme
        jazz-theme
        theme-changer
        ))

(provide 'dependencies)
