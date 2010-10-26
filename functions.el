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

;; insert date in YYYY-MM-DD format
(defvar iso-date-format "%Y-%m-%d"
  "Format of date to insert with `insert-iso-date' func
See help of `format-time-string' for possible replacements")

(defun insert-iso-date ()
  "insert today's date into the current buffer"
  (interactive)
  (insert (format-time-string iso-date-format (current-time)))
  )
(global-set-key "\C-c\C-d" 'insert-iso-date)


(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))
;;(global-set-key (kbd "C-c a") 'increment-number-at-point)

(defun decrement-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0))))))
;;(global-set-key (kbd "C-c x") 'decrement-number-at-point)
