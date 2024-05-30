;; This is the main Emacs file that gets called on startup of Emacs
;; 

;;--------------------------------------------------------------
;;

;; Packages
;;
;;--------------------------------------------------------------


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Define the following variables to remove the compile-log warnings
;; when defining ido-ubiquitous
;; (defvar ido-cur-item nil)
;; (defvar ido-default-item nil)
;; (defvar ido-cur-list nil)
;; (defvar predicate nil)
;; (defvar inherit-input-method nil)


;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Some packages I like to have installed by default.
(defvar my-packages
    '(;; makes handling lisp expression much easier
      paredit

      ;; colorful parenthesis matching
      rainbow-delimiters

      ;; allow ido usage in as many contexts as possible. see
      ;; customizations/navigation.el line 23 for a description
      ;; of ido
      ido-completing-read+

      ;; Enhances M-x to allow easier execution of commands. Provides a 
      ;; filterable list of possible commands in the minibuffer
      smex

      ;; project navigation
      projectile

      ;; org mode superstar
      ;; https://github.com/integral-dw/org-superstar-mode
      org-superstar

      ;; add racket for racket & scheme programming
      racket-mode     

      ;; slime for lisp editing
      slime 

      ;; clojure
      clojure-mode

      ;; extra syntax highlighting for clojure
      clojure-mode-extra-font-locking

      ;; integration with a Clojure REPL
      ;; https://github.com/clojure-emacs/cider
      cider   
      
      ;; edit html tags like sexps
      tagedit

      ;; git integration
      magit))


(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able 
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file

(add-to-list 'load-path "~/.emacs.d/vendor")

;;;;
;;---------------------------------------------------------------
;;
;; Customization
;;
;;---------------------------------------------------------------


;; Add a directory to the load path so Emacs knows where to look for 
;; the corresponding file when 'loading things.

(add-to-list 'load-path "~/.emacs.d/customizations")

;; Set up exec-path-from-shell so Emacs will use correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier to navigate files,
;; switch buffers, and choose options in the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard to categorize customizations
(load "misc.el")

;; org-babel for editing languages
(load "org-babel.el")

;; For editing lisps
(load "elisp-editing.el")

;; set to have GIT prompt for a password
(setenv "GIT_ASKPASS" "git-gui--askpass")

;; Language-specific

;; LISP - sbcl & slime
(load "common-lisp.el")
(load "racket.el")
(load "setup-clojure.el")

(load "setup-js.el")

;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(coffee-tab-width 2)
 ;;'(package-selected-packages
 ;;  (quote
 ;;   (magit tagedit rainbow-delimiters projectile smex
;; ido-completing-read+  paredit exec-path-from-shell))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   '(org-superstar tagedit smex slime sicp rainbow-delimiters racket-mode quack projectile paredit magit ido-completing-read+ clojure-mode-extra-font-locking cider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
