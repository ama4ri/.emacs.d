(defalias 'python 'run-python)

(with-eval-after-load "python"
  ;; try to get indent/completion working nicely
  ;; readline support is wonky at the moment
  (setq python-shell-completion-native-enable nil)
  ;; simple evaluation with C-ret
  (require 'eval-in-repl-python)
  (when (executable-find "pyls")
    (add-hook 'python-mode-hook 'eglot-ensure)
    (add-hook 'inferior-python-mode-hook 'eglot-ensure))
  ;;(setq eir-use-python-shell-send-string nil)
  (define-key python-mode-map (kbd "C-c C-c") 'eir-eval-in-python)
  (define-key python-mode-map (kbd "<C-return>") 'eir-eval-in-python)
  (define-key python-mode-map (kbd "C-c C-b") 'python-shell-send-buffer)
  (define-key python-mode-map (kbd "<C-S-return>") 'python-shell-send-buffer)
  ;; use ipython if we can
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "--simple-prompt -i"))
  ;; make outline work
  (add-hook 'python-mode-hook
          (lambda()
            ;;(setq-local outline-regexp "[#]+")
            (outline-minor-mode t))))

(when (executable-find "julia")
  (require 'julia-mode)
  (require 'julia-repl)
  (add-hook 'julia-mode-hook 'julia-repl-mode))

(provide 'py)
