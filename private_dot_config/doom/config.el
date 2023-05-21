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

;; map lion (align) from gl/gL to ga/gA
(setq! evil-lion-mode nil)

(setq! avy-single-candidate-jump 't
       avy-timeout-seconds 0.1)
(map! :nv "s" #'evil-avy-goto-char-timer)

(map!
 ;;   buffer
 :n   "\\"  #'evil-next-buffer
 :n   "|"   #'evil-prev-buffer
 (:map prog-mode-map
  :n   "`"  #'(lambda ()
                (interactive)
                (ignore-errors (+popup/restore))
                (+popup/other)))
 :n   "`"  #'evil-window-prev
 :n   "~"   #'+popup/toggle
 ;;   goto
 :nv  "gh"  #'evil-beginning-of-line
 :nv  "gj"  #'evil-goto-line
 :nv  "gk"  #'evil-goto-first-line
 :nv  "gl"  #'evil-end-of-line
 ;;   macro
 :n   "Q"   #'call-last-kbd-macro
 ;;   align
 :n   "ga"  #'evil-lion-left
 :n   "gA"  #'evil-lion-right
 ;;   surround
 :nv  "gs"  #'evil-surround-edit
 ;;   vimish folds
 :n   "zv"  #'evil-vimish-fold-mode
 :leader
 ;;   buffer
 :n   "y"   #'save-buffer
 :n   "k"   #'kill-current-buffer
 ;;   window
 :n   "\\"  #'evil-window-next
 :n   "|"   #'evil-window-prev
 :n   "d"   #'+workspace/close-window-or-workspace
 :leader :prefix "t"  ;; toggle
 :n              "R"  #'rainbow-mode
 :leader :prefix "s"  ;; search
 :n              "M"  #'man)

;;NOTE dont think i this because i can use 'C-y' emacs binding to paste in insert mode
;; (map! :after vterm
;;       :map vterm-mode-map
;;       :i "M-p" #'evil-paste-after)

;; vim marker folds
;; (add-hook 'prog-mode-hook 'evil-vimish-fold-mode)
;; (add-hook 'text-mode-hook 'evil-vimish-fold-mode)
;; (setq evil-vimish-fold-target-modes '(prog-mode conf-mode text-mode))
;; (setq global-evil-vimish-fold-mode 't)

;; org settings
(setq org-directory "~/.gurjal/org/" org-roam-directory "~/.gurjal/org/zettelkasten")
;; default fold level
(after! org (setq org-startup-folded 'show2levels)

  ;; Make the backlinks buffer easier to peruse by folding leaves by default.
  (add-hook 'org-roam-buffer-postrender-functions #'magit-section-show-level-2))

;; vim marker folds
;; (add-hook 'prog-mode-hook 'evil-vimish-fold-mode)
;; (add-hook 'text-mode-hook 'evil-vimish-fold-mode)
;; (setq evil-vimish-fold-target-modes '(prog-mode conf-mode text-mode))
;; (setq global-evil-vimish-fold-mode 't)

;; ;; auto open org-roam buffer
;; (add-Hook 'find-file-hook
;;           (lambda ()
;;             (and (org-roam-file-p)
;;                  (not (eq 'visible (org-roam-buffer--visibility)))
;;                  (org-roam-buffer-toggle))))

;; (map! (:map org-mode-map
;;        :n "\\" #'(lambda() (interactive)
;;                    (if (not (eq 'visible (org-roam-buffer--visibility)))
;;                        (org-roam-buffer-toggle)
;;                      (+popup/other))))
;;       (:map org-roam-mode-map
;;        :n "\\" #'evil-window-prev
;;        :n "m" #'doom/window-maximize-buffer
;;        :n "q" #'org-roam-buffer-toggle))

;; org mappings
;; (map!
;;  ;; ring
;;  :n     "-"     #'org-mark-ring-goto
;;  :n "|" #'evil-next-buffer
;;  :leader
;;  :n     "\\"    #'(lambda() (interactive)
;;                     (or (+popup/other)
;;                         (evil-window-prev nil))))
(map! :leader
      (:prefix-map ("j" . "journal")
                   "f"       #'org-roam-node-find
                   "F"       #'org-roam-ref-find
                   "i"       #'org-roam-node-insert
                   "n"       #'org-roam-capture
                   "r"       #'org-roam-refile
                   "s"       #'org-roam-db-sync
                   "l"       #'org-store-link
                   "b"       #'org-roam-buffer-toggle
                   "B"       #'org-roam-buffer-display-dedicated
                   ;; date
                   "t"       #'org-roam-dailies-goto-today
                   "T"       #'org-roam-dailies-capture-today
                   (:prefix ("g" . "gui")
                            "g"       #'org-roam-ui-mode
                            "f"       #'org-roam-ui-follow-mode
                            "z"       #'org-roam-ui-node-zoom
                            "l"       #'org-roam-ui-node-local
                            "a"       #'org-roam-ui-add-to-local-graph
                            "r"       #'org-roam-ui-remove-from-local-graph)
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
                   (:prefix ("p" . "properties")
                            "t"      #'org-roam-tag-add
                            "T"      #'org-roam-tag-remove
                            "r"      #'org-roam-ref-add
                            "R"      #'org-roam-ref-remove
                            "a"      #'org-roam-alias-add
                            "A"      #'org-roam-alias-remove)))

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

;; TODO do i like zen mode?
;;
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
