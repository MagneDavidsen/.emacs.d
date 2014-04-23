(require 'cask "/usr/local/Cellar/cask/0.6.0/cask.el")
(cask-initialize)
(require 'pallet)

;; ------ http://stackoverflow.com/questions/2079095/how-to-modularize-an-emacs-configuration -----
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))
;; -------------------------------------------------------------------------------------------------

;; Load cedet before we do anything with the load path... It needs special treatment 
;; to ensure correct load order of things
;;(load-user-file "cedet.el")

;; Add ./lisp to lod path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/flycheck-haskell")
;; Add external projects to load path
;(dolist (project (directory-files "~/.emacs.d/lisp" t "\\w+"))
;  (when (file-directory-p project)
;    (add-to-list 'load-path project)))
(let ((default-directory "~/.emacs.d/lisp/"))

  (normal-top-level-add-subdirs-to-load-path))

(load-user-file "various-fixes.el")
(load-user-file "sane-defaults.el")
(load-user-file "theme.el")
(load-user-file "company-mode.el")
(load-user-file "ido-mode.el")
(load-user-file "find-file-in-repository.el")
(load-user-file "haskell-mode.el")
(load-user-file "info.el")
(load-user-file "flycheck.el")
(load-user-file "eclim.el")
(load-user-file "flycheck-haskell.el")
(load-user-file "dockerfile-mode.el")
