;;; packages.el --- notifications layer packages file for Spacemacs.
;;
;; Author:  <emad.elsaid.hamed@gmail.com>
;; URL: https://github.com/emad-elsaid/notifications
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `notifications-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `notifications/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `notifications/pre-init-PACKAGE' and/or
;;   `notifications/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst notifications-packages
  '())
