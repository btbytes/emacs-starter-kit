;;; starter-kit-python.el --- Some helpful Python code
;;
;; Part of the Emacs Starter Kit
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

(eval-after-load 'python-mode
  '(progn
     (global-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

(global-set-key (kbd "C-h p") 'python-shell)
(add-hook 'python-mode-hook 'idle-highlight)

;;; Flymake

(eval-after-load 'python-mode
  '(progn
     (require 'flymake)
     (when (load "flymake" t)
       (defun flymake-pylint-init ()
         (let* ((temp-file (flymake-init-create-temp-buffer-copy
                            'flymake-create-temp-inplace))
                (local-file (file-relative-name
                             temp-file
                             (file-name-directory buffer-file-name))))
           (list "epylint" (list local-file))))
       (add-to-list 'flymake-allowed-file-name-masks
                    '("\\.py\\'" flymake-pylint-init)))))

(provide 'starter-kit-python)
;; starter-kit-python.el ends here
