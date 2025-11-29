(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(setq reftex-plug-into-AUCTeX t)	      ;with out this reftex and auctex would work together
;; Automatically recognize all \newcommand definitions
;; Setup entry in reftex-label-alist for equations and newcommands

;; Use AUCTeX for completion
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq TeX-PDF-mode t)                         ; PDF button per default instead of DVI
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)  ;turn on math mode
(add-hook 'LaTeX-mode-hook (lambda () (flyspell-mode 1)))
;; (add-hook 'LaTex-mode-hook 'turn-on-flyspell) 

;; (add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

(setq-default TeX-master nil) ; Query for master file in AUCTeX
	

