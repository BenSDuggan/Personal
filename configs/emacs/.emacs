;; Ben Duggan emacs config
;; Stuff for: evil-mode, racket-mode, autoperin, rainbowperin, line numbers, no sound on errors, 
;; latex-preview-pane-mode, better packages


;; Added by Package.el. Not sure what this is for
(package-initialize)

;; fix issue with retreiving gnu?
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives
	      '("melpa" . "https://melpa.org/packages/") t)
(custom-set-variables
 '(package-selected-packages
   (quote
    (org-pdfview pdf-tools auctex rainbow-delimiters racket-mode))))
(custom-set-faces )

;; Used for mac racket mode
(require 'racket-mode)
(setq racket-racket-program "/Applications/Racket v7.5/bin/racket")
(setq racket-raco-program "/Applications/Racket v7.5/bin/raco")

;; get rid of sounds
(setq visible-bell t)

;; autocomplete brackets
(package-initialize)
(smartparens-global-mode t)

;;;; Allow us to use TeX
;;(add-hook 'text-mode-hook
;;       (lambda () (set-input-method "TeX")))

;; Rainbow delimiter
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Add spacemac theme
(load-theme 'spacemacs-dark t)

;; Add line numbers
(global-linum-mode 1)

;; evil mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; Use latex-preview-pane-mode with .tex files
;;(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-preview-pane-mode))
;;(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
;;(setq auto-mode-alist
;;	(append '(("\\.tex\\'" . latex-preview-pane-mode) 
;;            ("\\.tex\\'" . latex-mode))
;;           auto-mode-alist))


;; auctex stuff
;;(require 'auctex)
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)

;; Fix tex path
;;(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))  
;;(setq exec-path (append exec-path '("/Library/TeX/texbin/")))

;; Tex settings
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq TeX-save-query nil)

;;;; latex-preview-pane-mode
;;(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)
;;(defun my-make-slash-backslash ()
;;  (local-set-key (kbd "\\") "\\\\"))

;;(add-hook 'LaTeX-mode-hook 'my-make-slash-backslash)

;; Fix meta key on Mac (Became a problem when I used emacs-mac instead of emacs
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'none
        mac-right-option-modifier 'meta
        mac-option-modifier 'meta))

;;(defun insert-backs ()  
;;    "insert back-slash"
;;    (interactive)
;;    (insert "\\ "))
;;(global-set-key (kbd "\\") 'insert-backs)

