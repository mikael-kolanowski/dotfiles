;;; ... -*- lexical-binding: t -*-
;;;###autoload
(defun surround-with (start end pre post)
  "Wrap region with custom strings."
  (interactive
   (list
    (region-beginning)
    (region-end)
    (read-string "Pre: ")
    (read-string "Post: ")))
  (replace-region-contents start end
                           (lambda ()
                             (format "%s%s%s"
                                    pre
                                    (buffer-substring start end)
                                    post))))

;;;###autoload
(defun surround-with-parens (start end)
  (interactive "r")
  (surround-with start end "(" ")"))

;;;###autoload
(defun surround-with-braces (start end)
  (interactive "r")
  (surround-with start end "{" "}"))

;;;###autoload
(defun surround-with-brackets (start end)
  (interactive "r")
  (surround-with start end "<" ">"))

;;;###autoload
(defun surround-with-tag (start end tag)
  (interactive (list (region-beginning) (region-end) (read-string "Tag: ")))
  (surround-with start end (format "<%s>" tag) (format "</%s>" tag)))

;;;###autoload
(global-set-key (kbd "C-c s (") #'surround-with-parens)
;;;###autoload
(global-set-key (kbd "C-c s {") #'surround-with-braces)
;;;###autoload
(global-set-key (kbd "C-c s <") #'surround-with-brackets)
;;;###autoload
(global-set-key (kbd "C-c s t") #'surround-with-tag)
