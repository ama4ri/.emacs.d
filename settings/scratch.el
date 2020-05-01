;; Org-mode settings
(require 'org) ;; Вызвать org-mode
(global-set-key "\C-ca" 'org-agenda) ;; поределение клавиатурных комбинаций для внутренних
(global-set-key "\C-cb" 'org-iswitchb) ;; подрежимов org-mode
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . Org-mode)) ;; ассоциируем *.org файлы с org-mode




;; Test config
;;(setq split-height-threshold  nil
;;      split-width-threshold   0)

;;(if (equal nil (equal major-mode 'org-mode))
;;    (windmove-default-keybindings 'meta))

;;(recentf-mode 1)
;;(setq recentf-max-menu-items      150
;;      recentf-max-saved-items     550)

;; Show paren
;;(setq show-paren-delay 0
;;      show-paren-style 'expression)
;;(show-paren-mode 2)

;; end of test config

(setq tramp-default-method "ssh")


;; Emacs appearance
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode)
(fset 'yes-or-no-p 'y-or-n-p)

;; Display the name of the current buffer in the title bar
(setq frame-title-format "%b")

;; Full mailing address of user
(setq-default user-full-name   "amauri"
              user-mail-adress "alex.shilov@outlook.com")

;; Set zsh as default shell
;;(setq shell-file-name           "/bin/zsh"
;;      explicit-shell-file-name  "/bin/zsh")

;; Dired mode settings
(require 'dired)
(setq dired-recursive-deletes 'top)

;;(require 'dired-x)
;; allow dired to delete or copy dir
(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes (quote top)) ; “top” means ask once

;; https://github.com/thomp/dired-launch
(dired-launch-enable)
;; use xdg-open as the default launcher
;;(setq dired-launch-default-launcher '("xdg-open"))
;;Example
;;(setf dired-launch-extensions-map
;;      '(;; specify LibreOffice as the preferred application for
        ;; a Microsoft Excel file with the xslx extension
;;        ("xlsx" ("libreofficedev5.3"))
        ;; specify LibreOffice and Abiword as preferred applications for
        ;; an OpenDocument text file with the odt extension
;;        ("odt" ("libreofficedev5.3" "abiword"))))


;; Imenu
(require 'imenu)
(setq imenu-auto-rescan      t
      imenu-use-popup-menu   nil)
(semantic-mode 1)

(setq backup-inhibited          t
      make-backup-files         nil
      auto-save-default         nil
      auto-save-list-file-name  nil)

(set-language-environment               'UTF-8)
(setq buffer-file-coding-system         'utf-8
      file-name-coding-system           'utf-8)
(setq-default coding-system-for-read    'utf-8)
(set-selection-coding-system            'utf-8)
(set-keyboard-coding-system             'utf-8-unix)
(set-terminal-coding-system             'utf-8)
(prefer-coding-system                   'utf-8)

(setq-default display-line-numbers t)

;; Indent settings
(setq-default indent-tabs-mode      nil
              tab-width             4
              tab-always-indent     nil
              c-basic-offset        2
              sh-basic-offset       2
              sh-indentation        2
              scala-basic-offset    2
              java-basic-offset     2
              standart-indent       2
              lisp-body-indent      2
              rust-indent-offset    4
              js-indent-level       2
              indent-line-function  'insert-tab)
;; Russian
(cl-loop
 for from across "йцукенгшщзхїфівапролджєячсмитьбюЙЦУКЕНГШЩЗХЇФІВАПРОЛДЖ\ЄЯЧСМИТЬБЮ№"
 for to   across "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"
 do
 (eval `(define-key local-function-key-map
          (kbd ,(concat "C-"
                        (string from)))
          (kbd ,(concat "C-"
                        (string to)))))
 (eval `(define-key local-function-key-map
          (kbd ,(concat "M-"
                        (string from)))
          (kbd ,(concat "M-"
                        (string to)))))
 (eval `(define-key local-function-key-map
          (kbd ,(string from))
          (kbd ,(string to)))))

(defadvice read-passwd (around my-read-passwd act)
  (let ((local-function-key-map nil))
    ad-do-it))

(provide 'scratch)
