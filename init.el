(setq native-comp-async-report-warnings-errors 'silent)

(require 'package)
(setq package-archives
      '(("melpa"        . "http://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("gnu"          . "http://elpa.gnu.org/packages/")))
(package-initialize)

(use-package vertico
  
  :ensure t
  :init
  (vertico-mode 1))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:background "deep sky blue")))))

(set-face-attribute 'default nil :height 140)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)




(use-package treemacs
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company which-key lsp-mode treemacs winum vertico-posframe rainbow-mode orderless marginalia)))

(use-package winum
  :ensure t
  :init
  (winum-mode 1)
  :config
  (setq winum-keymap
        (let ((map (make-sparse-keymap)))
          (global-set-key (kbd "M-0") 'treemacs-select-window)
          (global-set-key (kbd "M-1") 'winum-select-window-1)
          (global-set-key (kbd "M-2") 'winum-select-window-2)
          (global-set-key (kbd "M-3") 'winum-select-window-3)
          (define-key map (kbd "M-4") 'winum-select-window-4)
          (define-key map (kbd "M-5") 'winum-select-window-5)
          (define-key map (kbd "M-6") 'winum-select-window-6)
          (define-key map (kbd "M-7") 'winum-select-window-7)
          (define-key map (kbd "M-8") 'winum-select-window-8)
          map))
  )

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


(use-package lsp-mode
  :ensure t
  :bind (
	    :map lsp-mode-map
	    ("C-c d" . lsp-describe-thing-at-point)
	    ("C-c a" . lsp-execute-code-action)
	    ("C-c l" . lsp-command-map)

	    )
  :config
  (lsp-enable-which-key-integration t))


(use-package company
  :ensure t
  :config
  (global-company-mode 1)
  (company-tng-configure-default)
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

;;suporte com c++ e LSP
(use-package cc-mode
  :ensure nil ; Já vem embutido no Emacs
  :hook ((c++-mode . lsp)
  (c-mode . lsp)))

;; suporte com python mode e LSP
(use-package python
  :ensure nil ; Já vem embutido no Emacs
  :hook (python-mode . lsp))


  


