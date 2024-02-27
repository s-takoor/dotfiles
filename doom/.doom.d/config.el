(setq user-full-name "s.t"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-big-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-serif-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-symbol-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono NF" :size 12 :weight 'light))

;; Load all stable features in Emms
(require 'emms-setup)
(emms-all)

;; MetaData reader about track information
(require 'emms-info-libtag)
(add-to-list 'emms-info-functions 'emms-info-libtag)

;; Emms list of players
(setq emms-player-list '(emms-player-mpd)) ;; or mpv
(add-to-list 'emms-info-functions 'emms-info-mpd)

;; MPD configuration
(setq emms-player-mpd-server-name "localhost")
(setq emms-player-mpd-server-port "6600")

;; Music directory
(setq emms-source-file-default-directory "~/Music")

;; APE / FLAC commands
(require 'emms-cue)
(add-to-list 'emms-info-functions 'emms-info-cueinfo)

;; Keybindings
(global-set-key (kbd "C-c C-o") #'emms-smart-browse)
(global-set-key (kbd "C-c C-r") #'emms-player-mpd-update-all-reset-cache)

;; Automatically update MPD database on startup
(add-hook 'after-init-hook #'emms-player-mpd-update-all-reset-cache)

;; Use-Package
;; (use-package ellama
;;   :init
;;   (setopt ellama-language "French")
;;   (require 'llm-ollama)
;;   (setopt ellama-provider
;;           (make-llm-ollama
;;            :chat-model "mistral:latest"
;;            :embedding-model "mistral:latest")))

;; Require Package
;; (require 'ellama)
;; (add-hook 'ellama-mode-hook (lambda () (setopt ellama-language "French")))
;; (require 'llm-ollama)
;; (setq ellama-provider (make-llm-ollama :chat-model "mistral:latest" :embedding-model "mistral:latest"))

;; Icons
(require 'nerd-icons)

;; Icons Completion
(require 'nerd-icons-completion)
(nerd-icons-completion-mode)
(add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup)

;; Icons Dired
(require 'nerd-icons-dired)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)

;; Icons Treemacs
(require 'treemacs-nerd-icons)
(treemacs-load-theme "nerd-icons")

(setq-default line-spacing 0.2)

(require 'modus-themes)
(custom-set-variables
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
     (agenda-structure . (variable-pitch light 1.8))
     (t . (1.1))))) ;; Default size for other headings
(load-theme 'modus-vivendi t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(add-to-list 'default-frame-alist '(undecorated-round . t))

(set-frame-parameter (selected-frame) 'alpha '(70 . 50))
(add-to-list 'default-frame-alist '(alpha . (70 . 50)))

(require 'beacon)
(beacon-mode 1)

(setq display-line-numbers-type 'relative)

(after! doom-modeline
(setq doom-modeline-enable-word-count t
      doom-modeline-window-width-limit nil
      doom-modeline-battery t
      doom-modeline-icon t
      doom-modeline-major-mode-icon t
      doom-modeline-major-mode-color-icon t
      doom-modeline-time t
      doom-modeline-time-icon t
      doom-modeline-lsp t
      doom-modeline-bar-width 4))

(setq centaur-tabs-default-font "JetBrainsMono NF" ;;Iosevka NF
      centaur-tabs-set-bar 'right
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-close-button "⨂"
      centaur-tabs-modified-marker "⨀")

(require 'org-auto-tangle)
(add-hook 'org-mode-hook #'org-auto-tangle-mode)
(setq org-auto-tangle-default t)

(require 'org-alert)
(setq org-alert-interval 1200)
(setq org-alert-notification-title "Org Alert Reminder!")
(custom-set-variables '(alert-default-style 'osx-notifier))
(org-alert-enable)

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
      org-log-done t
      org-edit-src-content-indentation 0

      ;; Org styling, hide markup, etc.
      org-hide-emphasis-markers t
      org-pretty-entities t
      ;; org-ellipsis " ▼ "
      org-ellipsis " ..."
      org-hide-leading-stars t
      org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-startup-indented nil

      ;; Agenda styling
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
(setq org-modern-table-vertical 1
      org-modern-table-horizontal 1
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

;; Automatically update buffer
(require 'pdf-tools)

(add-hook 'doc-view-mode-hook 'pdf-tools-install)

(setq-default pdf-view-use-scaling t
              pdf-view-use-imagemagick nil)

;; (setq auto-revert-interval 0.5)

(require 'jinx)

;; Enable Jinx globally
(add-hook 'emacs-startup-hook #'global-jinx-mode)

(require 'vertico)

(setq vertico-count 20
      vertico-resize t
      vertico-cycle t)

(vertico-mode)

(require 'vertico-directory)
(add-hook 'rfn-eshadow-update-overlay 'vertico-directory-tidy)

(vertico-multiform-mode)
(add-to-list 'vertico-multiform-categories
             '(jinx grid (vertico-grid-annotate . 20)))
(vertico-multiform-mode 1)

(require 'marginalia)
(marginalia-mode)

(require 'savehist)
(savehist-mode)

(require 'orderless)
(setq completion-styles '(orderless basic flex initials substring)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))

(require 'consult)

(add-hook 'completion-list-mode-hook #'consult-preview-at-point-mode)

(setq register-preview-delay 0.5
        register-preview-function #'consult-register-format
        xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref
        completion-in-region-function #'consult-completion-in-region)

(bind-key "C-x C-r" #'consult-recent-file)
(bind-key "C-x h" #'consult-outline)
(bind-key "C-x b" #'consult-buffer)
(bind-key "C-c h" #'consult-history)

(require 'embark)
(setq prefix-help-command #'embark-prefix-help-command)
(add-to-list 'display-buffer-alist '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*" nil (window-parameters (mode-line-format . none))))

;; Embark-Consult
(require 'embark-consult)
(add-hook 'embark-collect-mode-hook #'consult-preview-at-point-mode)

(require 'corfu)
(require 'nerd-icons-corfu)

;; Corfu configuration
(custom-set-variables
 '(corfu-cycle t)
 '(corfu-auto t)
 '(corfu-auto-delay 0.8)
 '(corfu-auto-prefix 2)
 '(corfu-separator ?\s)
 '(corfu-popupinfo-delay '(0.5 . 0.2))
 '(corfu-preview-current 'insert)
 '(corfu-preselect 'prompt)
 '(corfu-on-exact-match nil))

(bind-keys
 :map corfu-map
 ("M-SPC" . corfu-insert-separator)
 ("TAB" . corfu-next)
 ([tab] . corfu-next)
 ("S-TAB" . corfu-previous)
 ([backtab] . corfu-previous)
 ("S-<return>" . corfu-insert)
 ("RET" . nil))

(global-corfu-mode)
(corfu-history-mode)
(corfu-popupinfo-mode)

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq-local corfu-quit-at-boundary t
                        corfu-quit-no-match t
                        corfu-auto nil)
            (corfu-mode)))

;; Nerd Icons Corfu configuration
(custom-set-variables
 '(nerd-icons-default-face 'corfu-default))

(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

(require 'dabbrev)
(add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
(add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)

(require 'cape)

(bind-keys
 ("C-c p p" . completion-at-point)
 ("C-c p t" . complete-tag)
 ("C-c p d" . cape-dabbrev)
 ("C-c p h" . cape-history)
 ("C-c p f" . cape-file)
 ("C-c p e" . cape-elisp-block)
 ("C-c p s" . cape-elisp-symbol)
 ("C-c p \\" . cape-tex)
 ("C-c p _" . cape-tex)
 ("C-c p ^" . cape-tex))

(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-elisp-block)
(add-to-list 'completion-at-point-functions #'cape-history)
(add-to-list 'completion-at-point-functions #'cape-tex)
(add-to-list 'completion-at-point-functions #'cape-elisp-symbol)

(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)

(require 'terraform-mode)
(add-to-list 'auto-mode-alist '("\\.tf\\'" . terraform-mode))
(add-to-list 'auto-mode-alist '("\\.tfvars\\'" . terraform-mode))
(add-to-list 'auto-mode-alist '("\\.hcl\\'" . terraform-mode))

;; Customize indentation level
(setq terraform-indent-level 4)

(require 'elfeed-goodies)
;; (elfeed-goodies/setup)

;; News filtering
(after! elfeed
  (setq elfeed-search-filter "@2-weeks-ago"))

;; Automatically updating feed when opening elfeed
(add-hook! 'elfeed-search-mode-hook #'elfeed-update)

(global-set-key (kbd "C-x w") 'elfeed)
