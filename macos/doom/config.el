(setq user-full-name "shashiduth takoor"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light)
      doom-big-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light)
      doom-serif-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light)
      doom-unicode-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'light))

(setq doom-theme 'doom-tomorrow-night)

(setq fancy-splash-image (concat doom-user-dir "doom-emacs-gray.svg"))

(setq centaur-tabs-set-bar 'right ;;over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-close-button "⨂"
      centaur-tabs-modified-marker "⨀")

(use-package all-the-icons-completion
  :after
  (marginalia all-the-icons)
  :hook
  (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(after! doom-modeline
(let ((battery-str (battery)))
  (unless (or (equal "Battery status not available" battery-str)
              (string-match-p (regexp-quote "unknown") battery-str)
              (string-match-p (regexp-quote "N/A") battery-str))
    (display-battery-mode 1))))

(after! doom-modeline
  (setq doom-modeline-bar-width 4
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-file-name-style 'truncate-upto-project))

(beacon-mode 1)

(setq display-line-numbers-type t)

(add-hook 'prog-mode-hook 'rainbow-mode)

(use-package org-alert
  :ensure t
  :custom (alert-default-style 'osx-notifier)
  :config
  (setq org-alert-interval 3600
        org-alert-notification-title "Org Alert Reminder!")
  (org-alert-enable))

(fset 'yes-or-no-p 'y-or-n-p) ;; don't ask to spell out "yes"
(show-paren-mode 1) ;; highlight parenthesis

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

(after! writeroom-mode
  (setq writeroom-mode-line t))

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

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(use-package! org-modern
  :ensure t
  :config
  (setq org-modern-table-vertical 1
        org-modern-table-horizontal 1
        org-modern-horizontal-rule t)
  :init
  (global-org-modern-mode))

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
  :bind (("C-c b" . consult-buffer)
         ("C-c l" . consult-goto-line)
         ("C-c a" . consult-org-agenda))
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
