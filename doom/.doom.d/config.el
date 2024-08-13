(setq user-full-name "s.t"
      user-mail-address "shashiduth.takoor@gmail.com")

(beacon-mode t)

(setq centaur-tabs-default-font "JetBrainsMono NF" ;;Iosevka NF
      centaur-tabs-set-bar 'right
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-close-button "⨂"
      centaur-tabs-modified-marker "⨀")

;; (require 'ellama)
;; (add-hook 'ellama-mode-hook (lambda () (setopt ellama-language "English")))
;; (require 'llm-ollama)
;; (setq ellama-provider (make-llm-ollama :chat-model "gemma:2b" :embedding-model "gemma:2b"))

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-big-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-serif-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-symbol-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light))

(set-frame-parameter (selected-frame) 'alpha '(70 . 90))
(add-to-list 'default-frame-alist '(alpha . (70 . 90)))

(setq imenu-list-auto-resize t
      imenu-list-focus-after-activation t)

(require 'jinx)

;; Enable Jinx globally
(add-hook 'emacs-startup-hook #'global-jinx-mode)

(setq display-line-numbers-type 'relative)

(setq-default line-spacing 0)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(add-to-list 'default-frame-alist '(undecorated-round . t))

(require 'doom-modeline)

(setq doom-modeline-enable-word-count t
      doom-modeline-battery t
      doom-modeline-icon t
      doom-modeline-time t
      doom-modeline-time-icon t
      doom-modeline-lsp t)

;; (require 'spacious-padding)


(setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 1
         :scroll-bar-width 8
         :left-fringe-width 20
         :right-fringe-width 20))

(setq spacious-padding-subtle-mode-line
      `( :mode-line-active 'default
         :mode-line-inactive vertical-border))

;; Enable spacious-padding mode
(spacious-padding-mode 1)

(require 'modus-themes)

(custom-set-variables
 '(modus-themes-variable-pitch-ui t)
 '(modus-themes-bold-constructs t)
 '(modus-themes-italic-constructs t)
 '(modus-themes-mixed-fonts t)
 '(modus-themes-prompts '(italic bold))
 '(modus-themes-completions '((matches . (extrabold underline))
                              (selection . (semibold italic text-also underline))))
 '(modus-themes-org-blocks 'gray-background)
 '(modus-themes-headings
   '((1 . (variable-pitch 1.5))
     (2 . (1.3))
     (agenda-date . (1.3))
     (agenda-structure . (variable-pitch light 2.2))
     (t . (1.15))))) ;; Default size for other headings
(load-theme 'modus-vivendi-tritanopia t)

(require 'org-auto-tangle)
(add-hook 'org-mode-hook #'org-auto-tangle-mode)
(setq org-auto-tangle-default t)

(require 'org-alert)
(setq org-alert-interval 1200
      org-alert-notify-cutoff 10
      org-alert-notify-after-event-cutoff 10
      org-alert-notification-title "Org Alert Reminder!")

(require 'alert)
(setq alert-default-style 'osx-notifier)

;; Set the default Python interpreter to Python3
(setq org-babel-python-command "python3")

;; Set ditaa path
(setq org-ditaa-jar-path "/opt/homebrew/Cellar/ditaa/0.11.0_1/libexec/ditaa-0.11.0-standalone.jar")

(setq org-directory "~/Documents/orgfiles/"
      org-auto-align-tags nil
      org-tags-column 0
      org-fold-catch-invisible-edits 'show-and-error
      org-special-ctrl-a/e t
      org-insert-heading-respect-content t
      org-export-headline-levels 5
      org-log-done 'time
      org-log-into-drawer t
      org-edit-src-content-indentation 0

      ;; Org styling, hide markup, etc.
      org-hide-emphasis-markers t
      org-pretty-entities t
      org-ellipsis " ▼"
      org-hide-leading-stars t
      org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-startup-indented nil

      ;; Agenda styling
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

(require 'org-modern)

;; Customize org-modern settings
(setq org-modern-star '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
      org-modern-table-vertical 1
      org-modern-table-horizontal 0.2
      org-modern-horizontal-rule t)

;; Enable global-org-modern-mode
(global-org-modern-mode)

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

(require 'engrave-faces-latex)
(setq org-latex-src-block-backend'engraved)

(require 'pdf-tools)

(add-hook 'doc-view-mode-hook 'pdf-tools-install)

(setq-default pdf-view-use-scaling t
              pdf-view-use-imagemagick nil)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'elfeed-goodies)

;; News filtering
(after! elfeed
  (setq elfeed-search-filter "@2-weeks-ago"))

;; Automatically updating feed when opening elfeed
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

(global-set-key (kbd "C-x w") 'elfeed)
