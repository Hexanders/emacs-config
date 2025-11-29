 ;; (use-package web-mode
 ;;    :config
 ;;    ;;I'm not sure what this does
 ;;    (setq web-mode-extra-constants '(("php" . ("CONS1" "CONS2"))))
 ;;    ;; <?php expands to <?php ?>
 ;;    (setq web-mode-enable-auto-pairing t)
 ;;    ;; Example - you may want to add hooks for your own modes.
 ;;    ;; when I open a css file use css-mode that way I can set up flychech with it!
 ;;    (setq web-mode-extra-auto-pairs
 ;;          '(("erb"  . (("beg" "end")))
 ;;            ("php"  . (("beg" "end")
 ;;                       ("beg" "end")))
 ;;            ))
 ;;    (setq web-mode-engines-alist
 ;;          '(("php"  . "\\.php\\.")
 ;;            ("django"  . "\\.djhtml\\.")))

 ;;    :mode
 ;;    (("\\.html?\\'" . web-mode)
 ;;      ("\\.php?\\'"  . web-mode)
 ;;      ("\\.phtml?\\'" . web-mode))
 ;;    )
(require 'web-mode)
