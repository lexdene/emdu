;; short for Elephant's MarkDown Utils

(provide 'emdu)

(defun emdu-insert-issue (url)
  "insert issue link"
  (interactive
    (list
     (read-from-minibuffer "issue url:")))
  (progn
    (let ((text (emdu-issue-url-to-markdown url)))
      (if text
          (insert text)
          (message "format error")))))

(defun emdu-issue-url-to-markdown (url)
  (progn
    (let
        ((org "")
         (repo "")
         (issue-number ""))
     (save-match-data
       (and (string-match "https://\\([^/]+\\)/\\([^/]+\\)/\\([^/]+\\)/\\(pull\\|issues\\)/\\([0-9]+\\)" url)
            (progn
              (setq org (match-string 2 url)
                    repo (match-string 3 url)
                    issue-number (match-string 5 url))
              (format "[%s#%s](%s)" repo issue-number url)))))))
