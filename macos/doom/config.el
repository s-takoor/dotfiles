(setq user-full-name "Shashiduth Takoor"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 13))

(setq doom-theme 'doom-zenburn)
(setq zenburn-use-variable-pitch t)
(setq zenburn-scale-org-headlines t)
(setq zenburn-scale-outline-headlines t)

;;(all-the-icons-completion-mode)
;;(add-hook 'marginalia-mode-hook #' all-the-icons-completion-marginalia-setup)

(remove-hook '+doom-dashboard-functions #'doom-gashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-functions :append
           (setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
           (setq fancy-splash-image (concat doom-user-dir "cacochan.png")))

;; EMACSCLIENT

(beacon-mode 1)

(setq display-line-numbers-type t)

(setq org-directory "~/Documents/org/")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

;; Emacs GUI frame
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Emacs daemon
(when (daemonp)
  (exec-path-from-shell-initialize))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package lsp-ui
  :ensure t
  :after lsp
  :init
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-show-diagnostics t))

(add-hook 'doom-init-modules-hook
          (lambda ()
            (after! lsp-mode
              (setq lsp-completion-provider :none))))

;; Pad before lsp modeline error info
(add-hook 'lsp-mode-hook
          (lambda ()
            (setf (caadr
                   (assq 'global-mode-string mode-line-misc-info))
                  " ")))

;; Set orderless filtering for LSP-mode completions
(add-hook 'lsp-completion-mode-hook
          (lambda ()
            (setf (alist-get 'lsp-capf completion-category-defaults) '((styles . (orderless))))))

;; Set bindings
(map! :i "C-@" #'completion-at-point
      :i "C-SPC" #'completion-at-point
      (:prefix "C-x"
       :i "C-k" #'cape-dict
       :i "C-f" #'cape-file
       :i "s" #'cape-ispell
       :i "C-n" #'cape-keyword
       :i "C-s" #'dabbrev-completion))

;; Fallback cleanly to consult in TUI
(setq-default completion-in-region-function #'consult-completion-in-region)

(use-package vertico
  :init (vertico-mode)
  (setq vertico-cycle t))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-echo-documentation 0.25)
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-on-exact-match nil)
  (corfu-quit-no-match 'separator)
  (corfu-preselect-first nil)
  :hook
  (doom-first-buffer . global-corfu-mode)
  :bind (:map corfu-map
         ("SPC" . corfu-insert-separator)
         ("TAB" . corfu-next)
         ([tab] . corfu-next)
         ("S-TAB" . corfu-previous)
         ([backtab] . corfu-previous))
  :init
  (global-corfu-mode))

(use-package orderless
  :when (featurep! +orderless)
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :defer t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file-capf)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev-capf)
  (add-to-list 'completion-at-point-functions #'cape-keyword-capf))

(setq completion-cycle-threshold 1)

;; Enable indentation+completion using the TAB key.
;; Completion is often bound to M-TAB.
(setq tab-always-indent 'complete)

;; Dirty hack to get c completion running
;; Discussion in https://github.com/minad/corfu/issues/34
(when (equal tab-always-indent 'complete)
  (map! :map c-mode-base-map
        :i [remap c-indent-line-or-region] #'completion-at-point))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

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
