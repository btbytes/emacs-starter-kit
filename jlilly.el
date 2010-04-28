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
(setq eval-expression-print-length nil) ; don't limit error msg length
(setq espresso-indent-level 4)

(when (string= "x" window-system)
  ;; Linux-Specific Settings
  (set-default-font
   "-unknown-ProggyCleanTT-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))

(load-file "~/.emacs.d/elpa-to-submit/brookstream.el")
(load-file "~/.emacs.d/elpa-to-submit/github.el")
(load-file "~/.emacs.d/elpa-to-submit/ir-black.el")
(load-file "~/.emacs.d/elpa-to-submit/tango-2.el")
(load-file "~/.emacs.d/elpa-to-submit/vibrant-ink.el")
(load-file "~/.emacs.d/elpa-to-submit/merbivore.el")

(custom-set-faces
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil))))
