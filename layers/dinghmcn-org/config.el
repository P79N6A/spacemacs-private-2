;;; config.el --- dinghmcn Layer packages File for Spacemacs
;;
;; Copyright (c) 2014-2016 dinghmcn
;;
;; Author: dinghmcn <guanghui8827@gmail.com>
;; URL: https://github.com/dinghmcn/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun dinghmcn/org-ispell ()
  "Configure `ispell-skip-region-alist' for `org-mode'."
  (make-local-variable 'ispell-skip-region-alist)
  (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re))
  (add-to-list 'ispell-skip-region-alist '("~" "~"))
  (add-to-list 'ispell-skip-region-alist '("=" "="))
  (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC" . "^#\\+END_SRC")))

(add-hook 'org-mode-hook #'dinghmcn/org-ispell)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
