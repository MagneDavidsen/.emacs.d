;; jada!

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (concat (getenv "PATH") (concat ":" (expand-file-name "~/Library/Haskell/bin"))))
(setq exec-path (append exec-path (list (expand-file-name "~/Library/Haskell/bin"))))

;; OSX fixes

; usr/local/bin isn't always in the path when running emacs in os x for some reason
(if (not (string-match "/usr/local/bin" (getenv "PATH")))
    (progn
      (setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/bin"))))
(if (eq system-type 'darwin)
    (progn
      ;; cocoa fullscreen
      ;; command = meta and option = control
      (setenv "PATH" (concat (getenv "PATH") ":" "/Library/PostgreSQL/9.1/bin"))
      (setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/bin")))
      (setenv "CLOJURESCRIPT_HOME" (expand-file-name  "~/lib/clojurescript"))
      (setq exec-path (append exec-path (list "/Library/PostgreSQL/9.1/bin")))
      (setq exec-path (append exec-path (list (expand-file-name "~/lib"))))
      (setq exec-path (append exec-path (list (expand-file-name "~/bin"))))
      (setq ns-command-modifier 'meta)
      (setq ns-option-modifier 'control)))

(setenv "PATH" (concat (getenv "PATH") ":"
                       (expand-file-name  "~/.rvm/gems/ruby-1.9.3-p286/bin")))

(setq exec-path (append exec-path (list (expand-file-name "~/Library/Haskell/bin"))))
(setenv "PATH" (concat (getenv "PATH") ":"  (expand-file-name "~/Library/Haskell/bin")))

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

;(set-face-attribute 'default nil :height 120)
(setq locale-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-locale-environment "en_US.UTF-8-UNIX")

;; set up unicode
(prefer-coding-system       'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)

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
