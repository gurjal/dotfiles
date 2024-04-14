;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq! user-full-name "gurjal"
       user-mail-address "gurjal@proton.me")

; (setq! doom-font (font-spec :family "Iosevka Nerd Font Mono" :weight 'normal :size 18)
;       doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :weight 'normal :size 18)
;       doom-unicode-font (font-spec :family "Liberation Sans" :weight 'regular :size 18)
;       doom-big-font-increment 2)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)
  ;; ENABLE FLASHING mode-line on errors
  (doom-themes-visual-bell-config)
  ;; this for da treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(load-theme 'doom-monokai-pro t)

(setq! confirm-kill-processes nil
       confirm-kill-emacs nil)

(setq! evil-collection-setup-minibuffer 't
       evil-want-minibuffer 't)

(setq! display-line-numbers-type 'visual
       display-line-numbers-widen nil)

;; menu

(setq! evil-escape-key-sequence "jk"
       evil-escape-delay 0.2
       evil-escape-unordered-key-sequence 't)

(map! :map (minibuffer-mode-map
            prog-mode-map
            org-mode-map)
      :i "M-h" "C-g h"
      :i "M-j" "C-g j"
      :i "M-k" "C-g k"
      :i "M-l" "C-g l")

(map! :g "<f5>" (kbd #'"C-g"))

(after! evil-escape (delete 'vterm-mode evil-escape-excluded-major-modes))

(setq! vterm-kill-buffer-on-exit 't)

(map! :ni "M-e" #'+vterm/toggle
      :leader
      :desc "toggle vterm popup" :ni "e"   #'+vterm/toggle
      :desc "open vterm window"  :ni "oe"  #'+vterm/here)
;; replaces edit file keybind in gurjal zsh config
(map! :after vterm
      :map vterm-mode-map
      :desc "find file" :ni "M-h" #'+vertico/find-file-in)

(map! :desc "toggle popup" :i "M-r" #'(lambda () (interactive) (+popup/toggle) (ignore-errors (+popup/other)))
      :leader
      :desc "toggle popup" :n "r" #'(lambda () (interactive) (+popup/toggle) (ignore-errors (+popup/other)))
      :desc "raise popup"  :n "R" #'+popup/raise)

(map! :leader
      ;; :desc "find file" :n "SPC" #'+vertico/find-file-in
      :prefix "f"
      :desc "grep cwd" :n "/" #'+default/search-cwd
      :desc "toggle fold" :n "o" #'evil-toggle-fold
      :desc "find files from cwd" :n "f" #'+default/find-file-under-here)

(map! :n "\\" #'evil-next-buffer
      :n "|"  #'evil-prev-buffer
      :n "S"  #'+vertico/search-symbol-at-point
      :leader
      :desc "search buffer" :n "/" #'+default/search-buffer
      :desc "switch buffer" :n "," #'+vertico/switch-workspace-buffer
      :desc "save buffer"   :n "y" #'save-buffer
      :prefix "b"
      :desc "ibuffer workspace" :n "i" #'+ibuffer/open-for-current-workspace
      :desc "ibuffer"           :n "I" #'ibuffer
      :desc "kill buffer"       :n "k" #'kill-current-buffer)

;; use ctrl for quick window window navigation
;; NOTE extra bindings for window motion seems redundant and hitting ctrl mod cmds always suck
;; (map! :n "C-h" #'evil-window-left
;;       :n "C-j" #'evil-window-down
;;       :n "C-k" #'evil-window-up
;;       :n "C-l" #'evil-window-right
(map! :leader
      :desc "delete window"   :n "d" #'+workspace/close-window-or-workspace
      :prefix "w"
      :desc "balance windows" :n "b" #'balance-windows
      :desc "maximise buffer" :n "e" #'doom/window-enlargen
      :desc "maximise buffer" :n "o" #'doom/window-maximize-buffer)

;; :nv "gj" #'evil-goto-line
;; :nv "gk" #'evil-goto-first-line
(map! :nv "gh" #'evil-beginning-of-line
      :nv "gl" #'evil-end-of-line)

(map! :leader
      :prefix "s"
      :desc "jumplist" :n "'" #'+vertico/jump-list
      :desc "manpages" :n "m" #'woman)

;;
;; (add-hook 'lisp-interaction-mode-hook #'prettify-symbols-mode)
;; (add-hook! 'scroll-lock-mode-finished-hook
;;            #'(lambda () (interactive)
;;                (map! :n "d" #'evil-scroll-down
;;                      :n "u" #'evil-scroll-up)))
;; (remove-hook! 'scroll-lock-mode-finished-hook
;;   #'(lambda () (interactive)
;;       (map! :n "d" #'evil-delete
;;             :n "u" #'evil-undo)))

(map! :leader
      :prefix "t"
      :desc "scroll lock up"   :n "j" #'scroll-lock-mode
      :desc "scroll lock down" :n "k" #'scroll-lock-mode)

;; (map! :after scroll-lock-mode
;;       :map scroll-lock-mode-map
;;       :n "u" #'(evil-scroll-up 0)
;;       :N "D" #'(evil-scroll-down 0))

(map! :leader :prefix "t" :n "R" #'rainbow-mode)

(map! :n "U" #'vundo)

;; (map! :n "Q" #'call-last-kbd-macro)

(map! :leader :desc "resume vertico" :n "v" #'vertico-repeat)

(setq! avy-single-candidate-jump 't avy-timeout-seconds 0.2)
(map! :nv "s" #'evil-avy-goto-char-timer)

;; (map! :nv "gH" #'evil-lion-left
;;       :nv "gL" #'evil-lion-right)

(map! :prefix "g"
      :n "s" #'evil-surround-change
      :v "s" #'evil-surround-edit)

(map! :nv "zv" #'evil-vimish-fold-mode)

(setq! org-directory "~/.gurjal/org/"
       org-roam-directory "~/.gurjal/org/zettelkasten")

(after! org
  (setq! org-startup-folded 't
         org-startup-numerated 't
         org-num-max-level 2)
  ;; Make the backlinks buffer easier to peruse by folding leaves by default.
  (add-hook 'org-roam-buffer-postrender-functions #'magit-section-show-level-2))

(setq! org-hide-emphasis-markers 't)

(map! :leader
      :prefix "t"
      :n "e" #'(lambda ()
                 (interactive)
                 (if org-hide-emphasis-markers
                     (progn (setq! org-hide-emphasis-markers nil)
                            (message "org emphasis markers are hidden"))
                   (progn (setq! org-hide-emphasis-markers 't)
                          (message "org emphasis markers are visible")))
                 (revert-buffer)))

(map! :leader
      :prefix "j"
      :v "e" #'org-emphasize)

(map! :map org-mode-map
      :leader
      :n "fl" #'link-hint-open-link)

(use-package! websocket
  :after org)
(use-package! org-roam-ui
  :after websocket
  :config
  (setq! org-roam-ui-sync-theme t
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
                   "m" #'org-roam-refile
                   "s" #'org-roam-db-sync
                   "l" #'org-store-link
                   "t" #'org-roam-tag-add
                   "T" #'org-roam-tag-remove
                   "r" #'org-roam-buffer-toggle
                   "R" #'org-roam-buffer-display-dedicated
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

(defun +gurjal/toggle-roam-buffer ()
 (interactive)
 (org-roam-buffer-toggle)
 (+popup/other))
(map! :after org-roam
      :map org-roam-mode-map
      :desc "toggle roam buffer" :i "M-r" #'+gurjal/toggle-roam-buffer
      :leader
      :desc "toggle roam buffer" :n "r" #'+gurjal/toggle-roam-buffer)
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
