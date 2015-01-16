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

Machine Specific Configs
------------
Put machine specific configs in `~/.emacs.d/lisp/local/`.
It will only load `local-hub.el` or `local-hub.elc` in that directory by default.

These will be ignored by git.