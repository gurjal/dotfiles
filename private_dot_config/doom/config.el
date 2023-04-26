;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-nord-aurora
      user-full-name "shaan raya" user-mail-address "shaanraya@proton.me"
      doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 18 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "IosevkaTerm Nerd Font")
      doom-big-font-increment 2
      doom-unicode-font (font-spec :family "Noto Color Emoji")
      display-line-numbers-type 'visual
      ;; confirm-kill-emacs nil
      ;; confirm-kill-processes nil
      vimish-fold-global-mode 1)

;; evil-escape
(setq-default evil-escape-key-sequence "jk" evil-escape-delay 0.2)
(after! evil-escape (delete 'vterm-mode evil-escape-excluded-major-modes))

;; tramp
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

;; ;; zen mode
;; (after! writeroom-mode
;;   (setq +zen-text-scale 0.5)
;;   ;; Disable line numbers
;;   (add-hook! 'writeroom-mode-enable-hook
;;     (when (bound-and-true-p display-line-numbers-mode)
;;       (setq-local +line-num--was-activate-p display-line-numbers-type)
;;       (display-line-numbers-mode -1)))
;;   (add-hook! 'writeroom-mode-disable-hook
;;     (when (bound-and-true-p +line-num--was-activate-p)
;;       (display-line-numbers-mode +line-num--was-activate-p))))

;; ;; unbind evil-snipe-mode from default 's' key
;; (remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; map lion (align) from gl/gL to ga/gA
(setq evil-lion-mode nil)

;; gurjal
(map!
 ;;   buffer
 :n   "|"   #'evil-prev-buffer
 :n   "\\"  #'evil-next-buffer
 ;;   goto
 :nv  "s"   #'avy-goto-char-2
 :nv  "gh"  #'evil-beginning-of-line
 :nv  "gj"  #'evil-goto-line
 :nv  "gk"  #'evil-goto-first-line
 :nv  "gl"  #'evil-end-of-line
 ;;   macro
 :n   "Q"   #'call-last-kbd-macro
 ;;   align
 :n   "ga"  #'evil-lion-left
 :n   "gA"  #'evil-lion-right
 ;;   folds
 :n   "z,"  #'vimish-fold-from-marks
 :leader
 ;;  window
 :n  ","  #'evil-window-next
 :n  "<"  #'evil-window-prev
 :n  "d"  #'+workspace/close-window-or-workspace
 ;;  buffer
 :n  "y"  #'save-buffer
 :n  "k"  #'kill-current-buffer
 :leader :prefix "b"
 :n              "p"  #'+popup/toggle
 :n              "P"  #'+popup/raise
 :leader :prefix "t"  ;; toggle
 :n              "s"  #'scroll-lock-mode
 :leader :prefix "c"  ;; code
 :n              "m"  #'man)

;; (add-hook! 'scroll-lock-mode-hook
;;            :local (map! :n "d" #'evil-scroll-down
;;                         :n "u" #'evil-scroll-up))
;; (remove-hook! 'scroll-lock-mode-finished-hook
;;   :local (map! :n "d" #'evil-delete
;;                :n "u" #'evil-undo))

;; org settings
(setq org-directory "~/.gurjal/org/" org-roam-directory "~/.gurjal/org/zettelkasten")
;; default fold level
(after! org (setq org-startup-folded 'show2levels))

;; org roam capture templates
;; '(("n" "node" plain
;;    "%a\n* %?"
;;    :if-new (file+head "%<%y%m%d%h%m%s>-${slug}.org" "#+title: ${title}\n")
;;    :unnarrowed t)
;;   ("i" "index" plain
;;    "%a\n* %?"
;;    :if-new (file+head "%<%y%m%d%h%m%s>-${slug}.org" "#+title: ${title}\n#+filetags: index\n")
;;    :unnarrowed t)
;;   ("p" "plain" plain
;;    "%?"
;;    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;; :unnarrowed t))

;; org mappings
(map!
 ;; ring
 :n     "-"     #'org-mark-ring-goto
 :leader
 (:prefix-map ("j" . "journal")
              "j"       #'org-roam-node-find
              "f"       #'org-roam-node-find
              "F"       #'org-roam-ref-find
              "i"       #'org-roam-node-insert
              ;; "v"       #'org-roam-graph
              "n"       #'org-roam-capture
              "r"       #'org-roam-refile
              "s"       #'org-roam-db-sync
              "l"       #'org-store-link
              "b"       #'org-roam-buffer-toggle
              "B"       #'org-roam-buffer-display-dedicated
              ;; date
              "g"       #'org-roam-dailies-goto-today
              "t"       #'org-roam-dailies-goto-today
              "T"       #'org-roam-dailies-capture-today
              (:prefix ("d" . "by date")
                       "d"      #'org-roam-dailies-goto-date
                       "D"      #'org-roam-dailies-capture-date
                       "m"      #'org-roam-dailies-goto-tomorrow
                       "M"      #'org-roam-dailies-capture-tomorrow
                       "t"      #'org-roam-dailies-goto-today
                       "T"      #'org-roam-dailies-capture-today
                       "y"      #'org-roam-dailies-goto-yesterday
                       "Y"      #'org-roam-dailies-capture-yesterday
                       "f"      #'org-roam-dailies-goto-next-note
                       "b"      #'org-roam-dailies-goto-previous-note
                       "-"      #'org-roam-dailies-find-directory)
              ;; roam doc props
              (:prefix ("p" . "properties")
                       "t"      #'org-roam-tag-add
                       "T"      #'org-roam-tag-remove
                       "r"      #'org-roam-ref-add
                       "R"      #'org-roam-ref-remove
                       "a"      #'org-roam-alias-add
                       "A"      #'org-roam-alias-remove)))
