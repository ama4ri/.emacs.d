;; Package manager:
;; Initialise package and add Melpa repository

(require 'package)

(setq packages
    '(
      company-flx
      company-mode
      company-restclient
      jedi-core
      elpy
      dap-mode
      lsp-java
      lsp-mode
      lsp-treemacs
      lsp-ui
      json-mode
      less-css-mode
      lsp-java
      lsp-mode
      magit
      web-mode
      which-key
      yaml-mode
      yasnippet
      yasnippet-snippets
      treemacs
      treemacs-icons-dired
      treemacs-magit
      treemacs-projectile
       undo-tree
        )
)

(when (executable-find "python")
    (add-to-list 'packages 'pip-requirements)
    (when (executable-find "autopep8")
      (add-to-list 'packages 'py-autopep8)
      )
    (add-to-list 'packages 'py-isort)
    ;;(when (executable-find "virtualenv")
    ;;  (add-to-list 'packages 'auto-virtualenv))

    ;; (when (executable-find "virtualenvwrapper")
    ;;   (add-to-list 'packages 'auto-virtualenvwrapper))
)

(when (executable-find "docker")
    (add-to-list 'packages 'dockerfile-mode)
    ;(add-to-list 'packages 'docker-compose-mode)
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


;; Initializes the package infrastructure

;; Install el-get if nesessary
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))


(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")

;; Install packages from elpa
(package-refresh-contents)
(setq elpa-packages 
        '(
            py-isort
            tramp
            with-editor
            async
            jsonrpc
            cl-lib
            ;; dired mode extention
            dired-launch
            ))
;; package unknown -    memorize, flymake


(dolist (package elpa-packages)
  (unless (package-installed-p package)
    (package-install package)))


(message "require is")
(require 'el-get)
  (el-get 'sync)

;;(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")

(package-initialize)
(el-get 'sync packages)

(require 'el-get-elpa)
;; Build the El-Get copy of the package.el packages if we have not
;; built it before.  Will have to look into updating later ...
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))


;; hide compilation buffer when complete
;; from http://emacs.stackexchange.com/questions/62/hide-compilation-window
(add-hook 'compilation-finish-functions
          (lambda (buf str)
            (if (null (string-match ".*exited abnormally.*" str))
                ;;no errors, make the compilation window go away in a few seconds
                (progn
                  (run-at-time
                   "2 sec" nil 'delete-windows-on
                   (get-buffer-create "*compilation*"))
                  (run-at-time
                   "2 sec" nil 'delete-windows-on
                   (get-buffer-create "*Compile-Log*"))
                  (message "No Compilation Errors!")))))


(provide 'packages_list)

