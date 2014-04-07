(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;;; Smex
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")
(global-set-key (kbd "M-x") 'smex)
