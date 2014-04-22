(add-to-list 'load-path  (expand-file-name "~/.emacs.d/lisp/dockerfile-mode"))
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
