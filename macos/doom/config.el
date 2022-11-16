;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "shashiduth takoor"
      user-mail-address "shashiduth.takoor@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-zenburn)
(doom-themes-treemacs-config)
(doom-themes-org-config)
(setq zenburn-use-variable-pitch t)
(setq zenburn-scale-org-headline t)
(setq zenburn-scale-outline-headlines t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; All-the-icons
(all-the-icons-completion-mode)
(add-hook 'marginalia-mode-hook #' all-the-icons-completion-marginalia-setup)

;; Custom banner
;;(setq fancy-splash-image "~/.emacs.d/banners/modern-doom3.png")

;; Org Mode
;;(use-package! org-ref
;;  :after org
;;  :config
  ;;(setq org-ref-default-bibliography '("<path/to/your/bibliography>")
  ;;      org-ref-bibliography-notes "<path/to/your/bibliography>"
  ;;      org-ref-pdf-directory "<path/to/your/papers/folder>"
  ;;      org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
  ;;      bibtex-completion-pdf-field "file"
  ;;      bibtex-completion-pdf-symbol ""
  ;;      bibtex-completion-display-formats
  ;;      '((t . "${title:46} ${author:20} ${year:4} ${=type=:4}${=has-pdf=:1}${=has-note=:1}")))
;;  )

(use-package! org-contrib
  :config
  (require 'ox-extra)
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))

(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)

(after! org-superstar
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
        org-superstar-prettify-item-bullets t ))

(setq org-ellipsis " ▾ "
      org-hide-leading-stars t
      org-priority-highest ?A
      org-priority-lowest ?E
      org-priority-faces
      '((?A . 'all-the-icons-red)
        (?B . 'all-the-icons-orange)
        (?C . 'all-the-icons-yellow)
        (?D . 'all-the-icons-green)
        (?E . 'all-the-icons-blue)))

;; LaTex classes
(require 'ox-latex)
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
             '("org-article"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}"))))

;; Use minted syntax highlighting in src code blocks
(setq org-latex-listings 'minted
      'org-latex-packages-alist '(("" "minted"))

;; Minted options
(setq org-latex-minted-options '(
                                 ("frame" "lines")
                                 ("fontsize" "\\scriptsize")
                                 ("xleftmargin" "\\parindent")
                                 ("linenos" "")
                                 ("breaklines" "true")
                                 ("breakanywhere" "true")
                                 ))

(setq org-latex-pdf-process '(
                             "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                             "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                             "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                             ))

;; Line spacing
(setq org-cycle-separator-lines -2)

;; Pagebreak for table of contents
(setq org-latex-toc-command "\\tableofcontents \\clearpage")

;; Corfu completion module
;; Reset lsp-completion provider
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

(use-package corfu
  :custom
  (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-auto nil)
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
         ([backtab] . corfu-previous)))

(use-package corfu-doc
  :hook
  (corfu-mode . corfu-doc-mode)
  :bind (:map corfu-map
         ("M-n" . corfu-doc-scroll-down)
         ("M-p" . corfu-doc-scroll-up)
         ("M-d" . corfu-doc-toggle)))

(use-package orderless
  :when (featurep! +orderless)
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package kind-icon
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

(beacon-mode 1)
