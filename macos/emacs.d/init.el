;; GNU EMACS CUSTOM CONFIG
;; init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; USE-PACKAGE
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; NATIVE COMPILATION
(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
  (setq native-comp-deferred-compilation nil))
(setq load-prefer-newer noninteractive)

;; GENERAL
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(show-paren-mode 1)
(delete-selection-mode t)

;; Emacsclient tweaks
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;;ALL-THE-ICONS
(use-package all-the-icons)

;; EVIL-MODE
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (evil-mode 1))

;; Evil surrounding (parenthese, brackets, quotes, etc.)
(use-package evil-surround
  :after evil
  :defer 2
  :config
  (global-evil-surround-mode 1))

;; Collection of Evil bindings
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

; GENERAL-KEYBINDINGS
(use-package general
  :config
  (general-evil-setup t))

(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 :prefix "SPC"

 "SPC" '(consult-M-x :which-key "M-x")
 "h r r" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :which-key "Reload emacs config")

 ;; BUFFERS
 "b" '(nil :which-key "buffer")
 "bb" '(consult-buffer :which-key "switch-buffers")
 "bd" '(evil-delete-buffer :which-key "delete buffer")

 ;; DIRED
 "dd" '(dired :which-key "Open dired")
 
 ;; Eval elisp exp
 "eb" '(eval-buffer : which-key "Eval elisp in buffer")
 "er" '(eval-region : which-key "Eval region")
 
 ;; FILES
 "f" '(nil :which-key "files")
 ;;"ff" '(counsel-find-file :which-key "find-file")
 "." '(find-file :which-key "find-file")
 "ff" '(find-file :which-key "find-file")
 
 ;;TREEMACS
 "t" '(treemacs :which-key "treemacs"))

;; MODElINE
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; ORG-MODE
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () 
                           (org-bullets-mode 1)
                           (visual-line-mode)
                           (org-indent-mode)))

;; SOURCE-CODE-BLOCK
(use-package org-tempo
  :ensure nil)

;; SOURCE-CODE-BLOCK-SYNTAX-HIGHLIGHTING
(setq org-src-fontify-natively t
      org-ellipsis " ▼ "
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)

;; THEME
(use-package doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-one t)

;; DIRED
(use-package all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(use-package dired-open)

;; BEACON
(use-package beacon
  :config
  (beacon-mode 1))

;; FONTS
(set-face-attribute 'default nil
		    :font "Iosevka Nerd Font"
		    :height 100
		    :weight 'medium)

(setq global-prettify-symbols-mode t)

;; DASHBOARD
(use-package dashboard
  :after all-the-icons
  :init
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner "~/.emacs.d/modern-doom3.png")
  (setq dashboard-banner-logo-title "hello friend! welcome to the dark side of the EMACS editor!")
  (setq dashboard-center-content nil)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  :config
  (dashboard-setup-startup-hook))

;; Tree layout file explorer
(use-package treemacs
  :config
  (treemacs-resize-icons 15)
  (setq treemacs-width 30)
  (treemacs-follow-mode -1))

;; Minor mode displaying keybindings
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;; Projects
(use-package projectile
  :ensure t
  :config
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-system 'alien))

;; Syntax checking extension
(use-package flycheck)

;; Template system for Emacs allowing typing abbreviation and automatically expand it into function templates (TBA)
(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

;; LSP setup
(use-package lsp-mode
  :hook
  ((lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-treemacs)

;; Minor mode for dealing with pairs in Emacs
(use-package smartparens
  :diminish smartparens-mode
  :defer 1
  :config
  (require 'smartparens-config)
  (setq sp-max-prefix-length 25)
  (setq sp-max-pair-length 4)
  (smartparens-global-mode t))

;; Completion system
;; Preserve minibuffer history
(use-package savehist
  :config
  (setq history-length 25)
  (savehist-mode 1))


;; Completions in regions with corfu
(use-package corfu
  :custom
  (corfu-separator ?\s)
  (corfu-preview-current nil)
  (corfu-auto nil)
  (corfu-on-exact-match nil)
  (corfu-quit-no-match 'separator)
  (corfu-preselect-first nil)
  :bind (:map corfu-map
	      ("SPC" . corfu-insert-separator)
	      ("TAB" . corfu-next)
	      ([tab] . corfu-next)
	      ("S-TAB" . corfu-previous)
	      ([backtab] . corfu-previous)))

(use-package corfu-doc
  :hook
  (corfu-mode . corfu-doc-mode)
  :bind (:map corfu-map
	      ("M-n" . corfu-doc-scroll-down)
	      ("M-p" . corfu-doc-scroll-up)
	      ("M-d" . corfu-doc-toggle)))

(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic-remote orderless)))))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :defer t
  :init
  (add-to-list 'completion-at-point-functions #' cape-file)
  (add-to-list 'completion-at-point-functions #' cape-dabbrev)
  (add-to-list 'completion-at-point-functions #' cape-keyword))

(setq completion-cycle-threshold 1)
(setq tab-always-indent 'complete)

(use-package consult
  :ensure t
  :bind (("C-c h" . consult-history)
	 ("C-x b" . consult-buffer)
	 ("M-g i" . consult-imenu)
	 :map minibuffer-local-map
	 ("M-s" . consult-history)
	 ("M-r" . consult-history))
  :hook (completion-list-mode . consult-preview-at-point-mode))

;; Completion annotations (marginalia)
(use-package marginalia
  :general
  (:keymaps 'minibuffer-local-map
	    "M-A" 'marginalia-cycle)
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :init
  (marginalia-mode))

(all-the-icons-completion-mode)

(add-hook 'marginalia-mode-hook #' all-the-icons-completion-marginalia-setup)

;; Minibuffer and Vertico configurations
(use-package vertico
  :custom
  (vertico-count 15)
  (vertico-resize t)
  (vertico-cycle nil)
  :general
  (:keymaps 'vertico-map
	    "<tab>" #' vertico-insert
	    "<escape>" #' minibuffer-keyboard-quit)
  :config
  (vertico-mode))

;; Completion actions with Embark
(use-package embark
  :bind (("C-S-a" . emabark-act)
	 :map minibuffer-local-map
	 ("C-d" . embark-act))
  :config
  (setq embark-action-indicator
	(lambda (map)
	  (which-key--show-keymap "Embark" map nil nil 'no-paging)
	  #'which-key--hide-popup-ignore-command)
	embark-become-indicator embark-action-indicator))

