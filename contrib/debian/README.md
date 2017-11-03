
Debian
====================
This directory contains files used to package doncoind/doncoin-qt
for Debian-based Linux systems. If you compile doncoind/doncoin-qt yourself, there are some useful files here.

## doncoin: URI support ##


doncoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install doncoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your doncoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/doncoin128.png` to `/usr/share/pixmaps`

doncoin-qt.protocol (KDE)

