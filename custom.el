(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval setq-local org-image-actual-width
      '(1024))
     (eval org-toggle-inline-images)
     (eval add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
     (eval org-babel-jupyter-override-src-block "python")))
 '(warning-suppress-types '((initialization) (defvaralias))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
