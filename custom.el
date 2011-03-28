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
;;; CHICKEN SCHEME
(add-to-list 'load-path "/var/lib/chicken/5/")
   ; Where Eggs are installed
(autoload 'chicken-slime "chicken-slime" "SWANK backend for Chicken" t)
(add-hook 'scheme-mode-hook
          (lambda ()
            (slime-mode t)))

(require 'quack)
(require 'cmuscheme)
(define-key scheme-mode-map "\C-c\C-l" 'scheme-load-current-file)
(define-key scheme-mode-map "\C-c\C-k" 'scheme-compile-current-file)

(defun scheme-load-current-file (&optional switch)
  (interactive "P")
  (let ((file-name (buffer-file-name)))
    (comint-check-source file-name)
    (setq scheme-prev-l/c-dir/file (cons (file-name-directory    file-name)
                                         (file-name-nondirectory file-name)))
    (comint-send-string (scheme-proc)
                        (concat "(load \""
                                file-name
                                "\"\)\n"))
    (if switch
        (switch-to-scheme t)
      (message "\"%s\" loaded." file-name))))

(defun scheme-compile-current-file (&optional switch)
  (interactive "P")
  (let ((file-name (buffer-file-name)))
    (comint-check-source file-name)
    (setq scheme-prev-l/c-dir/file (cons (file-name-directory    file-name)
                                         (file-name-nondirectory file-name)))
    (message "compiling \"%s\" ..." file-name)
    (comint-send-string (scheme-proc)
                        (concat "(compile-file \""
                                file-name
                                "\"\)\n"))
    (if switch
        (switch-to-scheme t)
      (message "\"%s\" compiled and loaded." file-name))))

;; vala mode

(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;; use technomancy's marmalade.
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))



;; TODO
;; Flymake and python
;; see: http://plope.com/Members/chrism/flymake-mode
;; Ropeemacs

;; virtualenvwrapper aware Flymake
;; . show currently active python interpreter in the status bar?

;; bit.ly shortcuts from within emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(quack-manuals (quote ((r5rs "R5RS" "http://www.schemers.org/Documents/Standards/R5RS/HTML/" nil) (bigloo "Bigloo" "http://www-sop.inria.fr/mimosa/fp/Bigloo/doc/bigloo.html" nil) (chez "Chez Scheme User's Guide" "http://www.scheme.com/csug/index.html" nil) (chicken "Chicken User's Manual" "http://wiki.call-cc.org/man/4/The%20User's%20Manual" nil) (gambit "Gambit-C home page" "http://www.iro.umontreal.ca/~gambit/" nil) (gauche "Gauche Reference Manual" "http://www.shiro.dreamhost.com/scheme/gauche/man/gauche-refe.html" nil) (mitgnu-ref "MIT/GNU Scheme Reference" "http://www.gnu.org/software/mit-scheme/documentation/scheme.html" nil) (mitgnu-user "MIT/GNU Scheme User's Manual" "http://www.gnu.org/software/mit-scheme/documentation/user.html" nil) (mitgnu-sos "MIT/GNU Scheme SOS Reference Manual" "http://www.gnu.org/software/mit-scheme/documentation/sos.html" nil) (plt-mzscheme "PLT MzScheme: Language Manual" plt t) (plt-mzlib "PLT MzLib: Libraries Manual" plt t) (plt-mred "PLT MrEd: Graphical Toolbox Manual" plt t) (plt-framework "PLT Framework: GUI Application Framework" plt t) (plt-drscheme "PLT DrScheme: Programming Environment Manual" plt nil) (plt-insidemz "PLT Inside PLT MzScheme" plt nil) (plt-tools "PLT Tools: DrScheme Extension Manual" plt nil) (plt-mzc "PLT mzc: MzScheme Compiler Manual" plt t) (plt-r5rs "PLT R5RS" plt t) (scsh "Scsh Reference Manual" "http://www.scsh.net/docu/html/man-Z-H-1.html" nil) (sisc "SISC for Seasoned Schemers" "http://sisc.sourceforge.net/manual/html/" nil) (htdp "How to Design Programs" "http://www.htdp.org/" nil) (htus "How to Use Scheme" "http://www.htus.org/" nil) (t-y-scheme "Teach Yourself Scheme in Fixnum Days" "http://www.ccs.neu.edu/home/dorai/t-y-scheme/t-y-scheme.html" nil) (tspl "Scheme Programming Language (Dybvig)" "http://www.scheme.com/tspl/" nil) (sicp "Structure and Interpretation of Computer Programs" "http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-4.html" nil) (slib "SLIB" "http://swissnet.ai.mit.edu/~jaffer/SLIB.html" nil) (faq "Scheme Frequently Asked Questions" "http://www.schemers.org/Documents/FAQ/" nil))))
 '(quack-programs (quote ("csc" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
