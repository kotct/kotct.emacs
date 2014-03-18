#!/bin/sh

echo "Installing all Emacs-related files from the kotct.emacs project to \$HOME"

if test -e "$HOME/.emacs";
then
	printf "\"$HOME/.emacs\" already exists and is a "

	if test -h "$HOME/.emacs";
	then
		printf "symbolic link.\n"
	else
		printf "non-symbolic file.\n"
	fi

	printf "We don't want to clobber your existing configuration, so please remove those files and try again.\n"
	printf "If you encounter the same issue again, please submit an issue on the issue tracker at:\n"
	printf "https://github.com/kotct/kotct.emacs/issues\n"

	exit
fi

if test -e "$HOME/.emacs.d";
then
	printf "\"$HOME/.emacs.d\" already exists and is a "

	if test -h "$HOME/.emacs.d";
	then
		printf "symbolic link.\n"
	else
		printf "non-symbolic file.\n"
	fi

	printf "We don't want to clobber your existing configuration, so please remove those files and try again.\n"
	printf "If you encounter the same issue again, please submit an issue on the issue tracker at:\n"
	printf "https://github.com/kotct/kotct.emacs/issues\n"

	exit
fi

ln -s `pwd`/.emacs $HOME/.emacs
ln -s `pwd`/.emacs.d $HOME/.emacs.d
