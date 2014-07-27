#!/bin/bash

DIR=`dirname \`readlink -f ${BASH_SOURCE[0]}\``

echo "Installing all Emacs-related files from the kotct.emacs project to \$HOME"

for file in .emacs.d;
do
	if test -e "$HOME/$file";
	then
		printf "\"$HOME/$file\" already exists and is "

		if test -h "$HOME/$file";
		then
			printf "a symbolic link.\n"
		elif test -d "$HOME/$file";
		then
			printf "a directory.\n"
		elif test -f "$HOME/$file";
		then
			printf "a regular file.\n"
		else
			printf "some sort of weird voodoo magic.\n"
		fi

		printf "We don't want to clobber your existing configuration, so please remove ~/$file and try again.\n"
		printf "If you encounter the same issue again, please submit an issue on the issue tracker at:\n"
		printf "https://github.com/kotct/kotct.emacs/issues\n"

		exit
	fi
done

ln -s $DIR/.emacs $HOME/.emacs
ln -s $DIR/.emacs.d $HOME/.emacs.d
