(package-initialize)

(add-to-list 'load-path (expand-file-name "settings" "~/.emacs.d/"))  ;; "~/.emacs.d/"))
;;(add-to-list 'load-path (expand-file-name "themes" "~/.emacs.d/"))

(add-to-list 'custom-theme-load-path  "~/.emacs.d/themes/")

(require 'packages_list)


(load-theme 'taming-mr-arneson t t)
(enable-theme 'taming-mr-arneson)
(setq-default custom-enabled-themes 'taming-mr-arneson)
