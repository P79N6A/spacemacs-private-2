;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-idle-delay 0.2
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets"
                      :disabled-for markdown)
     ;;autohotkey
     better-defaults
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     (chinese :variables
              chinese-enable-fcitx nil
              chinese-enable-avy-pinyin nil
              chinese-enable-youdao-dict t)
     (clojure :variables clojure-enable-fancify-symbols t)
     (colors :variables
             colors-enable-nyan-cat-progress-bar t
             colors-colorize-identifiers 'all)
     (dash :variables
           helm-dash-docset-newpath "~/.docsets")
     deft
     ;; docker
     emacs-lisp
     git
     github
     ;;gpu
     graphviz
     ;;(gtags :disabled-for clojure emacs-lisp javascript latex python shell-scripts)
     (helm :variables
           helm-enable-auto-resize t
           helm-no-header nil
           helm-position 'bottom
           helm-use-fuzzy 'always
           spacemacs-helm-rg-max-column-number 1024
           )
     html
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     ;;ivy
     java
     latex
     markdown
     (org :variables
          org-enable-github-support t
          org-want-todo-bindings t)
     plantuml
     (python :variables
             python-test-runner '(pytest nose)
             python-enable-yapf-format-on-save t)
     ranger
     ;;search-engine
     (shell :variables
            shell-default-shell 'zshell
            shell-default-height 30
            shell-default-position 'bottom)
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)
     (spell-checking :variables spell-checking-enable-by-default nil)
     (syntax-checking :variables syntax-checking-enable-by-default nil
                      syntax-checking-enable-tooltips nil)
     version-control
     (vinegar :variables vinegar-reuse-dired-buffer t)
     yaml
     dinghmcn
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    counsel-projectile  ;; remove ivy
                                    )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((agenda . 3)
                                (recents . 7)
                                (bookmarks . 5)
                                (projects . 3))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font (cond
                              ((spacemacs/system-is-mswindows)
                               '("Source Code Variable"
                                 :size 13
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1))
                              ((spacemacs/system-is-linux)
                               '("Source Code Pro"
                                 :size 13
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1)))

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
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

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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
   dotspacemacs-line-numbers '(:relative nil
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; debug info
  ;;(setq debug-on-error t)

  ;; delete server file
  (if (file-exists-p "~/.emacs.d/server/server")
      (delete-file "~/.emacs.d/server/server"))
  ;;设置窗口位置为屏库左上角(200,80)
  ;;(set-frame-position (selected-frame) 200 88)
  ;;设置宽和高,我的十寸小本是110,33,大家可以调整这个参数来适应自己屏幕大小
  ;;(setq default-frame-alist '((height . 40) (width . 128) (menu-bar-lines . 0)))
  (defun dinghmcn/set-frame-position-size (position-x position-y frame-width frame-height)
    (interactive)
    (progn
      (set-frame-position (selected-frame)
                          (round (* (x-display-pixel-width) position-x))
                          (round (* (x-display-pixel-height) position-y)))
      (add-to-list 'default-frame-alist
                   (cons 'width (round (* (/ (x-display-pixel-width) (frame-char-width)) frame-width))))
      (add-to-list 'default-frame-alist
                   (cons 'height (round (* (/ (x-display-pixel-height) (frame-char-height)) frame-height))))))

  (if window-system
      (cond
       ((spacemacs/system-is-mswindows)
        (dinghmcn/set-frame-position-size 0.158 0.08 0.65 0.75))
       ((spacemacs/system-is-linux)
        (dinghmcn/set-frame-position-size 0.158 0.08 0.5 0.6))))

  (let ((num 3))
    (cond
     ((eq num 1) (setq configuration-layer-elpa-archives
                       '(("melpa" . "melpa.org/packages/")
                         ("org" . "orgmode.org/elpa/")
                         ("gnu" . "elpa.gnu.org/packages/"))))
     ((eq num 2) (setq configuration-layer-elpa-archives
                       '(("melpa-cn" . "elpa.emacs-china.org/melpa/")
                         ("org-cn"   . "elpa.emacs-china.org/org/")
                         ("gnu-cn"   . "elpa.emacs-china.org/gnu/"))))
     ((eq num 3) (setq configuration-layer-elpa-archives
                       '(("melpa-tuna" . "mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org-tuna"   . "mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ("gnu-tuna"   . "mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))))
     ))

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  (setq evil-shift-round nil)
  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  ;; hack for remove purpose mode
  (setq purpose-mode nil)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;;解决F1显示helm buffer报错
  (with-eval-after-load 'helm
    (setq helm-display-function 'helm-default-display-buffer))

  (fset 'evil-visual-update-x-selection 'ignore)

  ;; force horizontal split window
  (setq split-width-threshold 120)

  ;; use eww to browse your docsets
  (setq helm-dash-browser-func 'eww)

  ;; orgmode show titles
  (setq org-startup-folded 'content)

  ;; enable company-mode
  (global-company-mode)

  ;;(spacemacs|add-company-backends :modes text-mode)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  (global-hungry-delete-mode t)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)

  (evilified-state-evilify-map special-mode-map :mode special-mode)

  (add-to-list 'auto-mode-alist
               '("Capstanfile\\'" . yaml-mode))

  (global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
  (defun un-indent-by-removing-4-spaces ()
    "remove 4 spaces from beginning of of line"
    (interactive)
    (save-excursion
      (save-match-data
        (beginning-of-line)
        ;; get rid of tabs at beginning of line
        (when (looking-at "^\\s-+")
          (untabify (match-beginning 0) (match-end 0)))
        (when (looking-at (concat "^" (make-string tab-width ?\ )))
          (replace-match "")))))

  (defun dinghmcn/toggle-major-mode ()
    (interactive)
    (if (eq major-mode 'fundamental-mode)
        (set-auto-mode)
      (fundamental-mode)))
  (spacemacs/set-leader-keys "otm" 'dinghmcn/toggle-major-mode)

  ;; (add-hook 'text-mode-hook 'spacemacs/toggle-spelling-checking-on)

  (setq powerline-default-separator 'zigzag)

  ;; Setting Chinese Font
  (defun dinghmcn/set-font (english english-size chinese chinese-size)
    (interactive)
    (set-face-attribute 'default nil :font
                        (format   "%s:pixelsize=%d"  english english-size))

    (dolist (charset '(kana han cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
                        (font-spec :family chinese :size chinese-size))))
  (cond
   ((spacemacs/system-is-mswindows)
    (dinghmcn/set-font "Source Code Variable" 13 "Microsoft Yahei" 16))
   ((spacemacs/system-is-linux)
    (dinghmcn/set-font "Source Code Pro" 13 "Noto Sans CJK SC" 16)))


  ;; 编码设置 begin
  (setq system-time-locale "C") ;; test:(format-time-string "%Y-%m-%d %a")
  ;;(set-language-environment 'Chinese-GB)
  (set-language-environment "UTF-8")
  (set-default buffer-file-coding-system 'utf-8-unix)
  (set-default-coding-systems 'utf-8-unix)
  (setq-default pathname-coding-system 'euc-cn)
  (setq file-name-coding-system 'euc-cn)
  ;; 另外建议按下面的先后顺序来设置中文编码识别方式。
  ;; 重要提示:写在最后一行的，实际上最优先使用; 最前面一行，反而放到最后才识别。
  ;; utf-16le-with-signature 相当于 Windows 下的 Unicode 编码，这里也可写成
  ;; utf-16 (utf-16 实际上还细分为 utf-16le, utf-16be, utf-16le-with-signature等多种)
  (prefer-coding-system 'cp950)
  (prefer-coding-system 'gb2312)
  (prefer-coding-system 'cp936)
  (prefer-coding-system 'gb18030)
  ;;(prefer-coding-system 'utf-16le-with-signature)
  (prefer-coding-system 'utf-16)
  ;; 新建文件使用utf-8-unix方式
  ;; 如果不写下面两句，只写
  ;; (prefer-coding-system 'utf-8)
  ;; 这一句的话，新建文件以utf-8编码，行末结束符平台相关
  (prefer-coding-system 'utf-8-dos)
  (prefer-coding-system 'utf-8-unix)
  ;; 编码设置 end
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
