(setq user-full-name "s.t"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-big-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-serif-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-unicode-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light))

;; (use-package ellama
;;   :init
;;   (setopt ellama-language "French")
;;   (require 'llm-ollama)
;;   (setopt ellama-provider
;;           (make-llm-ollama
;;            :chat-model "mistral:latest"
;;            :embedding-model "mistral:latest")))

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
  (modus-themes-bold-constructs t)
  (modus-themes-italic-constructs t)
  (modus-themes-mixed-fonts t)
  (modus-themes-prompts '(italic bold))
  (modus-themes-completions '((matches . (extrabold))
                              (selection . (semibold underline))))
  (modus-themes-org-blocks 'gray-background)
  (modus-themes-headings
   '((1 . (variable-pitch 1.5))
     (2 . (1.3))
     (agenda-date . (1.3))
     (agenda-structure . (variable-pitch light 2))
     (t . (1.1))))
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

;; Set LaTeX compiler to XeLaTeX
(add-hook! 'latex-mode-hook
  (setq TeX-engine 'xelatex) 99)

;;(setq org-latex-pdf-process (list "latexmk -pdflatex='xelatex -shell-escape -interaction nonstopmode' -pdf -output-directory=%o %f"))

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

;; Automatically update buffer
(setq auto-revert-interval 0.5)

(use-package vertico
  :ensure t
  :init
  (require 'vertico-directory)
  (vertico-mode t))

(use-package marginalia
  :ensure t
  :custom
  (marginalia-annotators
   '(marginalia-annotators-heavy marginalia-annotators-light t))
  :config
  (marginalia-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(basic flex initials orderless substring))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package consult
  :ensure t
  :after vertico
  :custom
  (completion-in-region-function #'consult-completion-in-region))

(use-package embark
  :ensure t
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package corfu
  :ensure t
  ;; Optional customizations
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-popupinfo-delay '(0.5 . 0.2))
  (corfu-preview-current 'insert)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  ;; Optionally use TAB for cycling, default is `corfu-complete'.
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ([tab]        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ([backtab]    . corfu-previous)
              ("S-<return>" . corfu-insert)
              ("RET"        . nil))

  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  :config
  (add-hook 'eshell-mode-hook
            (lambda () (setq-local corfu-quit-at-boundary t
                                   corfu-quit-no-match t
                                   corfu-auto nil)
              (corfu-mode))))

(use-package cape
  :ensure t
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  :config
  ;; Silence then pcomplete capf, no errors or messages!
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)

  ;; Ensure that pcomplete does not write to the buffer
  ;; and behaves as a pure `completion-at-point-function'.
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify))
