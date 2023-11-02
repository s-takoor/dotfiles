(setq user-full-name "Shashiduth Takoor"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light)
      doom-big-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light)
      doom-serif-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light)
      doom-unicode-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light))

(use-package all-the-icons)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(add-to-list 'default-frame-alist '(undecorated-round . t))

(setq modus-themes-custom-auto-reload nil
      modus-themes-mixed-fonts t
      modus-themes-variable-pitch-ui nil
      modus-themes-italic-constructs t
      modus-themes-bold-constructs nil
      modus-themes-org-blocks 'gray-background
      modus-themes-completions '((t . (extrabold)))
      modus-themes-prompts nil
      modus-themes-headings
      '((agenda-structure . (variable-pitch light 2.2))
        (agenda-date . (variable-pitch regular 1.3))
        (t . (regular 1.15))))

(setq modus-themes-common-palette-overrides
      '((cursor magenta-cooler)
        (fringe bg-active)
        (fg-line-number-inactive "gray50")
        (fg-line-number-active cyan-cooler)
        (bg-line-number-inactive unspecified)
        (bg-line-number-active unspecified)
        (bg-hl-line bg-dim)
        (bg-region bg-sage)
        (fg-region unspecified)
        (bg-paren-match bg-magenta-intense)
        (mail-cite-0 fg-dim)
        (mail-cite-1 blue-faint)
        (mail-cite-2 fg-dim)
        (mail-cite-3 blue-faint)
        (mail-part cyan-warmer)
        (mail-recipient blue-warmer)
        (mail-subject magenta-cooler)
        (mail-other cyan-warmer)
        (date-deadline magenta-cooler)
        (date-scheduled magenta)
        (date-weekday fg-main)
        (date-event fg-dim)
        (date-now blue-faint)
        (prose-done cyan-cooler)
        (prose-tag fg-dim)
        (prose-table fg-main)
        (fg-heading-2 blue-faint)
        (fg-heading-3 magenta-faint)
        (fg-heading-4 blue-faint)
        (fg-heading-5 magenta-faint)
        (fg-heading-6 blue-faint)
        (fg-heading-7 magenta-faint)
        (fg-heading-8 blue-faint)
        (bg-mode-line-active bg-lavender)
        (border-mode-line-active bg-lavender)
        (bg-mode-line-inactive bg-dim)
        (border-mode-line-inactive bg-inactive)
        (bg-prompt bg-magenta-nuanced)
        (fg-prompt magenta-cooler)
        (name blue-warmer)
        (identifier magenta-faint)
        (keybind magenta-cooler)
        (accent-0 magenta-cooler)
        (accent-1 cyan-cooler)
        (accent-2 blue-warmer)
        (accent-3 red-cooler)))
(custom-set-faces
 '(mode-line ((t :box (:style released-button)))))

(load-theme 'modus-vivendi t)

(set-frame-parameter (selected-frame) 'alpha '(70 . 50))
(add-to-list 'default-frame-alist '(alpha . (70 . 50)))

(modify-all-frames-parameters
 '((right-divider-width . 20)
   (internal-border-width . 20)))
(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel)))
(set-face-background 'fringe (face-attribute 'default :background))

(after! highlight-indent-guides
  (setq highlight-indent-guides-character ?│
        highlight-indent-guides-responsive 'top))

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

(setq centaur-tabs-default-font "Iosevka Nerd Font"
      centaur-tabs-set-bar 'right
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-close-button "⨂"
      centaur-tabs-modified-marker "⨀")

(setq shell-file-name (executable-find "zsh"))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-agenuto-tangle-default t))

(use-package org-alert
  :ensure t
  :custom (alert-default-style 'osx-notifier)
  :config
  (setq org-alert-interval 1500
        org-alert-notification-title "Org Alert Reminder!")
  (org-alert-enable))

;; Set the default Python interpreter to Python3
(setq org-babel-python-command "python3")

;; Set ditaa path
(setq org-ditaa-jar-path "/opt/homebrew/Cellar/ditaa/0.11.0_1/libexec/ditaa-0.11.0-standalone.jar")

(require 'ox-latex)

;; Configure PDF export with XeLaTeX and shell escape
(setq
    org-latex-pdf-process
    '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
      "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Define a custom LaTeX class for the thesis
(with-eval-after-load 'ox-latex
   (add-to-list 'org-latex-classes
                '("scrartcl"
                  "\\documentclass[letterpaper]{scrartcl}"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

;; Source Code Blocks
(setq org-latex-listings 'minted
      org-latex-packages-alist
      '(("newfloat" "minted")
        ("color" "xcolor")
        ("" "booktabs"))
      org-latex-minted-options
      '(("breaklines" "true")
        ("breakanywhere" "true")
        ("mathescape")
        ("frame" "lines")
        ("linenos" "true")
        ("rmlines" "true")))

;; Latex Table Caption
(setq org-latex-caption-above nil)

;; Table of Contents (TOC)
(setq org-export-with-toc t)
(setq org-export-latex-format-toc-function 'org-export-latex-no-toc)
(defun org-export-latex-no-toc (depth)
    (when depth
      (format "%% Org-mode is exporting headings to %s levels.\n"
              depth)))

(setq org-directory "~/Documents/OrgFiles/"
      org-agenda-files '("~/Documents/OrgFiles/agenda.org")
      org-agenda-tags-column 0
      org-agenda-block-separator ?─
      org-auto-align-tags nil
      org-catch-invisible-edits 'show-and-error
      org-edit-src-content-indentation 0
      org-ellipsis " ▼ "
      org-hide-emphasis-markers t
      org-hide-leading-stars t
      org-indent-mode t
      org-insert-heading-respect-content t
      org-log-done t
      org-pretty-entities t
      org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-special-ctrl-a/e t
      org-startup-indented t
      org-tags-column 0
      org-agenda-time-grid
      '((daily today require-timed)
        (800 1000 1200 1400 1600 1800 2000)
        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
      org-agenda-current-time-string
      "⭠ now ─────────────────────────────────────────────────")

(use-package! org-modern
  :ensure t
  :config
  (setq org-modern-table-vertical 1
        org-modern-table-horizontal 1
        org-modern-horizontal-rule t)
  :init
  (global-org-modern-mode))

(use-package! ox-reveal)
(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

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

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))
