;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 18 :weight 'regular))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-horizon)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.gurjal/org/")
(setq org-roam-directory "~/.gurjal/zettelkasten")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; vimish folds
(setq vimish-fold-global-mode 1)

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

;; unbind evil-snipe-mode from default 's' key
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; gurjal mappings
(map!
 ;; wtf is going on with tab?
 ;; :n     "<tab>" #'c-indent-line-or-region
 ;; lsp
 ;; :n     "C-n"   #'next-error
 ;; :n     "C-p"   #'previous-error
 ;; goto
 :nv    "s"     #'avy-goto-char-2
 :nv    "gh"    #'evil-beginning-of-line
 :nv    "gj"    #'evil-goto-line
 :nv    "gk"    #'evil-goto-first-line
 :nv    "gl"    #'evil-end-of-line
 ;; notes
 :n     "-"     #'org-mark-ring-goto
 ;; search
 :n     "gw"   #'evil-ex-search-word-forward
 :n     "gW"   #'evil-ex-search-word-backward
 ;; buffer
 :n     "\\"    #'evil-next-buffer
 :n     "|"     #'evil-prev-buffer
 :n     "C-n"   #'evil-next-buffer
 :n     "C-p"   #'evil-prev-buffer
 ;; macro
 :n     "Q"     #'call-last-kbd-macro
 ;; vimish folds
 :n     "z,"    #'vimish-fold-from-marks)

;; zettelkasten
(setq org-roam-capture-templates
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
(map! :leader
      (:prefix-map ("z" . "zettelkasten")
                   "t" #'org-roam-dailies-goto-today
                   "a" #'org-roam-node-random
                   "f" #'org-roam-node-find
                   "F" #'org-roam-ref-find
                   "g" #'org-roam-graph
                   "i" #'org-roam-node-insert
                   "n" #'org-roam-capture
                   "r" #'org-roam-buffer-toggle
                   "R" #'org-roam-buffer-display-dedicated
                   "s" #'org-roam-db-sync
                   "l" #'org-store-link
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
