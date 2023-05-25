;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq! doom-theme 'doom-challenger-deep
       doom-font (font-spec :family "IosevkaTerm Nerd Font Mono" :weight 'normal :size 18)
       doom-variable-pitch-font (font-spec :family "IosevkaTerm Nerd Font" :weight 'normal :size 18)
       doom-unicode-font (font-spec :family "Liberation Sans" :weight 'regular :size 18)
       doom-big-font-increment 2
       display-line-numbers-type 'visual
       ;; confirm-kill-processes nil
       confirm-kill-emacs nil
       user-full-name "gurjal"
       user-mail-address "gurjal@proton.me")

(setq-default evil-escape-key-sequence "jk" evil-escape-delay 0.2)
(after! evil-escape (delete 'vterm-mode evil-escape-excluded-major-modes))

;; buffer
(map! :n   "\\"  #'evil-next-buffer
      :n   "|"   #'evil-prev-buffer
      (:leader
       :n   "y"   #'save-buffer
       :n   "k"   #'kill-current-buffer))

;; window
(map! :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right
      (:leader
       :n "\\" #'evil-window-next
       :n "|"  #'evil-window-prev
       :n "d"  #'+workspace/close-window-or-workspace))

;; popups
(map! :leader :n "\\" #'(lambda () (interactive) (+popup/toggle) (ignore-errors (+popup/other))))

;;   goto
(map! :nv "gh" #'evil-beginning-of-line
      :nv "gj" #'evil-goto-line
      :nv "gk" #'evil-goto-first-line
      :nv "gl" #'evil-end-of-line)

;; macro
(map! :n "Q" #'call-last-kbd-macro)

(map! :leader :prefix "t"
      :n "R" #'rainbow-mode)

;; search
(map! :leader :prefix "s"
      :n "M" #'man)

(setq! avy-single-candidate-jump 't
       avy-timeout-seconds 0.1)

(map! :nv "s" #'evil-avy-goto-char-timer)

(setq! evil-lion-mode nil)

(map! :n   "ga"  #'evil-lion-left
      :n   "gA"  #'evil-lion-right)

;;   surround
(map! :nv  "gs"  #'evil-surround-edit)

;; vimish folds
(map! :n "zv" #'evil-vimish-fold-mode)

;; org settings
(setq org-directory "~/.gurjal/org/" org-roam-directory "~/.gurjal/org/zettelkasten")

;; default fold level
(after! org (setq org-startup-folded 'show2levels)
  ;; Make the backlinks buffer easier to peruse by folding leaves by default.
  (add-hook 'org-roam-buffer-postrender-functions #'magit-section-show-level-2))

;; org roam with gui
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
                    "f"          #'org-roam-node-find
                    "F"          #'org-roam-ref-find
                    "i"          #'org-roam-node-insert
                    "n"          #'org-roam-capture
                    "r"          #'org-roam-refile
                    "s"          #'org-roam-db-sync
                    "l"          #'org-store-link
                    "b"          #'org-roam-buffer-toggle
                    "B"          #'org-roam-buffer-display-dedicated
                    "t"          #'org-roam-dailies-goto-today
                    "T"          #'org-roam-dailies-capture-today
                   (:prefix ("g" . "gui")
                             "g" #'org-roam-ui-mode
                             "f" #'org-roam-ui-follow-mode
                             "z" #'org-roam-ui-node-zoom
                             "l" #'org-roam-ui-node-local
                             "a" #'org-roam-ui-add-to-local-graph
                             "r" #'org-roam-ui-remove-from-local-graph)
                   (:prefix ("d" . "by date   ")
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

(map! :niv "M-," #'(lambda ()
                   (interactive)
                   (org-roam-buffer-toggle)
                   (+popup/other)))
;; (map! :map org-mode-map
;;       :niv "M-," #'(lambda ()
;;                    (interactive)
;;                    (org-roam-buffer-toggle)
;;                    (+popup/other)))

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
;; (setq global-evil-vimish-fold-mode 't)

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
