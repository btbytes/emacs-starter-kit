;;
;; Pradeep Gowda's customisations.
;;

;;C-c ms magit-status
(global-set-key (kbd "C-c ms") 'magit-status)

;;Line truncation. See http://bit.ly/bzFM05
(setq truncate-lines t)

;; ;; (require 'pandoc)
(add-hook 'markdown-mode-hook 'turn-on-pandoc)

;; show trailing white spaces.
(setq show-trailing-whitespace 't)
