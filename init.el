;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; Tell emacs where is your personal elisp lib dir
;; (server-start)				;starting emacs server in oreder to connect to it if it is allready opend
(require 'package) 

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq byte-compile-warnings '(cl-functions)) ;evoid "Package cl is deprecated" worning

(load-theme 'modus-vivendi t)		;;dark theme
;; (load-theme 'badwolf t)		;;dark theme
(set-face-attribute 'default nil :height 135) ;;set font size to heigth/10 pt

;; Web mode configuration - currently disabled
;; (require 'init-web-mode)

(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


(show-paren-mode t)
(setq show-paren-style 'expression)

(require 'use-package)
    (use-package vertico			;fuzzy finder
      :ensure t
      :bind (:map vertico-map
		 ("C-j" . vertico-next)
		 ("C-k" . vertico-previous)
		 ("C-f" . vertico-exit)
		 :map minibuffer-local-map
		 ("M-h" . backward-kill-word))
      :custom
      (vertico-cycle t)
      :init
      (vertico-mode))

   (use-package savehist		;just saves history of visited fiels
     :init
     (savehist-mode))

   (use-package marginalia		;file metadata how crated and wenn and so one 
     :after vertico
     :ensure t 
     :custom
     (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
     :init
     (marginalia-mode))
      






;; Centaur-tabs - shows all buffers as tabs (like old tabbar)
(use-package centaur-tabs
  :ensure t
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "bar"
        centaur-tabs-height 32
        centaur-tabs-set-icons nil
        centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "●"
        centaur-tabs-show-navigation-buttons nil
        centaur-tabs-set-bar 'under
        x-underline-at-descent-line t)
  ;; Keybindings similar to old tabbar
  (global-set-key (kbd "M-<left>") 'centaur-tabs-backward)
  (global-set-key (kbd "M-<right>") 'centaur-tabs-forward))

;; Old tabbar configuration disabled - using centaur-tabs instead
;; (when (require 'tabbar nil 'noerror)
;;   (load "tabbar-tweak"))
;; (package-initialize)			;some older version og emacs requer this for (require 'use-package)
(load "latex_config")	  
(load "python_config")

;; YASnippet configuration - currently disabled
;; Uncomment below if you want to enable yasnippet
;; (use-package yasnippet
;;   :ensure t
;;   :config
;;   (yas-global-mode 1))

(define-key global-map (kbd "C-+") 'text-scale-increase) ;; increase/decrease font size
(define-key global-map (kbd "C--") 'text-scale-decrease)


(setq-default ispell-program-name "aspell") ;; aspell is better as ispell but call it still ispell :) ;; commend out this line if not installed or install aspell



(defun comment-line-or-region ()
  "Comment or uncomment the current line or region."
  (interactive)
  (if (use-region-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (save-excursion
      (comment-or-uncomment-region
       (line-beginning-position)
       (line-end-position)))))

(global-set-key (kbd "C-c ,") 'comment-line-or-region)

(setq speck-engine (quote Hunspell)) ;; spellchecker
(setq speck-hunspell-language-options
      (quote (("de" utf-8 nil t nil)
	      ("en" utf-8 nil nil nil)
	      ("ru" koi8-r nil nil nil))))


(setq inhibit-startup-message t 	;;turn off message 
      visible-bell t			;;visual  
      )

(tool-bar-mode -1)			;;remove controll bar
(scroll-bar-mode -1)			;;remove scroll bar
(global-display-line-numbers-mode 1)	;;add line numbers to the screen
(setq display-line-numbers 'relative)  	;;relative line numbers
(global-hl-line-mode 1)			;;highlight whole line in all buffers
(blink-cursor-mode 1)







;; Package initialization already done above - duplicate removed

;; save the autosave files in a different directory altogether by setting the variable auto-save-file-name-transforms
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))
;;save backup files in a different directory set the variable backup-directory-alist, the following will save backup files inside backups folder in the user-emacs-directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))




(defun sudo-edit (&optional arg) ;; http://emacsredux.com/blog/2013/04/21/edit-files-as-root/
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))



;; Old auto-complete-latex configuration - replaced by company-auctex
;; Keeping this commented in case you need to reference it
;; (require 'auto-complete-latex)
;; (setq ac-modes (append ac-modes '(foo-mode)))
;; (add-hook 'foo-mode-hook 'ac-l-setup)

;; use easy citation
(use-package citar
  :bind (("C-c b" . citar-insert-citation)
         :map minibuffer-local-map
         ("M-b" . citar-insert-preset))
  :custom
  (citar-bibliography '("~/Documents/DigiLab-Backup/BACKUP/PHD_theses/bibliography.bib")))

;; LSP Mode - Language Server Protocol support
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((python-mode . lsp)
         (java-mode . lsp))
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-signature-auto-activate nil
        lsp-enable-snippet t))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point))

;; Magit - Git interface
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; Swiper - Better search
(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;; Which-key - Display available keybindings
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Consult - Enhanced commands for vertico
(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-s g" . consult-grep)
         ("M-s r" . consult-ripgrep)))

;; Orderless - Better completion matching
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Markdown mode with pandoc support
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc -f markdown -t html"))

;; Markdown preview mode for live browser preview
;; Install with: M-x package-install RET markdown-preview-mode RET
(use-package markdown-preview-mode
  :ensure t
  :defer t)

;; Company mode - modern completion framework (replaces auto-complete)
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :bind (:map company-active-map
         ("TAB" . company-complete-selection)
         ("<tab>" . company-complete-selection))
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2
        company-tooltip-align-annotations t))

;; Company math support for LaTeX
(use-package company-math
  :ensure t
  :after company
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-to-list 'company-backends 'company-latex-commands))

;; Company AUCTeX for better LaTeX completion
(use-package company-auctex
  :ensure t
  :after (company auctex)
  :config
  (company-auctex-init))

;; Jump to next punctuation  in Text like .,;: and so on
(defvar punctuation-regex nil "A regex string for the purpose of moving cursor to a punctuation.")
;; (setq punctuation-regex "[\\!\?\"\.'#$%&*+,/:;<=>@^`|~]+")
;; (setq punctuation-regex "[\\!\?\\.,/:;]")
(setq punctuation-regex "[\\!\?\\.]") 


(defun forward-punct (&optional n)
;;   "Move cursor to the next occurrence of punctuation.
;; The list of punctuations to jump to is defined by `xah-punctuation-regex'

;; URL `http://xahlee.info/emacs/emacs/emacs_jump_to_punctuations.html'
;; Version 2017-06-26"
  (interactive "p")
  (re-search-forward punctuation-regex nil t n))

(global-set-key "\M--" 'forward-punct)

(defun backward-punct (&optional n)
;;   "Move cursor to the previous occurrence of punctuation.
;; See `forward-punct'

;; URL `http://xahlee.info/emacs/emacs/emacs_jump_to_punctuations.html'
;; Version 2017-06-26"
  (interactive "p")
  (re-search-backward punctuation-regex nil t n))
(global-set-key "\M-." 'backward-punct)

;; Separate custom-set-variables to custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Reset garbage collection threshold after startup (set high in early-init.el)
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold (* 2 1000 1000))
    (message "Emacs started in %s" (emacs-init-time))))

;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
;; Load OPAM setup only if file exists (for OCaml development)
(when (file-exists-p (expand-file-name "opam-user-setup.el" user-emacs-directory))
  (require 'opam-user-setup "~/.emacs.d/opam-user-setup.el"))
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
