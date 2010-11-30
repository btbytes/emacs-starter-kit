;;
;; custom config/bindings.
;;

;; show column number
(setq column-number-mode t)

;; highlight current line. Uses highline package.
;; XXX: fix highlight colour before using this.
;;(highline-mode-on)

;;Comment or Uncomment C-c #
(global-set-key "\C-c#"  'comment-or-uncomment-region)

;; Make
;;(global-set-key "C-c 9" 'compile)

;; magit
;; magit-status C-c ms
(global-set-key (kbd "C-c ms") 'magit-status)

;; This hook is activated only when the magit-mode is active.
;; See http://xahlee.org/emacs/keyboard_shortcuts.html
(add-hook 'magit-mode-hook
          (lambda ()
            (define-key magit-mode-map (kbd "C-c sa") 'magit-stage-all)
            )
          )

;; Line truncation. See http://bit.ly/bzFM05
;;(setq truncate-lines t)

;; Colour theme
(require 'color-theme)
(color-theme-zenburn)

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
(global-set-key "\C-cwc" 'whitespace-cleanup)

;; custom whitespace setup.
(setq whitespace-style '(trailing
                         lines
                         space-before-tab
                         indentation
                         space-after-tab)
      whitespace-line-column 80)

;; pandoc
(require 'pandoc-mode)
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
;; (autoload 'pandoc-mode "pandoc-mode" "Pandoc Mode." t)
(add-to-list 'auto-mode-alist '("\\.page\\'" . markdown-mode))

;; ESS
(if (eq system-type 'darwin)
    (add-to-list 'load-path "~/elisp/ess/lisp")
    )
(require 'ess-site)

;; zencoding
(require 'zencoding-mode)
(add-hook 'nxml-mode-hook 'zencoding-mode)
(global-set-key (kbd "C-c [") 'zencoding-expand-line)
(global-set-key (kbd "C-c ]") 'zencoding-preview-accept)

;; ASCIIdoc
;;(require 'asciidoc)

;; c-mode
(add-hook 'c-mode-hook
          (lambda ()
           (local-set-key (kbd "C-c 9") 'compile )))

;; golang

;; slime
;; set up the Common Lisp environment

(add-to-list 'load-path "/usr/share/common-lisp/source/slime/")
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
;;(slime-setup)

;; TODO
;; Flymake and python
;; see: http://plope.com/Members/chrism/flymake-mode
;; Ropeemacs

;; virtualenvwrapper aware Flymake
;; . show currently active python interpreter in the status bar?

;; bit.ly shortcuts from within emacs

