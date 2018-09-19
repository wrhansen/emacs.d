;; Additional packages in MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Maximize the frame on startup
(toggle-frame-maximized)

;; Set the font
(set-frame-font "Iosevka 11")

;; Whitespace mode
;; Makes particular whitespace characters stand out better.
;; XXX: This currently conflicts with my theme. Occasionally it doesn't decorate a line properly (all pink).
;;(global-whitespace-mode 1)

;; My Current Theme -- solarized!
;; I'm getting it from melpa
(load-theme 'solarized-dark t)

;; All the Icons
;; https://github.com/domtronn/all-the-icons.el
;; Adds a bunch of icons for various other packages
;; I'm currently going to use it to display filetype icons in NeoTree
(require 'all-the-icons)

;; Turn on font-lock mode to color text in certain modes
(global-font-lock-mode t)

;; Make sure spaces are used when indenting code
(setq-default indent-tabs-mode nil)

;; Display line numbers
(global-linum-mode 1)

;; Deactivate line numbers in org mode
(add-hook 'org-mode-hook (lambda () (linum-mode 0)))

;; Hide Toolbars & Menubars
;; I don't like or need those, so gain a little bit of real estate
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; Display Margin
;; Gotta Figure this out. Doesn't look simple

;; Highlight Current Row
(global-hl-line-mode +1)

;; Hide the startup "Welcome" screen.
;; Getting tired of seeing this.
(setq inhibit-startup-screen t)

;; Org Mode Settings
(global-set-key "\C-ca" 'org-agenda)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Dashboard package
;; https://github.com/rakanalh/emacs-dashboard
;; Trying this out for a more custom start screen experience
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Welcome to emacs, Wes")

;; NeoTree package
;; https://github.com/jaypei/emacs-neotree
;; Provides a visual directory tree which I can toggle off and on with f8
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Multiple Cursors!
;; https://github.com/magnars/multiple-cursors.el
;; Looks similar to SublimeText functionality. Will have to try this one out later.
;; TODO: Still have to install this one

;; Projectile
;; https://github.com/bbatsov/projectile
;; Project Interaction Library
;; Nice set of features for operating on a project level
;; TODO: Still need to figure out what this one does. The C-c p shortcut doesn't seem to work
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Magit
;; https://magit.vc
;; *THE* git plugin for emacs
;; Everywhere I look, this is the git plugin that people use.
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
