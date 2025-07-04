(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)

(setq package-enable-conservative-install nil)

(unless package-archive-contents
  (package-refresh-contents))

;; Instala use-package si no está instalado
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ;; Asegura que use-package instale paquetes automáticamente

;; Configuración de temas
(use-package nord-theme
  :config
  (load-theme 'nord t))

;; Configuración de Treemacs
(use-package treemacs
  :bind ("C-c E" . treemacs-toggle)
  :config
  ;; Configura treemacs aquí si es necesario
  )

;; Configuración de js2-mode para archivos JavaScript
(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode))

(setq-default display-line-numbers t)

;; Configuración para PHP
(use-package php-mode
  :hook (php-mode . my-php-mode-setup))

(defun my-php-mode-setup ()
  "Configuraciones personalizadas para php-mode."
  (setq tab-width 4) ;; Establece el ancho de la pestaña a 4 espacios
  (setq indent-tabs-mode nil) ;; Usa espacios en lugar de tabs
  (setq c-basic-offset 4)) ;; Establece el desplazamiento básico a 4 espacios

;; Configuración de Company
(use-package company
  :config
  (global-company-mode) ;; Habilita company-mode globalmente
  (setq company-idle-delay 0.2) ;; Tiempo de espera antes de mostrar sugerencias
  (setq company-minimum-prefix-length 1)) ;; Muestra sugerencias después de escribir un carácter

;; Configuración de Web Mode
(use-package web-mode
  :mode ("\\.php\\'" . web-mode)
  :config
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t))

;; Habilitar el modo para HTML
;;(use-package html-mode)

