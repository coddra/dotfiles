;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Coddra"
      user-mail-address "andrew.reeds.mpg@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-font (font-spec :family "FantasqueSansMono Nerd Font Mono" :size 24))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Set transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 90))
(add-to-list 'default-frame-alist '(alpha . (95 . 90)))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-to-list 'company-backends 'company-omnisharp)

;; React Native
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(setq lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr"))
(setq tide-completion-detailed t)
(setq tide-always-show-documentation t)

(add-hook 'typescript-mode-hook 'lsp-deferred)
(add-hook 'typescript-mode-hook 'tide-setup)
(add-hook 'typescript-mode-hook 'company-mode)
(add-hook 'typescript-mode-hook 'flycheck-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (setq tide-completion-detailed t)
  (setq tide-always-show-documentation t)
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(add-hook 'tide-mode-hook #'setup-tide-mode)
