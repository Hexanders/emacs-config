;;; early-init.el --- Early initialization -*- lexical-binding: t -*-

;; Emacs 27+ early initialization file
;; This file is loaded before package.el and GUI initialization

;; Increase garbage collection threshold during startup for better performance
;; Will be reset to normal value in init.el after startup
(setq gc-cons-threshold most-positive-fixnum)

;; Prevent package.el from loading packages before init.el
;; We'll handle package initialization in init.el
(setq package-enable-at-startup nil)

;; Disable unnecessary UI elements early for faster startup
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Prevent the glimpse of un-styled Emacs by disabling these UI elements early
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

;;; early-init.el ends here
