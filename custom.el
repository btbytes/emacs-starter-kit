;;
;; custom config/bindings.
;;

;; setup some variables.
(defvar homedir (concat (getenv "HOME") "/"))

;; and constants
(setq column-number-mode t)

;; UTILITY FUNCTIONS
(defun load-if-exists (path name)
  "Load library if it exists in the path"
  (if (file-exists-p path)
      (progn (add-to-list 'load-path path)
             (require name))))

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
(load-if-exists (concat homedir "elisp/ess/lisp")  'ess-site)

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
(add-to-list 'load-path (concat homedir "/elisp/slime"))
(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime)
(slime-setup)

;; quicklisp
(if (file-exists-p  (concat homedir "/quicklisp/slime-helper.el"))
    (load (expand-file-name (concat homedir "/quicklisp/slime-helper.el") ))
  (message "Install Quicklisp?")
  )
(require 'slime)
(slime-setup)

;; vala mode

(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;; use technomancy's marmalade.
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))


;; chicken scheme
(require 'cmuscheme)

(define-key scheme-mode-map "\C-c\C-l" 'scheme-load-current-file)
(define-key scheme-mode-map "\C-c\C-k" 'scheme-compile-current-file)

(defun scheme-load-current-file (&optional switch)
  (interactive "P")
  (let ((file-name (buffer-file-name)))
    (comint-check-source file-name)
    (setq scheme-prev-l/c-dir/file (cons (file-name-directory    file-name)
                                         (file-name-nondirectory file-name)))
    (comint-send-string (scheme-proc) (concat "(load \""
                                              file-name
                                              "\"\)\n"))
    (if switch
        (switch-to-scheme t)
        (message "\"%s\" loaded." file-name) ) ) )

(defun scheme-compile-current-file (&optional switch)
  (interactive "P")
  (let ((file-name (buffer-file-name)))
    (comint-check-source file-name)
    (setq scheme-prev-l/c-dir/file (cons (file-name-directory    file-name)
                                         (file-name-nondirectory file-name)))
    (message "compiling \"%s\" ..." file-name)
    (comint-send-string (scheme-proc) (concat "(compile-file \""
                                              file-name
                                              "\"\)\n"))
    (if switch
        (switch-to-scheme t)
        (message "\"%s\" compiled and loaded." file-name) ) ) )



;; TODO
;; Flymake and python
;; see: http://plope.com/Members/chrism/flymake-mode
;; Ropeemacs

;; virtualenvwrapper aware Flymake
;; . show currently active python interpreter in the status bar?

;; bit.ly shortcuts from within emacs

