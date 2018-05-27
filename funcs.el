(define-minor-mode notifications-mode
  "Notifications buffer mode"
  :lighter " Notifications")

(defun notifications-open ()
  "Open the notifications panel"
  (interactive)

  (if (notifications-buffer)
      (notifications-panel-switch)
    (notifications-panel-create)))

(defun notifications-close ()
  "Close the notifications panel"
  (interactive)

  (kill-buffer-and-window))

(defun notification-mark-read ()
  "Mark the notification as read"
  (interactive)

  (read-only-mode -1)
  (org-archive-subtree)
  (save-buffer)
  (read-only-mode t))

(defun notifications-buffer ()
  "returns the buffer linked to the notifications file if it exists,
nil if it doesn't"
  (find-buffer-visiting notifications-file))

(defun notifications-create-bookmark (arg title)
  (interactive "P\nsBookmark title: ")

  (write-region
   (concat "* [[file:"
           (buffer-file-name)
           "::"
           (number-to-string (line-number-at-pos))
           "]["
           title
           "]]\n")
   nil
   notifications-file 'append))

(defun notifications-panel-create ()
  "Create the notifications panel"

  (split-window nil notifications-panel-width "left")
  (find-file notifications-file)
  (setq-local window-size-fixed t)
  (auto-revert-mode t)
  (set-window-dedicated-p (selected-window) t)
  (org-mode)
  (read-only-mode t)
  (notifications-mode)
  (hidden-mode-line-mode t))

(defun notifications-panel-switch ()
  "Switch to the notification panel"

  (select-window (get-buffer-window (notifications-buffer))))
