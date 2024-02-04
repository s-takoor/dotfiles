(setq user-full-name "s.t"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-big-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-serif-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-unicode-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light))

(use-package nerd-icons)

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))

(setq-default line-spacing 0.2)

(use-package modus-themes
  :ensure t
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs nil)
  (modus-themes-mixed-fonts t)
  (modus-themes-org-blocks 'gray-background)
  (modus-themes-completions '((t . (extrabold))))
  (modus-themes-headings
   '((agenda-structure . (variable-pitch light 2.2))
     (agenda-date . (variable-pitch regular 1.3))
     (t . (regular 1.15))))
  :init
  (load-theme 'modus-vivendi t))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(add-to-list 'default-frame-alist '(undecorated-round . t))

(set-frame-parameter (selected-frame) 'alpha '(70 . 50))
(add-to-list 'default-frame-alist '(alpha . (70 . 50)))

(use-package beacon
  :init
  (beacon-mode 1))

(setq display-line-numbers-type 'relative)

(after! doom-modeline
(setq doom-modeline-enable-word-count t
      doom-modeline-window-width-limit nil
      doom-modeline-battery t
      doom-modeline-major-mode-icon t
      doom-modeline-major-mode-color-icon t
      doom-modeline-lsp t
      doom-modeline-bar-width 4))

(setq centaur-tabs-default-font "Iosevka NF"
      centaur-tabs-set-bar 'right
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-close-button "⨂"
      centaur-tabs-modified-marker "⨀")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(use-package org-alert
  :ensure t
  :custom (alert-default-style 'osx-notifier)
  :config
  (setq org-alert-interval 1200
        org-alert-notification-title "Org Alert Reminder!")
  (org-alert-enable))

;; Set the default Python interpreter to Python3
(setq org-babel-python-command "python3")

;; Set ditaa path
(setq org-ditaa-jar-path "/opt/homebrew/Cellar/ditaa/0.11.0_1/libexec/ditaa-0.11.0-standalone.jar")

(setq org-directory "~/Documents/orgfiles/"
      org-agenda-files '("~/Documents/orgfiles/agenda.org")
      org-agenda-tags-column 0
      org-agenda-block-separator ?─
      org-auto-align-tags nil
      org-catch-invisible-edits 'show-and-error
      org-edit-src-content-indentation 0
      org-ellipsis " ▼ "
      org-hide-emphasis-markers t
      org-hide-leading-stars t
      org-indent-mode nil
      org-insert-heading-respect-content t
      org-log-done t
      org-pretty-entities t
      org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-special-ctrl-a/e t
      org-startup-indented nil
      org-tags-column 0
      org-agenda-time-grid
      '((daily today require-timed)
        (800 1000 1200 1400 1600 1800 2000)
        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
      org-agenda-current-time-string
      "⭠ now ─────────────────────────────────────────────────")

(use-package org-modern
  :ensure t
  :config
  (setq org-modern-table-vertical 1
        org-modern-table-horizontal 1
        org-modern-horizontal-rule t)
  :init
  (global-org-modern-mode))

(require 'ox-latex)

(setq org-latex-pdf-process (list "latexmk -pdflatex='xelatex -shell-escape -interaction nonstopmode' -pdf -output-directory=%o %f"))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("article"
                 "\\documentclass[letterpaper]{article}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 )))

(use-package ox-reveal)
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

(use-package pdf-tools
  :defer t
  :commands (pdf-loader-install)
  :mode "\\.pdf\\'"
  :bind (:map pdf-view-mode-map
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page))
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf"))

(add-hook 'pdf-view-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))

(use-package vertico
  :init
  (vertico-mode)
  :config
  (setq vertico-scroll-margin 0
        vertico-cycle t
        vertico-count 20
        vertico-resize t)
  (define-key vertico-map (kbd "M-j") 'vertico-next)
  (define-key vertico-map (kbd "M-k") 'vertico-previous))

(use-package marginalia
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))
