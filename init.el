(server-start)
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
'(company-preview-common ((t (:inherit company-preview :foreground "brightcyan"))))
 '(company-preview-search ((t (:inherit company-preview :background "black"))))
 '(company-scrollbar-bg ((t (:background "dark green"))))
 '(company-scrollbar-fg ((t (:background "red"))))
 '(company-template-field ((t (:background "black" :foreground "chartreuse"))))
 '(company-tooltip ((t (:background "black" :foreground "yellow green"))))
 '(company-tooltip-search ((t (:background "dark khaki" :underline "blue"))))
 '(company-tooltip-selection ((t (:background "honeydew" :foreground "dark green"))))
 '(helm-buffer-modified ((t (:inherit font-lock-comment-face :foreground "coral"))))
 '(magit-diff-added ((t (:background "dark slate gray" :foreground "chocolate"))))
 '(magit-diff-added-highlight ((t (:background "dark olive green" :foreground "gold"))))
 '(magit-diff-removed ((t (:background "red" :foreground "#ffdddd"))))
 '(magit-diff-removed-highlight ((t (:background "dark red" :foreground "navajo white"))))
 '(mode-line-buffer-id-inactive ((t (:inherit mode-line-buffer-id :foreground "dark goldenrod"))))
 '(neo-vc-edited-face ((t (:foreground "magenta"))))
 '(neo-vc-ignored-face ((t (:foreground "dim gray" :underline nil))))
 '(neo-vc-missing-face ((t (:foreground "red"))))
 '(neo-vc-removed-face ((t (:foreground "saddle brown"))))
 '(neo-vc-unlocked-changes-face ((t (:foreground "dark turquoise"))))
 '(neo-vc-unregistered-face ((t (:foreground "yellow"))) t)
 '(neo-vc-up-to-date-face ((t (:foreground "dark olive green"))))
 '(neo-vc-user-face ((t (:foreground "red" :slant italic))))
 '(powerline-active1 ((t (:inherit mode-line :background "saddle brown" :foreground "green yellow"))))
 '(powerline-active2 ((t (:inherit mode-line :background "green4" :foreground "khaki"))))
 '(sml/read-only ((t (:inherit sml/not-modified :foreground "deep sky blue"))))
 '(sr-active-path-face ((t (:foreground "yellow" :weight bold :height 120))))
 '(sr-editing-path-face ((t (:foreground "yellow" :underline "red" :weight bold :height 120))))
 '(sr-highlight-path-face ((t (:foreground "#ace6ac" :underline "magenta" :weight bold :height 120))))
 '(sr-mirror-path-face ((t (:foreground "yellow" :underline "sienna" :weight bold :height 120))))
 '(sr-passive-path-face ((t (:foreground "lightgray" :underline "white" :weight bold :height 120))))
 '(whitespace-empty ((t (:foreground "sienna"))))
 '(whitespace-hspace ((t (:background "grey24" :foreground "MistyRose4"))))
 '(whitespace-indentation ((t (:foreground "grey10"))))
 '(whitespace-line ((t (:underline (:color foreground-color :style wave)))))
 '(whitespace-newline ((t (:foreground "dark green" :weight normal))))
 '(whitespace-space ((t (:foreground "DarkOrchid4"))))
 '(whitespace-space-after-tab ((t (:foreground "firebrick"))))
 '(whitespace-space-before-tab ((t (:foreground "firebrick"))))
 '(whitespace-tab ((t (:foreground "magenta"))))
 '(whitespace-trailing ((t (:foreground "yellow" :weight bold)))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
