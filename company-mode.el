(require 'company)
(require 'haskell-process)
(add-hook 'after-init-hook 'global-company-mode)

(defun company-haskell-process-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (case command
    (interactive (company-begin-backend 'company-haskell-process-backend))
    (prefix (if (and (eq major-mode 'haskell-mode) (haskell-session-maybe)) (company-grab-word) nil))
    (candidates 
     (let ((resp (haskell-process-get-repl-completions (haskell-process) arg)))
           (if (string= (car resp) "")
               (cdr resp)
             resp)))))

(setq company-backends (cons 'company-haskell-process-backend company-backends))
