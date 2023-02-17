(require 'server)
  (unless (server-running-p) (server-start))

;; add package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") 
              t)

;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)

;; package to install 
(setq packages-list
      '(magit
        use-package
        lsp-mode
        yasnippet
        org-roam
	company ;;will provide auto complete suggestions,
	flymake ;;will highlight warnings and errors
	xref ;;can find the definition of a function or variable
	eldoc ;;will show function documentation in the minibuffer
        material-theme
        ))

; unless packages are not available locally, dont refresh package archives
(unless package-archive-contents
  (package-refresh-contents))

;; iterate over packages and install missing ones 
(dolist (pkg packages-list)                                   
(unless (package-installed-p pkg)                         
    (package-install pkg)))       

(require 'use-package)

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; enable lsp mode 
;;              #########################
;; ##### First you need to install python packages   ####
;; ##### pip install python-language-server[all]     ####
;; ##### pip install pyls-black pyls-isort pyls-mypy ####
;;              #########################
(use-package lsp-mode
  :config
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)))
  :hook
  ((python-mode . lsp)))
(use-package lsp-ui
  :commands lsp-ui-mode)

;; Show all documenttion
(setq lsp-eldoc-render-all t)

;; Drop-down auto completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; turnn off beeper signals
(setq visible-bell t)

;; set font
;;(set-face-attribute 'default nil :font "Terminus-12")

;; change theme
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally


;; turn off additional menu
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; #### Configure Tramp mode ####
(setq tramp-default-method "ssh")

;;######### Test addition function to open dired mode with remote host #####

 (defun connect-nsc ()
  (interactive)
  (dired "/user@192.168.20.55:/opt"))
;; ###############################

;; #########################
;; HELM - incremental search 
;; #########################
(require 'helm)

(setq-default helm-M-x-fuzzy-match t)
(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key "\C-c\C-m" 'helm-M-x)
(define-key evil-ex-map "x" 'helm-M-x)

(define-key evil-ex-map "b " 'helm-mini)
(define-key evil-ex-map "e" 'helm-find-files)


###########################################
####   ORG ROME  ####
# Whery useful tool to make notes
##########################################

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "˜/RoamNotes"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  ;;(setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  ;;(require 'org-roam-protocol))
###########################################################################


;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(package-selected-packages '(magit)))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package material-theme magit)))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
