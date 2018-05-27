(when (fboundp 'evil-define-minor-mode-key)
  (evil-define-minor-mode-key 'normal 'notifications-mode (kbd "q") 'notifications-close)
  (evil-define-minor-mode-key 'normal 'notifications-mode (kbd "r") 'notification-mark-read))

(spacemacs/declare-prefix "an" "Notifications")
(spacemacs/set-leader-keys "ann" 'notifications-open)
