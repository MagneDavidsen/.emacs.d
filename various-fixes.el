;; Turn off GUI
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Turn off splash screen
(setq inhibit-startup-message t)

;; Add ./lisp to lod path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Add external projects to load path
(dolist (project (directory-files "~/.emacs.d/lisp" t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; OSX fixes

(setq is-mac (equal system-type 'darwin))

;; Setup environment variables from the user's shell.
(when is-mac
  (exec-path-from-shell-initialize))
(if is-mac
    (progn
      ;; cocoa fullscreen
      ;; command = meta and option = control
      (setq ns-command-modifier 'meta)
      (setq ns-option-modifier 'control)))


;; ------ shortcut fixes ---------
;; nxml
(defun nxml-key-fix ()
  (define-key nxml-mode-map "\M-h" 'windmove-left))
(add-hook 'nxml-mode-hook 'nxml-key-fix)
;; magit
(defun magit-key-fix ()
  (define-key magit-mode-map "\M-h" 'windmove-left ))
(add-hook 'magit-mode-hook 'magit-key-fix)

(defun js2-mode-key-fix ()
  (define-key js2-mode-map "\M-j" 'windmove-down))
(add-hook 'js2-mode-hook 'js2-mode-key-fix)


(global-auto-revert-mode)
(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))
(put 'erase-buffer 'disabled nil)

;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(setq ac-auto-start 3)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(require 'erc)

;; Make C-c RET (or C-c C-RET) send messages instead of RET.
(define-key erc-mode-map (kbd "RET") nil)
(define-key erc-mode-map (kbd "C-c RET") 'erc-send-current-line)
(define-key erc-mode-map (kbd "C-c C-RET") 'erc-send-current-line)

;; http://blog.bookworm.at/2007/03/pretty-print-xml-with-emacs.html
(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this. The function inserts linebreaks to separate tags that have
nothing but whitespace between them. It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n") (setq end (1+ end)))
    (indent-region begin end))
  (message "Ah, much better!"))

(global-set-key (kbd "C-M-J") (lambda () (interactive) (enlarge-window 1)))
(global-set-key (kbd "C-M-K") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-M-H") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "C-M-L") (lambda () (interactive) (enlarge-window 1 t)))

(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
