;;;;;;; Settings for MUTT email clinet
(server-start)				
; open mail-mode when emacs is invoked by mutt                                
(add-to-list 'auto-mode-alist '("/tmp/mutt" . mail-mode))
; corrector
(add-hook 'mail-mode-hook (function flyspell-mode)) 

 

