(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq truncate-lines t)

(global-set-key (kbd "C-w") 'backward-kill-word)

;;The generic apropos (of any symbol) is MUCH more useful than apropos-command
(global-set-key "\C-ha" 'apropos)

(global-set-key "\C-x\C-k" 'kill-region) ;; alternative for old C-w
(global-set-key "\C-c\C-k" 'kill-region) ;; copy for slippery fingers
(global-set-key (kbd "C-;") 'ibuffer)
(global-set-key (kbd "M-g") 'goto-line)

;; Vim style keyboard moving
(global-set-key (kbd "C-M-l") 'windmove-right)
(global-set-key (kbd "C-M-h") 'windmove-left)
(global-set-key (kbd "C-M-j") 'windmove-down)
(global-set-key (kbd "C-M-k") 'windmove-up)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-.") 'find-tag-other-window)


(require 'yasnippet)
(setq yas/root-directory "~/.emacs.d/elpa-to-submit/snippets")
(yas/load-directory yas/root-directory)
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))

(when (string= "x" window-system)
  ;; Linux-Specific Settings
  (set-default-font
   "-unknown-ProggyCleanTT-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))
