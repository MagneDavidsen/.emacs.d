(require 'cask "~/.cask/cask.el")
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

(load-user-file "various-fixes.el")
(load-user-file "theme.el")
