;; Package manager:
;; Initialise package and add Melpa repository

(require 'package)

(setq packages
    '(
      material-theme
      company-flx
      company-mode
      company-restclient
      dap-mode
      el-get
      emacs-fish
      emmet-mode
      expand-region
      flycheck
      git-gutter
      json-mode
      less-css-mode
      lsp-java
      lsp-mode
      lsp-treemacs
      lsp-ui
      magit
      org-mode
      web-mode
      which-key
      yaml-mode
      yasnippet
      yasnippet-snippets
      )
)


;; for gnu repository
(setq package-check-signature nil)
;; bug fix for gnu
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Higher values are searched first.
(setq package-archive-priorities
      '(("org"          . 150)
        ("melpa"        . 75)
        ("elpa"         . 100)
        ("gnu"          .  50)
        ("marmalade"    .  200)))


;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Initializes the package infrastructure
(package-initialize t)
(provide 'packages_list)
