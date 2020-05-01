(require 'server)
  (unless (server-running-p) (server-start))

(package-initialize t)

(add-to-list 'load-path (expand-file-name "settings" "~/.emacs.d/"))  ;; "~/.emacs.d/"))
;;(add-to-list 'load-path (expand-file-name "themes" "~/.emacs.d/"))
(add-to-list 'custom-theme-load-path  "~/.emacs.d/themes/")

(require 'packages_list)
(require 'scratch)
(require 'hooks)


;; use special theme
(load-theme 'taming-mr-arneson t t)
(enable-theme 'taming-mr-arneson)
(setq-default custom-enabled-themes 'taming-mr-arneson)

;; start with untitled new buffer
  (add-hook 'after-init-hook
            (lambda()
              (setq inhibit-startup-screen t) ;; yes, we really want to do this!
              (delete-other-windows)
              (untitled-new-buffer-with-select-major-mode 'text-mode)))

  (setq untitled-new-buffer-major-modes '(text-mode python-mode r-mode markdown-mode LaTeX-mode emacs-lisp-mode))
  ;; Change default buffer name.
  (setq untitled-new-buffer-default-name "*Untitled*")


(provide `init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (dired-launch with-editor py-isort jsonrpc))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
