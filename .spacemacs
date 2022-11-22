;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(html
     python
     clojure
     ;; python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     (org :variables
          ;; journal
          ;; org-enable-org-journal-support t
          ;; org-journal-dir "~/Dropbox/org-files/journal/"
          ;; org-journal-file-format "%Y-%m-%d"
          ;; org-journal-date-prefix "#+TITLE: "
          ;; org-journal-date-format "%A, %B %d %Y"
          ;; org-journal-time-prefix "* "
          ;; org-journal-time-format ""
          ;; org-journal-file-type 'yearly
          ;; org-journal-prefix-key "C-c j"
          ;; org-journal-start-on-weekday 6 ;; Saturday

          org-startup-with-inline-images t
          org-startup-indented t
          org-indent-mode t

          ;; capture
          org-default-notes-file "~/Dropbox/org-files/org/wishlist.org"

          ;; roam
          org-enable-roam-support t
          org-roam-v2-ack t
          org-roam-directory (file-truename "~/Dropbox/org-files/org-roam/")
          org-roam-capture-templates '(("d" "default" plain "%?"
                                       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n")
                                       :unnarrowed t)
                                       ("b" "book" plain
                                        "- Authors: %?\n- Written: \n- Read: \n\n* Summary \n\n* Reading Notes \n\n"
                                        :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                           "#+title: ${title}\n")
                                        :unnarrowed t))
          ;; autocomplete node link
          ;; org-roam-complete-everywhere t
          )

     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     ;; bibtex support
     bibtex
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      websocket
                                      helm-bibtex
                                      org-reverse-datetree
                                      org-super-agenda
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-ediff ;; not on melpa
                                    string-edit ;; not on melpa
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-light
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq custom-file "~/.emacs.d/custom.el")
  (load custom-file)
  (fset 'evil-redirect-digit-argument 'ignore) ;; before evil-org loaded
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; (add-to-list 'evil-digit-bound-motions 'evil-org-beginning-of-line)
  ;; (evil-define-key 'motion 'evil-org-mode (kbd "0") 'evil-org-beginning-of-line)

  ;; Global Settings
  ;; ===============
  (setq ns-right-option-modifier 'meta)
  (setq mac-right-option-modifier 'meta)
  (setq-default fill-column 120)
  ;; (auto-fill-function 'do-auto-fill)
  (global-visual-line-mode t)
  (global-visual-fill-column-mode t)
  (global-undo-tree-mode)
  (evil-set-undo-system 'undo-tree)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode)

  ;; Ctrl-P
  (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)
  (define-key evil-normal-state-map (kbd "C-f") 'helm-multi-files)

  ;; helm
  ;; (global-set-key (kbd "C-c C-f") 'helm-for-files)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  ;; Custom date format
  (setq-default org-display-custom-times t)
  (setq org-time-stamp-custom-formats '("<%a %b %e %Y>" . "<%a %b %e %Y %H:%M>"))

  ;; cancel all with Esc
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

  ;; bug fix for org-roam backlinks
  (global-page-break-lines-mode 0)

  ;; latex preview
  (setq org-startup-with-latex-preview t)
  ;;(add-to-list 'org-latex-default-packages-alist '("" "fourier" t) t)
  ;; increase font size of latex
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.3))
  ;; (setq org-preview-latex-default-process 'dvisvgm) ;No blur when scaling

  ;; straight.el
  ;; ===============
  (defvar bootstrap-version)
  (let ((bootstrap-file
         (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
        (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously
           "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
           'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

  ;; Org
  ;;=====
  (add-hook 'auto-save-hook 'org-save-all-org-buffers)
  (defun org-clocking-buffer (&rest _))
  (org-babel-do-load-languages 'org-babel-load-languages '((latex . t)))
  (setq org-hide-emphasis-markers t)
  (global-set-key (kbd "C-x C-o") (lambda () (interactive)
                        (cd "~/Dropbox/org-files/org")
                        (call-interactively 'helm-find-files)))

  ;; Org-roam Settings
  ;; ==================
  (bind-key "C-c i" 'org-roam-node-insert)
  (bind-key "C-c f" 'org-roam-node-find)
  (bind-key "C-c l" 'org-roam-buffer-toggle)

  ;; buffer
  (setq org-roam-mode-section-functions
        (list #'org-roam-backlinks-section
              #'org-roam-reflinks-section
              ;; #'org-roam-unlinked-references-section
              ))

  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-direction)
                 (direction . right)
                 (window-width . 0.33)
                 (window-height . fit-window-to-buffer)))

  ;; ;; autocomplete node link
  ;; ;; (bind-key "C-M-i" 'completion-at-point)

  ;; bibtex support
  (setq org-ref-default-bibliography '("~/Dropbox/org-files/references.bib")
        org-ref-pdf-directory "~/Dropbox/papers"
        org-ref-bibliography-notes "~/Dropbox/org/paper-notes.org")

  ;; Org-roam-ui Settings
  ;; ==================

  (use-package org-roam-ui
    :straight
    (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
    :after org-roam
    ;; :hook
    ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
    ;;         a hookable mode anymore, you're advised to pick something yourself
    ;;         if you don't care about startup time, use
     :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

  ;; (use-package org-roam-bibtex
  ;;   :after org-roam
  ;;   :hook (org-roam-mode . org-roam-bibtex-mode))

  ;; Org-agenda Settings
  ;; ==================
  (setq org-agenda-files (directory-files-recursively "~/Dropbox/org-files/org" "\\.org$"))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-skip-deadline-prewarning-if-scheduled t)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WIP(w)" "|" "DONE(d!)" "CANC(c!)" "INCOMPLETE(i!)")))

  (setq org-columns-default-format "#+COLUMNS: %75ITEM %TODO %3PRIORITY %TAGS")

  ;; Note: org-agenda-skip-entry-if calls org-agenda-skip-if which has better doc
  ;; Detailed explanation: https://orgmode.org/worg/org-tutorials/advanced-searching.html
  (setq org-agenda-custom-commands
        '(("c" "Custom View"
           (
            (tags-todo "+PRIORITY=\"A\"+SCHEDULED<\"<+1d>\""
                  ((org-agenda-span 'day)
                   (org-agenda-entry-types '(:scheduled))
                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled 'todo 'done))
                   (org-agenda-overriding-header "\nScheduled High-priority Tasks:")))
            (tags-todo "+PRIORITY=\"B\"+SCHEDULED<\"<+1d>\""
                       ((org-agenda-span 'day)
                        (org-agenda-entry-types '(:scheduled))
                        (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled 'todo 'done))
                        (org-agenda-overriding-header "\nScheduled Medium-priority Tasks:")))
            ;; (todo "WIP"
                  ;; ((org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))))
            (agenda "" ((org-agenda-span 1)))
            ;; (alltodo "")

           )
         ))
   )

  ;; '(("c" "Columnn View" (org-agenda-columns) )
  
  ;; Org-capture

  ;; goto main file
  (global-set-key (kbd "C-c o") 
                  (lambda () (interactive) (org-end-of-subtree) (find-file "~/Dropbox/org-files/org/wishlist.org")))

  (global-set-key (kbd "C-c w") 
                  (lambda () (interactive) (org-end-of-subtree) (find-file "~/Dropbox/org-files/org/weekly.org")))

  (global-set-key (kbd "C-c m") 
                  (lambda () (interactive) (org-end-of-subtree) (find-file "~/Dropbox/org-files/org/medium-long-term-goals.org")))

  ;; research project
  (global-set-key (kbd "C-c r") 
                  (lambda () (interactive) (org-end-of-subtree) (find-file "~/Dropbox/org-files/org/projects/belief_space_recovery_skills.org")))

  ;; thoughts
  (global-set-key (kbd "C-c t") 
                  (lambda () (interactive) (org-end-of-subtree) (find-file "~/Dropbox/org-files/org/research_thoughts.org")))

  (global-set-key (kbd "C-c g") 
                  (lambda () (interactive) (org-end-of-subtree) (find-file "~/Dropbox/org-files/org/medium-long-term-goals.org")))

  ;; refile
  (setq org-refile-targets '(("wishlist.org" :maxlevel . 4)
                             ("meetings.org" :maxlevel . 3)))

  (add-to-list 'org-capture-templates
               '("n" "Note"  entry
                 (file+datetree "~/Dropbox/org-files/org/wishlist.org")
                 "* %?" :empty-lines 1 :prepend t)) ;; %u : inactive timestamp

  (add-to-list 'org-capture-templates
               '("t" "Todo"  entry
                 (file+datetree"~/Dropbox/org-files/org/wishlist.org")
                 "* TODO %?" :empty-lines 1 :prepend t))

  (add-to-list 'org-capture-templates
               '("w" "Weekly Review"  entry
                 (file+datetree "~/Dropbox/org-files/org/weekly.org")
                 "* Review \n%?" :empty-lines 1 :tree-type week))

  (add-to-list 'org-capture-templates
               '("m" "Meeting"  entry
                 (file+datetree"~/Dropbox/org-files/org/meetings.org" )
                 "* %?" :empty-lines 1 :prepend t))

  (add-to-list 'org-capture-templates
               '("k" "Research Talk"  entry
                 (file+datetree"~/Dropbox/org-files/org/research_talks.org" )
                 "* %?" :empty-lines 1 :prepend t))

  (add-to-list 'org-capture-templates
               '("r" "Research Project"  entry (file+datetree "~/Dropbox/org-files/org/projects/belief_space_recovery_skills.org")
                 "* %?" :empty-lines 1 :prepend t)) ;; %u : inactive timestamp

  ;; (add-to-list 'org-capture-templates
  ;;              '("l" "Recovery Learning"  entry (file+datetree "~/Dropbox/org-files/org/projects/recovery_skills.org")
  ;;                "* %?" :empty-lines 1 :prepend t)) ;; %u : inactive timestamp

  (add-to-list 'org-capture-templates
               '("R" "Research Thought"  entry (file+datetree "~/Dropbox/org-files/org/research_thoughts.org" )
                 "* %?" :empty-lines 1 :prepend t))

  ;; (add-to-list 'org-capture-templates
  ;;              '("T" "PhD Thesis"  entry (file+datetree "~/Dropbox/org-files/org/phd_thesis.org")
  ;;                "* %?" :empty-lines 1 :prepend t)) ;; %u : inactive timestamp

  ;; (setq reftex-default-bibliography '("~/Dropbox/org-files/bib/references.bib"))
  ;; (setq org-ref-bibliography-notes "~/Dropbox/org-files/bib/notes.org")
  ;; (setq org-ref-default-bibliographhy '("~/Dropbox/org-files/bib/references.bib"))
  ;; (setq org-ref-pdf-directory "~/Dropbox/org-files/bib/pdfs")
  ;; (setq bibtex-completion-bibliography "~/Dropbox/org-files/bib/references.bib"
        ;; bibtex-completion-library-path "~/Dropbox/org-files/bib/pdfs"
        ;; bibtex-completion-notes-path "~/Dropbox/org-files/bib/helm-bibtex-notes")
)
