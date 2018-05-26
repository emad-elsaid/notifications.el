(define-minor-mode notifications-mode
  "Notifications buffer mode"
  :lighter " Notifications")

(defun notifications-open ()
  "Open the notifications panel"
  (interactive)

  (when (notifications-buffer)
      (kill-buffer (notifications-buffer)))
  (split-window nil notifications-panel-width "left")
  (find-file notifications-file)
  (setq-local window-size-fixed t)
  (auto-revert-mode t)
  (set-window-dedicated-p (selected-window) t)
  (org-mode)
  (notifications-mode)
  (hidden-mode-line-mode t))

(defun notifications-close ()
  "Close the notifications panel"
  (interactive)

  (kill-buffer-and-window))

(defun notification-mark-read ()
  "Mark the notification as read"
  (interactive)

  (org-archive-subtree)
  (save-buffer))

(defun notifications-buffer ()
  "returns the buffer linked to the notifications file if it exists,
nil if it doesn't"
  (find-buffer-visiting notifications-file))