;; Comando para embellecer el buffer actual
(defun beautify-html-buffer ()
  "Embellece el código HTML en el buffer actual."
  (interactive)
  (when (eq major-mode 'web-mode)
    (web-mode-buffer-indent)))

;; Asigna el comando a una combinación de teclas, por ejemplo, C-c b
(global-set-key (kbd "C-c b") 'beautify-html-buffer)
(put 'upcase-region 'disabled nil)

;;Configuracion de colores para consultas sql 

    
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(sql-comment ((t (:foreground "orange"))))
 '(sql-keyword ((t (:foreground "blue" :weight bold))))
 '(sql-string ((t (:foreground "green")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(copilot-chat-model "claude-3.5-sonnet")
 '(custom-safe-themes
   '("98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "53a4efdca4c9fb870c3f92e4cfca0fbb638bb29b168a26a363298f9b1d9b9bcf" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14" "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" "c8b3d9364302b16318e0f231981e94cbe4806cb5cde5732c3e5c3e05e1472434" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "6f96a9ece5fdd0d3e04daea6aa63e13be26b48717820aa7b5889c602764cf23a" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d" "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e" "6a5584ee8de384f2d8b1a1c30ed5b8af1d00adcbdcd70ba1967898c265878acf" "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1" "c8c4baac2988652a760554e0e7ce11a0fe0f8468736be2b79355c9d9cc14b751" "7758a8b8912ef92e8950a4df461a4d510484b11df0d7195a8a3d003965127abc" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "350fef8767e45b0f81dd54c986ee6854857f27067bac88d2b1c2a6fa7fecb522" "3c08da65265d80a7c8fc99fe51df3697d0fa6786a58a477a1b22887b4f116f62" "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "d6b934330450d9de1112cbb7617eaf929244d192c4ffb1b9e6b63ad574784aad" "e14884c30d875c64f6a9cdd68fe87ef94385550cab4890182197b95d53a7cf40" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "30d174000ea9cbddecd6cc695943afb7dba66b302a14f9db5dd65074e70cc744" "a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1" "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7" "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176" "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b" "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af" "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710" "38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "571661a9d205cb32dfed5566019ad54f5bb3415d2d88f7ea1d00c7c794e70a36" "7c28419e963b04bf7ad14f3d8f6655c078de75e4944843ef9522dbecfcd8717d" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" "9013233028d9798f901e5e8efb31841c24c12444d3b6e92580080505d56fd392" "b754d3a03c34cfba9ad7991380d26984ebd0761925773530e24d8dd8b6894738" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "2b501400e19b1dd09d8b3708cefcb5227fda580754051a24e8abf3aff0601f87" "9d5124bef86c2348d7d4774ca384ae7b6027ff7f6eb3c401378e298ce605f83a" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "e8ceeba381ba723b59a9abc4961f41583112fc7dc0e886d9fc36fa1dc37b4079" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "4b6cc3b60871e2f4f9a026a5c86df27905fb1b0e96277ff18a76a39ca53b82e1" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc" "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c" "6e33d3dd48bc8ed38fd501e84067d3c74dfabbfc6d345a92e24f39473096da3f" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "1f292969fc19ba45fbc6542ed54e58ab5ad3dbe41b70d8cb2d1f85c22d07e518" "6e18353d35efc18952c57d3c7ef966cad563dc65a2bba0660b951d990e23fc07" "113a135eb7a2ace6d9801469324f9f7624f8c696b72e3709feb7368b06ddaccc" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "81f53ee9ddd3f8559f94c127c9327d578e264c574cda7c6d9daddaec226f87bb" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" "ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3" "7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" "7e5b48439116a276b8e9eef4024662522204a6519068f700e179bed3d0defec4" "4c7228157ba3a48c288ad8ef83c490b94cb29ef01236205e360c2c4db200bb18" "9fb561389e5ac5b9ead13a24fb4c2a3544910f67f12cfcfe77b75f36248017d0" default))
 '(package-selected-packages
   '(dumb-jump copilot-chat cobol-mode graphql-mode swiper-helm counsel ivy projectile spacemacs-theme codeium doom-themes gruvbox-theme dracula-theme zenburn-theme magit eslintd-fix ellama sql-indent web-mode treemacs phpt-mode php-refactor-mode nord-theme js2-mode flycheck company)))
;; habilitar sql-indent a sql mode 
 (add-hook 'sql-mode-hook 'sqlind-minor-mode)
;; añadir ellama a emacs 
;;(add-to-list 'load-path "~/.emacs.d/codeium.el")

;; instala typescript mode 
(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))
;; configurr eslint (detectgar errores en typescript) 
;;(require 'eslintd)

(add-hook 'typescript-mode-hook #'company-mode)
(setq company-dabbrev-code-ignore-case t)

;;(add-to-list 'prog-mode-hook #'tabnine-mode)
;; Cargar Codeium
(add-to-list 'load-path "~/.emacs.d/codeium.el")
(require 'codeium)

;; Configurar Codeium
(setq codeium-mode-line-enable nil)
(setq codeium-bin-path "~/.emacs.d/codeium.el/bin")

;; Configurar Codeium con company-mode
;;(with-eval-after-load 'company
;;  (add-to-list 'company-backends #'codeium-completion-at-point))

;; Configuración de Projectile
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Configuración de Ivy, Counsel y Swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(global-set-key (kbd "C-s") 'swiper) ; Búsqueda interactiva en el buffer actual
(global-set-key (kbd "C-x b") 'ivy-switch-buffer) ; Cambio de buffer con Ivy
(global-set-key (kbd "M-x") 'counsel-M-x) ; Reemplaza M-x con Counsel
(global-set-key (kbd "C-x C-f") 'counsel-find-file) ; Mejora de find-file con Counsel
;; Integración de Counsel con Projectile
;;(counsel-projectile-mode)

 ;; Usa counsel-rg para búsquedas rápidas en proyectos
   (global-set-key (kbd "C-c p s r") 'counsel-rg)
(setq projectile-generic-command "rg --files")
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
;; Asignar counsel-projectile-rg a una tecla rápida
(global-set-key (kbd "C-c p s s") 'counsel-projectile-rg)

;; conifiguracion para pagar porta papeles  
 (when (getenv "DISPLAY")
     (defun copy-to-xclipboard ()
       (interactive)
       (if (region-active-p)
           (call-process-region (region-beginning) (region-end) "xclip" nil 0 nil "-selection" "clipboard")
         (message "No region active; can't copy to clipboard!")))

     (global-set-key (kbd "M-w") 'copy-to-xclipboard)

     (defun paste-from-xclipboard ()
       (interactive)
       (call-process-region (point) (if mark-active (mark) (point)) "xclip" nil t nil "-selection" "clipboard" "-o"))

     (global-set-key (kbd "C-y") 'paste-from-xclipboard))

 ;; configurar para mostrar errores 

   (require 'lsp-mode)
   (add-hook 'typescript-mode-hook #'lsp)
   (require 'lsp-ui)
   
;; Grapqhl mode    
;; (use-package graphql-mode
;;     :ensure t)
;;(add-hook 'graphql-mode-hook #'lsp)

;;(use-package lsp-ui
;;  :ensure t
;;  :commands lsp-ui-mode
;;  :after lsp-mode
;; :hook (lsp-mode . lsp-ui-mode))

;; Configurar graphql-ts-mode
(use-package graphql-ts-mode
  :ensure t
  :mode ("\\.graphql\\'" "\\.gql\\'")
  :hook (graphql-ts-mode . lsp))

;; Configurar lsp-mode para GraphQL
(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("graphql-lsp" "serve"))
                    :major-modes '(graphql-ts-mode)
                    :server-id 'graphql-lsp)))

;; Configurar lsp-ui para una mejor experiencia
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode))

;; Asignar una tecla para ejecutar consultas GraphQL
(with-eval-after-load 'graphql-ts-mode
  (define-key graphql-ts-mode-map (kbd "C-c C-c") 'lsp-graphql-execute-query))

 ;; modo cobol
(add-to-list 'auto-mode-alist '("\\.cob\\'" . cobol-mode))
(add-to-list 'auto-mode-alist '("\\.cbl\\'" . cobol-mode))

;; instalacion de paquete copilot
;; Instalar y configurar Copilot
(unless (package-installed-p 'copilot)
  (package-refresh-contents)
;;  (package-install 'copilot))
 (package-reinstall 'copilot))

(require 'copilot)
(add-hook 'prog-mode-hook 'copilot-mode)

(setq copilot-github-token "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")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)

(setq package-enable-conservative-install nil)

(unless package-archive-contents
  (package-refresh-contents))

;; Instala use-package si no está instalado
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ;; Asegura que use-package instale paquetes automáticamente

;; Configuración de temas
(use-package nord-theme
  :config
  (load-theme 'nord t))

;; Configuración de Treemacs
(use-package treemacs
  :bind ("C-c E" . treemacs-toggle)
  :config
  ;; Configura treemacs aquí si es necesario
  )

;; Configuración de js2-mode para archivos JavaScript
(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode))

(setq-default display-line-numbers t)

;; Configuración para PHP
(use-package php-mode
  :hook (php-mode . my-php-mode-setup))

(defun my-php-mode-setup ()
  "Configuraciones personalizadas para php-mode."
  (setq tab-width 4) ;; Establece el ancho de la pestaña a 4 espacios
  (setq indent-tabs-mode nil) ;; Usa espacios en lugar de tabs
  (setq c-basic-offset 4)) ;; Establece el desplazamiento básico a 4 espacios

;; Configuración de Company
(use-package company
  :config
  (global-company-mode) ;; Habilita company-mode globalmente
  (setq company-idle-delay 0.2) ;; Tiempo de espera antes de mostrar sugerencias
  (setq company-minimum-prefix-length 1)) ;; Muestra sugerencias después de escribir un carácter

;; Configuración de Web Mode
(use-package web-mode
  :mode ("\\.php\\'" . web-mode)
  :config
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t))

;; Habilitar el modo para HTML
;;(use-package html-mode)

;; Comando para embellecer el buffer actual
(defun beautify-html-buffer ()
  "Embellece el código HTML en el buffer actual."
  (interactive)
  (when (eq major-mode 'web-mode)
    (web-mode-buffer-indent)))

;; Asigna el comando a una combinación de teclas, por ejemplo, C-c b
(global-set-key (kbd "C-c b") 'beautify-html-buffer)
(put 'upcase-region 'disabled nil)

;;Configuracion de colores para consultas sql 

    


;; habilitar sql-indent a sql mode 
 (add-hook 'sql-mode-hook 'sqlind-minor-mode)
;; añadir ellama a emacs 
;;(add-to-list 'load-path "~/.emacs.d/codeium.el")

;; instala typescript mode 
(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))
;; configurr eslint (detectgar errores en typescript) 
;;(require 'eslintd)

(add-hook 'typescript-mode-hook #'company-mode)
(setq company-dabbrev-code-ignore-case t)

;;(add-to-list 'prog-mode-hook #'tabnine-mode)
;; Cargar Codeium
(add-to-list 'load-path "~/.emacs.d/codeium.el")
(require 'codeium)

;; Configurar Codeium
(setq codeium-mode-line-enable nil)
(setq codeium-bin-path "~/.emacs.d/codeium.el/bin")

;; Configurar Codeium con company-mode
;;(with-eval-after-load 'company
;;  (add-to-list 'company-backends #'codeium-completion-at-point))

;; Configuración de Projectile
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Configuración de Ivy, Counsel y Swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(global-set-key (kbd "C-s") 'swiper) ; Búsqueda interactiva en el buffer actual
(global-set-key (kbd "C-x b") 'ivy-switch-buffer) ; Cambio de buffer con Ivy
(global-set-key (kbd "M-x") 'counsel-M-x) ; Reemplaza M-x con Counsel
(global-set-key (kbd "C-x C-f") 'counsel-find-file) ; Mejora de find-file con Counsel
;; Integración de Counsel con Projectile
;;(counsel-projectile-mode)

 ;; Usa counsel-rg para búsquedas rápidas en proyectos
   (global-set-key (kbd "C-c p s r") 'counsel-rg)
(setq projectile-generic-command "rg --files")
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
;; Asignar counsel-projectile-rg a una tecla rápida
(global-set-key (kbd "C-c p s s") 'counsel-projectile-rg)

;; conifiguracion para pagar porta papeles  
 (when (getenv "DISPLAY")
     (defun copy-to-xclipboard ()
       (interactive)
       (if (region-active-p)
           (call-process-region (region-beginning) (region-end) "xclip" nil 0 nil "-selection" "clipboard")
         (message "No region active; can't copy to clipboard!")))

     (global-set-key (kbd "M-w") 'copy-to-xclipboard)

     (defun paste-from-xclipboard ()
       (interactive)
       (call-process-region (point) (if mark-active (mark) (point)) "xclip" nil t nil "-selection" "clipboard" "-o"))

     (global-set-key (kbd "C-y") 'paste-from-xclipboard))

 ;; configurar para mostrar errores 

   (require 'lsp-mode)
   (add-hook 'typescript-mode-hook #'lsp)
   (require 'lsp-ui)
   
;; Grapqhl mode    
;; (use-package graphql-mode
;;     :ensure t)
;;(add-hook 'graphql-mode-hook #'lsp)

;;(use-package lsp-ui
;;  :ensure t
;;  :commands lsp-ui-mode
;;  :after lsp-mode
;; :hook (lsp-mode . lsp-ui-mode))

;; Configurar graphql-ts-mode
(use-package graphql-ts-mode
  :ensure t
  :mode ("\\.graphql\\'" "\\.gql\\'")
  :hook (graphql-ts-mode . lsp))

;; Configurar lsp-mode para GraphQL
(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("graphql-lsp" "serve"))
                    :major-modes '(graphql-ts-mode)
                    :server-id 'graphql-lsp)))

;; Configurar lsp-ui para una mejor experiencia
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode))

;; Asignar una tecla para ejecutar consultas GraphQL
(with-eval-after-load 'graphql-ts-mode
  (define-key graphql-ts-mode-map (kbd "C-c C-c") 'lsp-graphql-execute-query))

 ;; modo cobol
(add-to-list 'auto-mode-alist '("\\.cob\\'" . cobol-mode))
(add-to-list 'auto-mode-alist '("\\.cbl\\'" . cobol-mode))

;; instalacion de paquete copilot
;; Instalar y configurar Copilot
(unless (package-installed-p 'copilot)
  (package-refresh-contents)
;;  (package-install 'copilot))
 (package-reinstall 'copilot))

(require 'copilot)
(add-hook 'prog-mode-hook 'copilot-mode)

(setq copilot-github-token "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")

;; Configuracion para ir archivos 
;; Se instalo jump-go y como era un version pasada causo conflicto se configuro
;; segun el manual las siguientes lineas de código son la integracion con la interfaz Xref
;; ludgo del integracions se pido comientar las lineas de codigo que contenian: (package-initialize)

(add-hook 'prog-mode-hook 'dumb-jump-mode)
(global-set-key (kbd "C-c g") 'dumb-jump-go)
