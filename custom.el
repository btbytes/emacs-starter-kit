;;
;; custom config/bindings.
;;

;;C-c ms magit-status
(global-set-key (kbd "C-c ms") 'magit-status)

;;Line truncation. See http://bit.ly/bzFM05
(setq truncate-lines t)

;; color theme
(require 'color-theme)
(color-theme-zenburn)

;; ;; (require 'pandoc)
(add-hook 'markdown-mode-hook 'turn-on-pandoc)

;; whitespace mode.

(require 'whitespace)
(autoload 'whitespace-mode
  "whitespace" "Toggle whitespace visualization." t)
(autoload 'global-whitespace-toggle-options
  "whitespace" "Toggle global `whitespace-mode' options." t)

(global-set-key "\C-c_w" 'whitespace-mode)
(global-set-key "\C-c_t" 'whitespace-toggle-options)
(global-set-key "\C-c=w" 'global-whitespace-mode)
(global-set-key "\C-c=t" 'global-whitespace-toggle-options)
