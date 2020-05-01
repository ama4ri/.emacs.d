;; term
(with-eval-after-load "term"
  (define-key term-mode-map (kbd "C-j") 'term-char-mode)
  (define-key term-raw-map (kbd "C-j") 'term-line-mode)
  (require 'with-editor)
  (when (executable-find "git") (require 'git-commit))
  (shell-command-with-editor-mode t))

;; multi-term
(defun terminal ()
  "Create new term buffer.
Will prompt you shell name when you type `C-u' before this command."
  (interactive)
  (require 'multi-term)
  (let (term-buffer)
    ;; Set buffer.
    (setq term-buffer (multi-term-get-buffer current-prefix-arg))
    (setq multi-term-buffer-list (nconc multi-term-buffer-list (list term-buffer)))
    (set-buffer term-buffer)
    ;; Internal handle for `multi-term' buffer.
    (multi-term-internal)
    ;;(with-editor-export-editor)
    ;;(with-editor-export-git-editor)
    (call-interactively 'comint-clear-buffer)
    ;; Switch buffer
    ;;(display-buffer term-buffer t)
    (pop-to-buffer term-buffer)
    ))

(with-eval-after-load "multi-term"
  (define-key term-mode-map (kbd "C-j") 'term-char-mode)
  (define-key term-raw-map (kbd "C-j") 'term-line-mode)
  (require 'with-editor)
  (when (executable-find "git") (require 'git-commit))
  (setq multi-term-switch-after-close nil)
  (shell-command-with-editor-mode t))

;; shell
(with-eval-after-load "sh-script"
  (require 'essh) ; if not done elsewhere; essh is in the local lisp folder
  (require 'eval-in-repl-shell)
  (define-key sh-mode-map "\C-c\C-c" 'eir-eval-in-shell)
  (define-key sh-mode-map (kbd "<C-return>") 'eir-eval-in-shell)
  (define-key sh-mode-map (kbd "<C-S-return>") 'executable-interpret))
(with-eval-after-load "shell"
  (require 'with-editor)
  (when (executable-find "git") (require 'git-commit))
  (shell-command-with-editor-mode t))

(with-eval-after-load "eshell"
  (require 'with-editor)
  (when (executable-find "git") (require 'git-commit))
  (shell-command-with-editor-mode t))

;; Automatically adjust output width in commint buffers
;; from http://stackoverflow.com/questions/7987494/emacs-shell-mode-display-is-too-wide-after-splitting-window
(defun comint-fix-window-size ()
  "Change process window size."
  (when (derived-mode-p 'comint-mode)
    (let ((process (get-buffer-process (current-buffer))))
      (unless (eq nil process)
        (set-process-window-size process (window-height) (window-width))))))

(defun my-shell-mode-hook ()
  ;; add this hook as buffer local, so it runs once per window.
  (add-hook 'window-configuration-change-hook 'comint-fix-window-size nil t))

(add-hook 'shell-mode-hook
          (lambda()
            ;; add this hook as buffer local, so it runs once per window.
            (add-hook 'window-configuration-change-hook 'comint-fix-window-size nil t)))

;; Use emacs as editor when running external processes or using shells in emacs
(when (and (string-match-p "remacs" (prin1-to-string (frame-list)))
           (executable-find "remacsclient"))
  (setq with-editor-emacsclient-executable (executable-find "remacsclient")))


;; (add-hook 'shell-mode-hook
;;           (lambda()
;;             (with-editor-export-editor)
;;             (with-editor-export-git-editor)
;;             ;;(sleep-for 0.5) ; this is bad, but thinking hurts and it works.
;;             (call-interactively 'comint-clear-buffer)))

;; (add-hook 'term-exec-hook
;;           (lambda()            
;;             (with-editor-export-editor)
;;             (with-editor-export-git-editor)
;;             (call-interactively 'comint-clear-buffer)
;;             ;; (term-send-return)
;;             ;; (term-send-return)
;;             ;; (term-send-return)
;;             ;; (call-interactively 'comint-clear-buffer)
;;             ))

(add-hook 'eshell-mode-hook
          (lambda()
            ;; programs that don't work well in eshell and should be run in visual mode
            (add-to-list 'eshell-visual-commands "ssh")
            (add-to-list 'eshell-visual-commands "tail")
            (add-to-list 'eshell-visual-commands "htop")
            ;; git editor support
            ;; (with-editor-export-editor)
            ;;(with-editor-export-git-editor)

(provide 'term)
