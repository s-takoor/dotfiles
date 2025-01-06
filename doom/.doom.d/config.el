(setq user-full-name "s.t"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq-default abbrev-mode t)

(beacon-mode t)

(setq make-backup-files nil)
(setq backup-inhibited nil)
(setq create-lockfiles nil)

(setq centaur-tabs-default-font "JetBrainsMono NF" ;; or Iosevka NF
      centaur-tabs-set-bar 'right
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-close-button "⨂"
      centaur-tabs-modified-marker "⨀")

(setq completion-styles '(basic flex)
      completion-auto-select t
      completion-auto-help 'visible
      completions-format 'one-column
      completions-sort 'historical
      completions-max-height 20
      completion-ignore-case t)

(use-package! denote
  :after org
  :config
  (setq denote-directory (expand-file-name "~/Documents/notes/")
        denote-known-keywords '("work" "personal" "ideas" "projects")
        denote-file-type nil))

(use-package! consult-notes
  :commands (consult-notes
             consult-notes-search-in-all-notes))

(setq history-delete-duplicates t)

;; font rendering
(setq ns-use-thin-smoothing t)

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 11 :weight 'light)
      doom-big-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-serif-font (font-spec :family "JetBrainsMono NF" :size 11 :weight 'light)
      doom-symbol-font (font-spec :family "JetBrainsMono NF" :size 11 :weight 'light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono NF" :size 11 :weight 'light))

(setq doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 11 :weight 'light))

(modify-all-frames-parameters
 '((right-divider-width . 40)
   (internal-border-width . 40)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))
(set-face-background 'fringe (face-attribute 'default :background))

(set-frame-parameter (selected-frame) 'alpha '(70 . 90))
(add-to-list 'default-frame-alist '(alpha . (70 . 90)))

(setq imenu-list-auto-resize t
      imenu-list-focus-after-activation t)

(after! jinx
  (global-jinx-mode))

