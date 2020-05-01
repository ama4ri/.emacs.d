(require 'company)
;; cancel if input doesn't match, be patient, and don't complete automatically.
(setq company-require-match nil
      company-async-timeout 6
      company-idle-delay 5
      company-minimum-prefix-length 1
      company-global-modes '(not term-mode))
;; use C-n and C-p to cycle through completions
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "<tab>") 'company-complete-common)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "<backtab>") 'company-select-previous)

(require 'company-capf)
(require 'company-files)
(require 'company-math)
(setq company-backends '(company-files company-math-symbols-unicode company-capf))
(setq-default company-backends '(company-files company-math-symbols-unicode company-capf))

;; completion key bindings
(setq tab-always-indent 'complete)
(define-key company-mode-map [remap indent-for-tab-command] #'company-indent-or-complete-common)
(define-key company-mode-map (kbd "C-M-i") 'company-complete)
(define-key company-mode-map (kbd "C-M-S-i") 'counsel-company)

;; make company use pcomplete (via capf)
;; (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point)

;; not sure why this should be set in a hook, but that is how the manual says to do it.
(add-hook 'after-init-hook 'global-company-mode)

(require 'eglot)
(setq eglot-ignored-server-capabilites
      '(:documentHighlightProvider :hoverProvider))

(provide 'autocomplite)
