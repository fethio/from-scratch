;; Remove this line from init.el — already handled in config.el:
;; (setq mac-option-modifier 'meta)
;; Use right Option key normally for special characters
(setq mac-right-option-modifier nil)

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

;;; remove SC if you are not using sunrise commander and org if you like outdated packages
(setq package-archives '(("ELPA"  . "http://tromey.com/elpa/")
			 ("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

;;; the auto-revert timer that calls incf fires from a package that should be loaded before your config
(require 'cl-lib)
(defalias 'incf 'cl-incf)
(advice-add 'incf :override #'cl-incf)
;;; This is the actual config file. It is omitted if it doesn't exist so emacs won't refuse to launch.
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("01f347a923dd21661412d4c5a7c7655bf17fb311b57ddbdbd6fce87bd7e58de6"
     "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf"
     default))
 '(package-selected-packages
   '(auctex avy beacon browse-kill-ring company company-shell counsel
	    dashboard expand-region flycheck flycheck-clang-analyzer
	    htmlize ivy magit markdown-mode ox-reveal pdf-tools
	    popup-kill-ring smex spacemacs-theme sudo-edit swiper
	    which-key yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#292b2e" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :width normal)))))

(put 'scroll-left 'disabled nil)
