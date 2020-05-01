;; add custom lisp directory to path
(unless
    (file-exists-p (concat user-emacs-directory "lisp"))
  (make-directory (concat user-emacs-directory "lisp")))

;; add custom lisp directory to path
(let ((default-directory (concat user-emacs-directory "lisp/")))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append 
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))

;; on OSX Emacs needs help setting up the system paths
(when (memq window-system '(mac ns))
  (require 'exec-path-from-shell)
  ;; From https://github.com/aculich/.emacs.d/blob/master/init.el
  ;; Import additional environment variables beyond just $PATH
  (dolist (var '("PYTHONPATH"         ; Python modules
                 "INFOPATH"           ; Info directories
                 "JAVA_OPTS"          ; Options for java processes
                 "SBT_OPTS"           ; Options for SBT
                 "RUST_SRC_PATH"      ; Rust sources, for racer
                 "CARGO_HOME"         ; Cargo home, for racer
                 "EMAIL"              ; My personal email
                 "GPG_TTY"
                 "GPG_AGENT_INFO"
                 "SSH_AUTH_SOCK"
                 "SSH_AGENT_PID"
                 ))
    (add-to-list 'exec-path-from-shell-variables var))
  (exec-path-from-shell-initialize))

(provide 'custom_lisp)
