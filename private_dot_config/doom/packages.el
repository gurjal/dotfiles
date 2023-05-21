;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; snipe - f/F, t/T behaviour is annoying
(package! evil-snipe :disable t)

;; org-roam-ui - need latest version roam
(unpin! org-roam)
(package! org-roam-ui)
