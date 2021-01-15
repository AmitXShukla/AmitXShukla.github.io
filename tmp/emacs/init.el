(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
	     :ensure t
	     :config (which-key-mode))

;;(use-package doom-themes
;;	     :ensure t
;;	     :config (load-theme 'doom-one-light t))

(use-package doom-modeline
	     :ensure t
	     :hook (after-init . doom-modeline))

(use-package all-the-icons
	     :ensure t)

(setq inhibit-startup-message t)

(tool-bar-mode -1)

(menu-bar-mode -1)

(scroll-bar-mode -1)

;; this setting highlight selected row, looks really bad on terminal
;;(global-hl-line-mode +1)

(delete-selection-mode 1)

;; this setting is corrupting file
;; try later with an absolte path
;; (setq backup-directory-alist '(("." , "~/.saves")))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; show matching parenthesis
(show-paren-mode 1)

;; use ido or helm - ido displays on line and helm is vert minibuffer
;; (setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

;;(use-package helm
;;  :ensure t
;;  :config (helm-mode 1))

(use-package projectile
	     :ensure t
	     :config
	     (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
	     (projectile-mode +1))

(use-package dashboard
	     :ensure t
	     :init
	     (progn
	       (setq dashboard-items '((recents . 1)
				       (project . 1)))
	       (setq dashboard-show-shortcuts nil)
	       (setq dashboard-center-content t)
	       (setq dashboard-banner-logo-title "Amit Shukla")
	       (setq dashboard-set-file-icons t)
	       (setq dashboard-startup-banner "C:\\amit.la\\Programs\\emacs\\amit.png")
	       (setq dashboard-set-navigator t)
	       )
	     :config
	     (dashboard-setup-startup-hook))

(use-package treemacs
	     :ensure t
	     :bind
	     (:map global-map
		   ([f10] . treemacs)
		   ("C-<f10>" . treemacs-select-window))
	     :config
	     (setq treemacs-is-never-other-window t))

(use-package treemacs-projectile
	     :after treemacs projectile
	     :ensure t)

;; set book mark file
(setq bookmark-default-file "~/.emacs.d/bookmarks")

(use-package centaur-tabs
	     :ensure t
	     :config
	     (setq centaur-tabs-set-bar 'over
		   centaur-tabs-set-icons t
		   centaur-tabs-grey-out-icons 'buffer
		   centaur-tabs-height 24
		   centaur-tabs=set-modified-buffer t
		   centaur-tabs-modified-marker ".")
	     (centaur-tabs-mode t))

(use-package company
	     :ensure t
	     :init
	     (add-hook 'after-init-hook 'global-company-mode))

;; Flutter specific settings
;; Install use-package
(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package lsp-mode :ensure t)
(use-package lsp-dart
	     :ensure t
	     :hook (dart-mode . lsp))

;; Optional packages
(use-package projectile :ensure t) ;; project management
(use-package yasnippet
	     :ensure t
	     :config (yas-global-mode)) ;; snipets
(use-package lsp-ui :ensure t) ;; UI for LSP
(use-package company :ensure t) ;; Auto-complete

;; Optional Flutter packages
(use-package hover :ensure t) ;; run app from desktop without emulator

;; install magit package to support GitHub
(use-package magit :ensure t) ;; Git Support
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel exwm magit hover lsp-ui yasnippet lsp-dart lsp-mode company centaur-tabs treemacs-projectile treemacs dashboard projectile doom-modeline doom-themes which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(use-package eaf
;;  :load-path "~/.emacs.d/site-lisp/emacs-application-framework")

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1))

(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  (eaf-browser-continue-where-left-off t)
  :config
  (eaf-setq eaf-browser-enable-adblocker "true")
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
    (eaf-bind-key nil "M-q" eaf-browser-keybinding))
