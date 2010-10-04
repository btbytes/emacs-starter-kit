;; Custom functions.

;; Source:
;; http://communitygrids.blogspot.com/2007/11/emacs-goto-column-function.html

;; (defun goto-column-number (number)
;;   (interactive "nColumn number ( - 1 == C) ? ")
;;   (beginning-of-line)
;;   (untabify (point-min) (point-max))
;;   (while (> number 1)
;;     (if (eolp)
;;         (insert ?)
;;       (forward-char))
;;     (setq number (1- number)))
;;   )
