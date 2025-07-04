(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Configuración ultra-simple de Copilot Chat
(use-package copilot-chat
  :ensure t
  :defer t
  :after copilot
  :config
  ;; Configuración mínima para evitar errores
  (when (boundp 'copilot-chat-debug)
    (setq copilot-chat-debug nil))
  
  ;; Función muy básica que evita el error de marcador
  (defun my-safe-copilot-chat ()
    "Función ultra-segura para copilot-chat"
    (interactive)
    (if (and (buffer-file-name)
             (> (buffer-size) 0))
        (let ((prompt (read-string "Pregunta para Copilot: ")))
          (condition-case err
              (with-current-buffer (current-buffer)
                (goto-char (point-max))
                (copilot-chat-ask))
            (error 
             (message "Copilot Chat no disponible: %s" (error-message-string err)))))
      (message "Copilot Chat requiere un archivo guardado con contenido")))
  
  ;; Bind al keybinding
  (global-set-key (kbd "C-c q") 'my-safe-copilot-chat))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

;; Ivy, Counsel, Swiper
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)))

;; Configuración de TypeScript
(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2))

;; Configuración de Tide (TypeScript IDE)
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

;; Configuración de Company
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)  ; Ligeramente más lento para mejor rendimiento
  (setq company-minimum-prefix-length 1)
  (global-company-mode t))

;; Configuración de Flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

;; Configuración del portapapeles
(setq select-enable-clipboard t)
(setq select-enable-primary t)
(setq save-interprogram-paste-before-kill t)

;; xclip para terminal
(when (and (not (display-graphic-p))
           (executable-find "xclip"))
  (use-package xclip
    :ensure t
    :config
    (xclip-mode 1)))

;; Números de línea
(global-display-line-numbers-mode 1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Doom themes
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; GraphQL mode
(use-package graphql-mode
  :ensure t
  :mode (("\\.graphql\\'" . graphql-mode)
         ("\\.gql\\'" . graphql-mode)))
