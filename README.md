kotct.emacs
===========

A Collective Emacs Configuration Collection

Installation & Setup
------------

* To install run `./install.sh`.
* To setup run `emacs --script setup.el`

Dependencies
------------
There is an optional dependency of wmctrl for fullscreen functionality.
There is an optional dependency of python for recursive make functionality.

Machine Specific Configs
------------
Put machine specific configs in `~/.emacs.d/lisp/local/`.
It will only load `local-hub.el` or `local-hub.elc` in that directory by default.

These will be ignored by git.


rewrite
=======

Goals
-----

Create a fast emacs config with a clean, unified style, that has IDE-level support for many languages.

- Autoload as much as possible.
- Automatically byte-compile on start as much as possible.
- Use a clean, consistent emacs lisp style.
- Have a focus on excellent support for individual languages.
- Make sure everything is well-thought-out and well-documented.
- Have clear error messages handling most user fuckups.

Structure
---------

Currently the rewrite is stored in the `new.emacs.d` directory.
Symlink this to `~/.emacs.d` to use the config.

Within the base `.emacs.d` directory, the only checked-in file is `init.el`.
This file contains any code that must be loaded before the elisp hubs and
any code that manages loading, autoloading, or byte compilation.

All other codes is organized into directories based on language.
For instance, all emacs lisp code goes into the `lisp` directory, and ruby
or python code goes into the `ruby` and `python` directories, respectively.

The `lisp` directory contains a directory for each "hub".
Within each hub directory is a `<hub-name>-hub.el` directory containing
the hub definition (using the `kotct/hub` function).
Each file within the hub that is loaded at startup should provide a
feature with a simple name (e.g. "startup", "backup", or "recentf-c").
If the file is configuring another package, name it `<package>-c`
(as in "recentf-c" above), with "c" standing for "configuration."
Try to avoid this "-c" suffix when possible.

Autoloading
-----------

### Autoloading custom features

Autoloaded files should contain at least one function or other symbol
whose definition is preceded by an autoload token (`;;;###autoload`).

At the top of the file, include the following comment:
```
;;; THIS FILE IS NOT LOADED AT STARTUP.
;;; This file is autoloaded on the following symbols:
;;;  kotct/function1
;;;  kotct/function2
```

To make sure the file is checked for autoloads, ensure that in the
hub file's call to `kotct/hub`, the final argument is `'autoloads`.

Calls to `autoload` will be automatically generated and saved in
`lisp/kotct-loaddefs.el` and loaded on startup.

### Preserving package autoloads

Generally, calls to `require` should be avoided, since these calls will
sometimes force loading of features that would otherwise be autoloaded.
Cases can occur in which a `require` is appropriate, for instance, if
the package does not have autoloads or an autoload will be triggered
later in the file anyway.

If an autoloaded package needs configuration, instead of using `require`
to load the package in order to configure it, wrap the configuration in
a `with-eval-after-load` block so that it will only be loaded after the
package is autoloaded.

Byte compilation
----------------

Still in progress.

Keybindings
-----------

Keybindings should be located at whatever places makes sense.
Most commonly, they will be located after the definition of the
function they are binding, or after relevant configuration.

To globally bind a key, use a line such as:
```
(global-set-key (kbd "C-x C-r") #'kotct/ido-recentf-open)
```

At the top of any file with keybindings, add a comment like the following for each keybinding:
```
;;; C-x C-r: find recent files and directories using recentf
```

Portability
-----------

The only assumptions we can make about our environment are that we
are using a certain minimum version of emacs (tbd) and we have all
package dependencies installed (although we should handle the case at
startup where not all dependencies are installed).

Things we CANNOT assume:
- We are using a POSIX-compliant OS.
- We have external dependencies installed (such as Ruby or Python).
- The user is not an idiot.

Up for debate:
- Can we assume we are not running from a terminal (i.e. can we design so that
some functionality may not be present when running from a terminal)?

Emacs lisp style guide
----------------------

- Prefix all global function or variable names with `kotct/`,
as in `kotct/ido-recentf-open` or `kotct/hub-names`.
- Always use `setf` instead of `setq`.
`setq` should never be used in this project.
- When referencing a function name, always use a function quote (`#'`)
instead of a regular quote (`'`). This function quote (or funquote) translates
to a call to `function` instead of `quote`.
- As described in the Autoloading section, avoid `require` and use `with-eval-after-load`.
- Make sure all `defun`s, `defvar`s, and `defmacro`s (and any other global definitions)
have docstrings that are properly formatted.
- Comment when it's not immediately clear what the code is doing.
- Write modular, clean, and fast code.
