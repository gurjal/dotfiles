;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq! doom-theme 'doom-palenight
       doom-font (font-spec :family "Iosevka Nerd Font Mono" :weight 'normal :size 18)
       doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :weight 'normal :size 18)
       doom-unicode-font (font-spec :family "Liberation Sans" :weight 'regular :size 18)
       doom-big-font-increment 2
       display-line-numbers-type 'visual
       ;; confirm-kill-processes nil
       confirm-kill-emacs nil
       user-full-name "gurjal"
       user-mail-address "gurjal@proton.me")

(setq! evil-escape-key-sequence "jk"
       evil-escape-delay 0.2
       evil-escape-unordered-key-sequence 't)

(map! :map (evil-org-mode-map
            prog-mode-map)
      :i "M-h" "C-g h"
      :i "M-j" "C-g j"
      :i "M-k" "C-g k"
      :i "M-l" "C-g l")

(map! :n   "\\" #'evil-next-buffer
      :n   "|" #'evil-prev-buffer
      :leader
      :n   "y"   #'save-buffer
      :n   "k"   #'kill-current-buffer)

(map! :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right
      :leader
      :n "d"  #'+workspace/close-window-or-workspace
      :prefix "w"
      :n "o" #'doom/window-maximize-buffer)

(map! :nv "gh" #'evil-beginning-of-line
      :nv "gj" #'evil-goto-line
      :nv "gk" #'evil-goto-first-line
      :nv "gl" #'evil-end-of-line)

(map! :n "Q" #'call-last-kbd-macro)

(map! :leader :prefix "t" :n "R" #'rainbow-mode)

(map! :leader
      :desc "Toggle popup buffer"
      :n "SPC" #'(lambda () (interactive) (+popup/toggle) (ignore-errors (+popup/other))))

(map! :leader :prefix "s" :n "M" #'man)

(after! evil-escape (delete 'vterm-mode evil-escape-excluded-major-modes))

(map! :g "M-t" #'+vterm/toggle
      :g "M-T" #'+vterm/here)

(setq! vterm-kill-buffer-on-exit 't)

(setq! avy-single-candidate-jump 't avy-timeout-seconds 0.3)
(map! :nv "s" #'evil-avy-goto-char-timer)

(map! :nv "gH" #'evil-lion-left
      :nv "gL" #'evil-lion-right)

(map! :n "S" #'evil-surround-change
      :v "S" #'evil-surround-edit)

(map! :nv "zv" #'evil-vimish-fold-mode)

(setq org-directory "~/.gurjal/org/" org-roam-directory "~/.gurjal/org/zettelkasten")

;; default fold level
(after! org (setq org-startup-folded 'show2levels)
  ;; Make the backlinks buffer easier to peruse by folding leaves by default.
  (add-hook 'org-roam-buffer-postrender-functions #'magit-section-show-level-2))

(setq! org-hide-emphasis-markers 't)

(use-package! websocket
  :after org)
(use-package! org-roam-ui
  :after websocket
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(map! :n "-" #'org-mark-ring-goto
      :leader
      (:prefix-map ("j" . "journal")
                   "j" #'org-roam-dailies-goto-today
                   "f" #'org-roam-node-find
                   "F" #'org-roam-ref-find
                   "i" #'org-roam-node-insert
                   "c" #'org-roam-capture
                   "r" #'org-roam-refile
                   "s" #'org-roam-db-sync
                   "l" #'org-store-link
                   "t" #'org-roam-tag-add
                   "T" #'org-roam-tag-remove
                   "b" #'org-roam-buffer-toggle
                   "B" #'org-roam-buffer-display-dedicated
                   (:prefix ("g" . "gui")
                            "g" #'org-roam-ui-mode
                            "f" #'org-roam-ui-follow-mode
                            "z" #'org-roam-ui-node-zoom
                            "l" #'org-roam-ui-node-local
                            "a" #'org-roam-ui-add-to-local-graph
                            "r" #'org-roam-ui-remove-from-local-graph)
                   (:prefix ("d" . "dailies")
                            "d" #'org-roam-dailies-goto-date
                            "D" #'org-roam-dailies-capture-date
                            "m" #'org-roam-dailies-goto-tomorrow
                            "M" #'org-roam-dailies-capture-tomorrow
                            "t" #'org-roam-dailies-goto-today
                            "T" #'org-roam-dailies-capture-today
                            "y" #'org-roam-dailies-goto-yesterday
                            "Y" #'org-roam-dailies-capture-yesterday
                            "f" #'org-roam-dailies-goto-next-note
                            "b" #'org-roam-dailies-goto-previous-note
                            "-" #'org-roam-dailies-find-directory)
                   (:prefix ("p" . "properties")
                            "t" #'org-roam-tag-add
                            "T" #'org-roam-tag-remove
                            "r" #'org-roam-ref-add
                            "R" #'org-roam-ref-remove
                            "a" #'org-roam-alias-add
                            "A" #'org-roam-alias-remove)))

(map! :niv "M-," #'(lambda () (interactive) (org-roam-buffer-toggle) (+popup/other)))
;; (map! :map org-mode-map :niv "M-," #'(lambda ()) (interactive) (org-roam-buffer-toggle) (+popup/other))

;; zen mode
(after! writeroom-mode
  (setq +zen-text-scale 0.5)
  ;; Disable line numbers
  (add-hook! 'writeroom-mode-enable-hook
    (when (bound-and-true-p display-line-numbers-mode)
      (setq-local +line-num--was-activate-p display-line-numbers-type)
      (display-line-numbers-mode -1)))
  (add-hook! 'writeroom-mode-disable-hook
    (when (bound-and-true-p +line-num--was-activate-p)
      (display-line-numbers-mode +line-num--was-activate-p))))

;;NOTE dont think i this because i can use 'C-y' emacs binding to paste in insert mode
;; (map! :after vterm
;;       :map vterm-mode-map
;;       :i "M-p" #'evil-paste-after)

;; vim marker folds
;; (add-hook 'prog-mode-hook 'evil-vimish-fold-mode)
;; (add-hook 'text-mode-hook 'evil-vimish-fold-mode)
;; (setq evil-vimish-fold-target-modes '(prog-mode conf-mode text-mode))
(setq global-evil-vimish-fold-mode 't)

;;
;; fucking around here on...
;;

;; TODO trying to search roam notes by filetags
;;
;; (after! org
;;  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))))

;; TODO org roam capture templates
;;
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

;; TODO scroll mode with 'C-d' and 'C-u' as 'd' and 'u'
;;
;; (add-hook! 'scroll-lock-mode-hook
;;            :local (map! :n "d" #'evil-scroll-down
;;                         :n "u" #'evil-scroll-up))
;; (remove-hook! 'scroll-lock-mode-finished-hook
;;   :local (map! :n "d" #'evil-delete
;;                :n "u" #'evil-undo))
