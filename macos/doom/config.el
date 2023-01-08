(setq user-full-name "Shashiduth Takoor"
      user-mail-address "shashiduth.takoor@gmail.com")

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 13))

(setq doom-theme 'doom-zenburn)
(setq zenburn-use-variable-pitch t)
(setq zenburn-scale-org-headlines t)
(setq zenburn-scale-outline-headlines t)

<<<<<<< HEAD
(all-the-icons-completion-mode)
(add-hook 'marginalia-mode-hook #' all-the-icons-completion-marginalia-setup)

(remove-hook '+doom-dashboard-functions #'doom-gashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-functions :append
           (setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
           (setq fancy-splash-image (concat doom-user-dir "cacochan.png")))

;; EMACSCLIENT
=======
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
>>>>>>> 9af1a6c (Minor edit to Emacs completion with corfu)

(beacon-mode 1)

(setq display-line-numbers-type t)

(setq org-directory "~/Documents/OrgFiles/"
      org-agenda-files '("~/Documents/OrgFiles/agenda.org"))
(setq org-agenda-block-separator 45)

(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)

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
  :init (vertico-mode)
  (setq vertico-cycle t))

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-echo-documentation 0.25)
<<<<<<< HEAD
  (corfu-separator ?\s)
  (corfu-preview-current 'insert)
=======
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-preview-current nil)    ;; Disable current candidate preview
>>>>>>> 9af1a6c (Minor edit to Emacs completion with corfu)
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
<<<<<<< HEAD
         ([backtab] . corfu-previous)
         ("S-<return>" . corfu-insert)
         ("RET" . nil))
=======
         ([backtab] . corfu-previous))
  :init
  (global-corfu-mode))

(use-package orderless
  :when (featurep! +orderless)
>>>>>>> 9af1a6c (Minor edit to Emacs completion with corfu)
  :init
  (global-corfu-mode))

(use-package cape
  :bind (("C-c p p" . completion-at-point)
         ("C-c p t" . complete-tag)
         ("C-c p d" . cape-dabbrev)
         ("C-c p h" . cape-history)
         ("C-c p f" . cape-file)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-symbol)
         ("C-c p a" . cape-abbrev)
         ("C-c p i" . cape-ispell)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)
         ("C-c p \\" . cape-tex)
         ("C-c p _" . cape-tex)
         ("C-c p ^" . cape-tex)
         ("C-c p &" . cape-sgml)
         ("C-c p r" . cape-rfc1345))
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
)

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

<<<<<<< HEAD
(use-package marginalia
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annonators-heavy marginalia-annotators-light nil))
=======
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
>>>>>>> 9af1a6c (Minor edit to Emacs completion with corfu)
  :config
  (marginalia-mode))

(use-package embark
  :ensure t
<<<<<<< HEAD

=======
>>>>>>> 9af1a6c (Minor edit to Emacs completion with corfu)
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
<<<<<<< HEAD

  :init

  (setq prefix-help-command #'embark-prefix-help-command)

  :config

=======
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
>>>>>>> 9af1a6c (Minor edit to Emacs completion with corfu)
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
<<<<<<< HEAD
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package vertico
  :ensure t
  :demand
  :config
  (setq vertico-cycle t)
  (setq vertico-preselect 'directory)
  :init
  (vertico-mode)
  (defun my/vertico-insert ()
    (interactive)
    (let* ((mb (minibuffer-contents-no-properties))
           (lc (if (string= mb "") mb (substring mb -1))))
      (cond ((string-match-p "^[/~:]" lc) (self-insert-command 1 ?/))
            ((file-directory-p (vertico--candidate)) (vertico-insert))
            (t (self-insert-command 1 ?/)))))
  :bind (:map vertico-map
              ("/" . #'my/vertico-insert)))

(use-package vertico-directory
  :after vertico
  :ensure t
  :demand
  :bind (:map vertico-map
              ("RET"   . vertico-directory-enter)
              ("DEL"   . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
  :init
  (setq completion-styles '(orderless partial-completion basic)
        completion-category-defaults nil
        completion-category-overrides nil))

(use-package lsp-mode
  :custom
  (lsp-completion-provider :none)

  :init
  (defun my/orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))

  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless)))

  (add-hook 'orderless-style-dispatchers #'my/orderless-dispatch-flex-first nil 'local)

  (setq-local completion-at-point-functions (list (cape-capf-buster #'lsp-completion-at-point)))

  :hook
  (lsp-completion-mode . my/lsp-mode-setup-completion))

;; LSP for solidity
(require 'solidity-mode)

(use-package savehist
  :config
  (setq history-length 25)
  (savehist-mode 1))

=======
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; LSP for solidity
(require 'solidity-mode)

>>>>>>> 9af1a6c (Minor edit to Emacs completion with corfu)
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
