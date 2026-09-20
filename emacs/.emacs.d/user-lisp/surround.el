;;; ... -*- lexical-binding: t -*-
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

(defun surround-with-parens (start end)
  (interactive "r")
  (surround-with start end "(" ")"))

(defun surround-with-braces (start end)
  (interactive "r")
  (surround-with start end "{" "}"))

(defun surround-with-brackets (start end)
  (interactive "r")
  (surround-with start end "<" ">"))

(defun surround-with-tag (start end tag)
  (interactive (list (region-beginning) (region-end) (read-string "Tag: ")))
  (surround-with start end (format "<%s>" tag) (format "</%s>" tag)))

(global-set-key (kbd "C-c s (") #'surround-with-parens)
(global-set-key (kbd "C-c s {") #'surround-with-braces)
(global-set-key (kbd "C-c s <") #'surround-with-brackets)
(global-set-key (kbd "C-c s t") #'surround-with-tag)
