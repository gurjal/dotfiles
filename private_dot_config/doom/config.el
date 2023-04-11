;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "shaan raya"
      user-mail-address "shaanraya@proton.me"
      doom-font (font-spec :family "IosevkaTerm Nerd Font" :size 18 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "IosevkaTerm Nerd Font")
      doom-big-font-increment 2
      doom-unicode-font (font-spec :family "Noto Color Emoji")
      doom-theme 'doom-old-hope
      display-line-numbers-type 'relative
      vimish-fold-global-mode 1
      confirm-kill-emacs nil
      confirm-kill-processes nil)

;; unbind evil-snipe-mode from default 's' key
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

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

;; evil-escape
(setq-default evil-escape-key-sequence "jk" evil-escape-delay 0.2)
(after! evil-escape (delete 'vterm-mode evil-escape-excluded-major-modes))

;; gurjal
(map!
      ;; search
      :n     "gw"    #'evil-ex-search-word-forward
      :n     "gW"    #'evil-ex-search-word-backward
      ;; buffer
      :n     "|"     #'evil-prev-buffer
      :n     "\\"    #'evil-next-buffer
      ;; window
      ;; :n     "C-h"   #'evil-window-left
      ;; :n     "C-j"   #'evil-window-down
      ;; :n     "C-k"   #'evil-window-up
      ;; :n     "C-l"   #'evil-window-right
      ;; goto
      :nv    "s"     #'avy-goto-char-2
      :nv    "gh"    #'evil-beginning-of-line
      :nv    "gj"    #'evil-goto-line
      :nv    "gk"    #'evil-goto-first-line
      :nv    "gl"    #'evil-end-of-line
      ;; macro
      :n     "Q"     #'call-last-kbd-macro
      ;; folds
      :n     "z,"    #'vimish-fold-from-marks
      ;; file
      :leader
      :n     "y"     #'save-buffer
      :n     "d"     #'kill-buffer :desc "kill buffer"
      :n     "k"     #'kill-buffer :desc "kill buffer"
      ;; toggle
      :leader :prefix "t"
      :n     "s"     #'scroll-lock-mode)

;; org templates
(setq org-directory "~/.gurjal/org/"
      org-roam-directory "~/.gurjal/org/zettelkasten"
      org-roam-capture-templates
      '(("n" "node" plain
         "%a\n* %?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)
        ("i" "index" plain
         "%a\n* %?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: index\n")
         :unnarrowed t)
        ("p" "plain" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)))
;; org default fold level
(after! org (setq org-startup-folded 'show2levels))
;; org mappings
(map! :n     "-"     #'org-mark-ring-goto
      :leader
      (:prefix-map ("j" . "journal")
                   "g" #'org-roam-dailies-goto-today
                   "f" #'org-roam-node-find
                   "F" #'org-roam-ref-find
                   "i" #'org-roam-node-insert
                   "v" #'org-roam-graph
                   "n" #'org-roam-capture
                   "r" #'org-roam-refile
                   "s" #'org-roam-db-sync
                   "l" #'org-store-link
                   "b" #'org-roam-buffer-toggle
                   "B" #'org-roam-buffer-display-dedicated
                   (:prefix ("p" . "properties")
                            "t" #'org-roam-tag-add
                            "T" #'org-roam-tag-remove
                            "r" #'org-roam-ref-add
                            "R" #'org-roam-ref-remove
                            "a" #'org-roam-alias-add
                            "A" #'org-roam-alias-remove)
                   (:prefix ("d" . "by date")
                            "b" #'org-roam-dailies-goto-previous-note
                            "d" #'org-roam-dailies-goto-date
                            "D" #'org-roam-dailies-capture-date
                            "f" #'org-roam-dailies-goto-next-note
                            "m" #'org-roam-dailies-goto-tomorrow
                            "M" #'org-roam-dailies-capture-tomorrow
                            "n" #'org-roam-dailies-capture-today
                            "t" #'org-roam-dailies-goto-today
                            "T" #'org-roam-dailies-capture-today
                            "y" #'org-roam-dailies-goto-yesterday
                            "Y" #'org-roam-dailies-capture-yesterday
                            "-" #'org-roam-dailies-find-directory)))