(setq mac-command-modifier 'meta
      mac-option-modifier 'none)

(use-package! gptel
  :commands (gptel gptel-send)
  :bind (("C-c C-<return>" . gptel-menu)
         ("C-c <return>" . gptel-send)
         :map gptel-mode-map
         ("C-c C-x t" . gptel-set-topic))
  :config
  ;; ollama backend configuration
  (defvar gptel--ollama
    (gptel-make-ollama
     "Ollama"
     :host "localhost:11434"
     :models '("mistral:latest" "zephyr:latest" "openhermes:latest")
     :stream t))

  ;; ollama backend with image support
  (defvar gptel--ollama-vision
    (gptel-make-ollama
     "Ollama-Vision"
     :host "localhost:11434"
     :models '(mistral:latest zephyr:latest openhermes:latest
               (llava:7b :description "Llava 1.6: Vision capable model"
                :capabilities (images)
                :mime-types ("image/jpeg" "image/png")))
     :stream t))

  ;; default settings
  (setq-default gptel-backend gptel--ollama
                gptel-model 'mistral:latest
                gptel-default-mode 'org-mode)

  ;; org mode integration
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "*Prompt*: "
        (alist-get 'org-mode gptel-response-prefix-alist) "*Response*:\n"
        (alist-get 'markdown-mode gptel-prompt-prefix-alist) "#### ")

  ;; eshell integration
  (defun my/gptel-eshell-send (&optional arg)
    (interactive "P")
    (if (use-region-p)
        (gptel-send arg)
      (push-mark)
      (or (eshell-previous-prompt 0)
          (eshell-previous-prompt 1))
      (activate-mark)
      (gptel-send arg)
      (exchange-point-and-mark)
      (deactivate-mark)))

  (defun my/gptel-eshell-keys ()
    (define-key eshell-mode-map (kbd "C-c <return>") #'my/gptel-eshell-send))

  (add-hook 'eshell-mode-hook 'my/gptel-eshell-keys))

(use-package! gptel-ask
  :after gptel
  :bind (:map help-map
              ("C-q" . gptel-ask))
  :config
  (setq gptel-ask-default-backend gptel--ollama))

(use-package! gptel-quick
  :after gptel
  :bind (:map embark-general-map
              ("?" . gptel-quick)))

(setq display-line-numbers-type 'relative)

(setq-default line-spacing 0.2)

(setq-default inhibit-startup-message t
              use-short-answers t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(undecorated-round . t))

;; turn on pixel scrolling
(pixel-scroll-precision-mode t)

(use-package! doom-modeline
  :ensure t
  :config
  (setq doom-modeline-enable-word-count t
        doom-modeline-battery t
        doom-modeline-env-version t
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-time t
        doom-modeline-time-icon t
        doom-modeline-time-live-icon t
        doom-modeline-lsp t)
  :init (doom-modeline-mode 1))

(use-package! modus-themes
  :config
  (setq modus-themes-variable-pitch-ui t
        modus-themes-bold-constructs t
        modus-themes-italic-constructs t
        modus-themes-mixed-fonts t
        modus-themes-prompts '(italic bold)
        modus-themes-completions '((matches . (extrabold underline))
                                   (selection . (semibold italic text-also underline)))
        modus-themes-org-blocks 'gray-background
        modus-themes-headings '((1 . (variable-pitch 1.5))
                                (2 . (1.3))
                                (agenda-date . (1.3))
                                (agenda-structure . (variable-pitch light 2.2))
                                (t . (1.15))))

  ;; set the default theme
  (setq doom-theme 'modus-vivendi-tritanopia))

(when (native-comp-available-p)
  (setq native-comp-async-report-warnings-errors 'silent)
  (setq native-compile-prune-cache t))

(use-package! spacious-padding
  :config
  (setq spacious-padding-widths
        '(:internal-border-width 15
          :header-line-width 4
          :mode-line-width 6
          :tab-width 4
          :right-divider-width 1
          :scroll-bar-width 8
          :left-fringe-width 20
          :right-fringe-width 20))

  (setq spacious-padding-subtle-mode-line
        '(:mode-line-active 'default
          :mode-line-inactive vertical-border))

  (spacious-padding-mode 1))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(use-package! org-alert
  :config
  (setq org-alert-interval 1200
        org-alert-notify-cutoff 10
        org-alert-notify-after-event-cutoff 10
        org-alert-notification-title "Org Alert Reminder!"))

(use-package! alert
  :config
  (setq alert-default-style 'osx-notifier))

(use-package! org-appear
  :hook
  (org-mode . org-appear-mode))

;; Set the default Python interpreter to Python3
(setq org-babel-python-command "python3")

;; Set ditaa path
(setq org-ditaa-jar-path "/opt/homebrew/Cellar/ditaa/0.11.0_1/libexec/ditaa-0.11.0-standalone.jar")

;; org-download for image handling
(use-package! org-download
  :after org
  :config
  (setq org-download-method 'attach
        org-download-image-dir "~/Pictures/org-images"
        org-download-screenshot-method "screencapture -i %s"))

(setq org-directory "~/Documents/orgfiles/"
      org-auto-align-tags nil
      org-tags-column 0
      org-fold-catch-invisible-edits 'show-and-error
      org-special-ctrl-a/e t
      org-insert-heading-respect-content t
      org-log-done 'time
      org-log-into-drawer t
      org-edit-src-content-indentation 0

      org-export-with-broken-links t
      org-export-with-drawers nil
      org-export-with-todo-keywords nil
      org-export-with-toc t
      org-export-headline-levels 8
      org-export-with-smart-quotes t

      ;; styling, hide markup, etc.
      org-ellipsis "..."
      org-hide-emphasis-markers t
      org-hide-leading-stars t
      org-pretty-entities t
      org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-startup-indented nil
      org-startup-with-inline-images t
      org-image-actual-width '(300)

      ;; agenda configuration
      org-agenda-window-setup 'current-window
      org-agenda-files '("~/Documents/orgfiles/agenda.org")
      org-agenda-tags-column 0
      org-agenda-block-separator ?─
      org-agenda-time-grid
      '((daily today require-timed)
        (800 1000 1200 1400 1600 1800 2000)
        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
      org-agenda-current-time-string
      "⭠ now ─────────────────────────────────────────────────")

(use-package! org-modern
  :hook ((org-mode . global-org-modern-mode)
         (org-agenda-finalize . org-modern-agenda))
  :config
  (setq org-modern-star '("◉" "○" "✸" "✿" "✤" "✙" "♱" "♰" "☥" "✞")
        org-modern-table-vertical 1
        org-modern-table-horizontal 0.2
        org-modern-horizontal-rule t
        org-modern-block t
        org-modern-block-name t
        org-modern-keyword t
        org-modern-todo t
        org-modern-priority t
        org-modern-tag t
        org-modern-statistics t
        org-modern-progress t
        org-modern-label-border 0.3
        org-modern-variable-pitch nil)
  (global-org-modern-mode))

(after! ox-latex
  (setq org-latex-compiler "xelatex"
        org-latex-pdf-process
        '("latexmk -pdflatex='xelatex -shell-escape -interaction nonstopmode' -pdf -output-directory=%o %f"))
  (add-to-list 'org-latex-classes
               '("article"
                 "\\documentclass[letterpaper]{article}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
  (require 'engrave-faces-latex)
  (setq org-latex-src-block-backend 'engraved))

(use-package! pdf-tools
  :config
  (pdf-tools-install)
  (setq-default pdf-view-use-scaling t
                pdf-view-use-imagemagick nil))

(use-package rainbow-mode
  :commands rainbow-mode
  :ensure t)

(use-package rainbow-delimiters
  :commands rainbow-delimiters-mode
  :ensure t)

(setq auto-save-default t
      auto-save-timeout 20)

(use-package! elfeed
  :config
  (setq elfeed-search-filter "@2-weeks-ago")
  (add-hook! 'elfeed-search-mode-hook #'elfeed-update)
  (global-set-key (kbd "C-x w") #'elfeed))

(use-package! elfeed-goodies
  :after elfeed
  :config
  (elfeed-goodies/setup))

;; use bash for processes that require a POSIX shell
(setq shell-file-name (executable-find "bash")
      explicit-shell-file-name (executable-find "bash"))

;; use fish while keeping bash as the default shell for other Emacs processes
(setq-default vterm-shell (executable-find "fish")
              explicit-shell-file-name (executable-find "fish"))
