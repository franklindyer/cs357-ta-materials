(require 'package)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-archives
     (quote
       (("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))))
(package-initialize)

(setq package-list '(haskell-mode))

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Basic UI setup
(require 'font-lock)
(global-font-lock-mode t)
(show-paren-mode 1)
(put 'upcase-region 'disabled nil)
(put 'eval-expression 'disabled nil)

;; Basic Racket setup
(setq scheme-program-name "<PATH-TO-RACKET>")
(setq auto-mode-alist
      (cons '("\\.rkt\\'" . scheme-mode)
            auto-mode-alist))

;; Basic Haskell setup
(require 'haskell-mode)
(setq haskell-program-name "<PATH-TO-GHCI>")
(setq auto-mode-alist
      (cons '("\\.hs\\'" . haskell-mode)
            auto-mode-alist))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; Choose indentation mode (the latter requires haskell-mode >= 2.5):
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
