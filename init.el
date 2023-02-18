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
	lsp-ui
      ;; company-lsp
        yasnippet
      ;; helm
      ;;  org-roam
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

;; #### CONFIGURE PYTHON LSP MODE  ####
;; ###################################################################
;; # First you need to install python packages          	     #
;; # pip install python-language-server[all] (depricated!!!!!!!)     #
;; # pip install "python-lsp-server[all]"			     #
;; # pip install pyls-black pyls-isort pyls-mypy        	     #
;; ###################################################################
;;(use-package lsp-mode :ensure t)
(use-package lsp
 ;; :commands 'lsp
  ;; :ensure nil
  :ensure t
  :config
  ;; make sure we have lsp-imenu everywhere we have LSP
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)  
  ;; get lsp-python-enable defined
  ;; NB: use either projectile-project-root or ffip-get-project-root-directory
  ;;     or any other function that can be used to find the root directory of a project
  (lsp-define-stdio-client lsp-python "python"
                           #'projectile-project-root
                           '("pyls"))

  ;; make sure this is activated when python-mode is activated
  ;; lsp-python-enable is created by macro above 
  (add-hook 'python-mode-hook
            (lambda ()
              (lsp-python-enable)))

  ;; lsp extras
  (use-package lsp-ui
    :ensure t
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; NB: only required if you prefer flake8 instead of the default
  ;; send pyls config via lsp-after-initialize-hook -- harmless for
  ;; other servers due to pyls key, but would prefer only sending this
  ;; when pyls gets initialised (:initialize function in
  ;; lsp-define-stdio-client is invoked too early (before server
  ;; start)) -- cpbotha

 
   (defun lsp-set-cfg ()
    (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
      ;; TODO: check lsp--cur-workspace here to decide per server / project
      (lsp--set-configuration lsp-cfg)))

   (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg)) 

;; ########### END LSP CONFIG  ###################

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

;;(require 'helm)

;;(setq-default helm-M-x-fuzzy-match t)
;;(global-set-key "\C-x\C-m" 'helm-M-x)
;;(global-set-key "\C-c\C-m" 'helm-M-x)
;;(define-key evil-ex-map "x" 'helm-M-x)

;;(define-key evil-ex-map "b " 'helm-mini)
;;(define-key evil-ex-map "e" 'helm-find-files)


;;###########################################
;;####   ORG ROME  ####
;;# Whery useful tool to make notes
;;##########################################

;;(use-package org-roam
;;  :ensure t
;;  :custom
;;  (org-roam-directory (file-truename "˜/RoamNotes"))
;;  :bind (("C-c n l" . org-roam-buffer-toggle)
;;         ("C-c n f" . org-roam-node-find)
;;         ("C-c n g" . org-roam-graph)
;;         ("C-c n i" . org-roam-node-insert)
;;         ("C-c n c" . org-roam-capture)
;;         ;; Dailies
;;         ("C-c n j" . org-roam-dailies-capture-today))
;;  :config


;;  ;; If you're using a vertical completion framework, you might want a more informative completion interface
;;  ;;(setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
;;  (org-roam-db-autosync-mode)
;;  ;; If using org-roam-protocol
;;  ;;(require 'org-roam-protocol))

;;###########################################################################


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
