(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
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
