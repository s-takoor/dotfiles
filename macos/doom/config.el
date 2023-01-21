(setq user-full-name "Shashiduth Takoor"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 12)
      doom-big-font (font-spec :family "Iosevka Nerd Font" :size 15))

(setq doom-theme 'doom-zenburn)

(setq fancy-splash-image (concat doom-user-dir "doom-emacs-gray.svg"))

(setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-modified-marker "•")

(use-package all-the-icons-dired
     :hook
     (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-completion
  :after
  (marginalia all-the-icons)
  :hook
  (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(beacon-mode 1)

(setq display-line-numbers-type t)

(use-package org-alert
  :ensure t
  :custom (alert-default-style 'osx-notifier)
  :config
  (setq org-alert-interval 3600
        org-alert-notification-title "Org Alert Reminder!")
  (org-alert-enable))

(fset 'yes-or-no-p 'y-or-n-p) ;; don't ask to spell out "yes"
(show-paren-mode 1) ;; highlight parenthesis

(setq scroll-step 1
      scroll-conservatively 10000)

(setq org-directory "~/Documents/OrgFiles/"
      org-agenda-files '("~/Documents/OrgFiles/agenda.org")
      org-agenda-block-separator 45
      org-log-done t
      org-hide-emphasis-markers t ;; hide emphasis markup (e.g. bold, italics, etc.)
      org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-ellipsis " ▼ "
      org-edit-src-content-indentation 0)

(use-package org-superstar
  :config
  (setq org-superstar-leading-bullet " ")
  (setq org-superstar-special-todo-items t))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(use-package exec-path-from-shell
  :ensure t)

;; Emacs GUI frame
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Emacs daemon
(when (daemonp)
  (exec-path-from-shell-initialize))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package vertico
  :custom
  (vertico-count 20)
  (vertico-resize t)
  (vertico-cycle nil)
  :config
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles basic-remote
                   orderless)))))

(use-package vertico-directory
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("RET"   . vertico-directory-enter)
              ("DEL"   . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("M-g g" . consult-goto-line)
         ("C-c n" . consult-org-agenda))
  :custom
  (completion-in-region-function #'consult-completion-in-region)
  :config
  (add-hook 'completion-setup-hook #'hl-line-mode))

(use-package marginalia
  :ensure t
  :custom
  (marginalia-maxrelative-age 0)
  (marginalia-align 'right)
  :init
  (marginalia-mode))

(use-package embark
  :ensure t

  :bind
  (("C-a" . embark-act)         ;; Doom Emacs (SPC a)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings' Doom Emacs (SPC h b)

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-no-match 'separator)
  :init
  (global-corfu-mode))

(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(use-package lsp-mode
  :custom
  (lsp-completion-provider :none)    ;; corfu is used

  :init
  (defun my/orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))

  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles
                     (alist-get 'lsp-capf completion-category-defaults))
          '(orderless)))

  (add-hook 'orderless-style-dispatchers #'my/orderless-dispatch-flex-first nil 'local)

  (setq-local completion-at-point-functions (list (cape-capf-buster #'lsp-completion-at-point)))

  :hook
  (lsp-completion-mode . my/lsp-mode-setup-completion))

;; LSP for solidity
(require 'solidity-mode)

(require 'ox-latex)

(with-eval-after-load 'ox-latex
  (setq org-latex-pdf-process '("latexmk -xelatex -quiet -shell-escape -f %f"))
  (add-to-list 'org-latex-classes
               '("custom-latex"
                 "\\documentclass{report}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%$}" . "\\subparagraph*{%s}"))))

(with-eval-after-load 'ox-latex
  (setq org-latex-pdf-process '("latexmk -xelatex -quiet -shell-escape -f %f"))
  (add-to-list 'org-latex-classes
               '("custom-article"
                 "\\documentclass{article}
[NO-DEFAULT-PACKAGES]
[PACKAGES]
[EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%$}" . "\\subparagraph*{%s}"))))

(setq org-latex-inputenc-alist '(("utf8" . "utf8x")))

;; Latex Table Caption
(setq org-latex-caption-above nil)

;; Pagebreak for table of contents
(setq org-latex-toc-command "\\tableofcontents\n\\pagebreak\n\n")

;; Source Code Blocks
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-minted-options '(("breaklines" "true")
                                 ("breakanywhere" "true")
                                 ("mathescape")
                                 ("frame" "lines")))
