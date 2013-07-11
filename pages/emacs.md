---
layout: page
title: "Emacs"
description: "All about Emacs [ Operating System :-) ]"
---

{% include JB/setup %}

# Emacs Org Mode

  [[http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html][Org Mode Tutorial]]


# How to generate tags:

Install on exuberant ctags on Ubuntu

    sudo aptitude install exuberant-ctags

Create a Makefile with following target


    tags:
    	etags.ctags -a -e -f TAGS --tag-relative -R app lib import_tool


Tags navigation:

    M-. tag <RET>

Find first definition of tag (find-tag). 

    C-u M-.

Find next alternate definition of last tag specified. 

    C-u - M-.

Go back to previous tag found. 

    C-M-. pattern <RET>

Find a tag whose name matches pattern (find-tag-regexp). 

    C-u C-M-.

Find the next tag whose name matches the last pattern used. 

    C-x 4 . tag <RET>

Find first definition of tag, but display it in another window (find-tag-other-window). 

    C-x 5 . tag <RET>

Find first definition of tag, and create a new frame to select the buffer (find-tag-other-frame). 

    M-*

Pop back to where you previously invoked M-. and friends.


Go to function/variable definition: M-. (M-* to return)

Next definition of the tag: C-u M-. (e.g. same method in multiple classes)

Search for occurrences of symbols: M-x tags-search (M-, to search forward)

Find symbols as reg-exps: M-x find-tag-regexp


# Emacs Notes

    How about repeating the last command in Emacs?
    
    C-x z (Repeats last command once)
    C-x z z z... ( Repeats last command thrice ... and so on.)
    
    How to use the tabbed like navigation in Emacs?
    use the
    M-x tabbar-mode
    
    How to navigate the next and previous buffers?
    Previous Buffer : C-x <C-Left>
    Next Buffer : C-x <C-Right>
    
    ASCII mode in emacs
    M-x ascii-on
    
    Quick Recap:
    ================================================================================
    
    Keystrokes  Action
    -----------------------------------
    C-p         Up one line
    C-n         Down one line
    C-f         Forward one character
    C-b         Backward one character
    C-a         Beginning of line
    C-e         End of line
    C-v         Down one page
    M-v         Up one page
    M-f         Forward one word
    M-b         Backward one word
    M-<         Beginning of buffer
    M->         End of buffer
    C-g         Quit current operation
    ----------------------------------
    
    Keystrokes  Function           Description
    -------------------------------------------------------------------
    C-x C-s     save-buffer        Save the current buffer to disk
    C-x u       undo               Undo the last operation
    C-x C-f     find-file          Open a file from disk
    C-s         isearch-forward    Search forward for a string
    C-r         isearch-backward   Search backward for a string
                replace-string     Search & replace for a string
                replace-regexp     Search & replace using regexp
    C-h t       help-with-tutorial Use the interactive tutorial
    C-h f       describe-function  Display help for a function
    C-h v       describe-variable  Display help for a variable
    C-h x       describe-key       Display what a key sequence does
    C-h a       apropos            Search help for string/regexp
    C-h F       view-emacs-FAQ     Display the Emacs FAQ
    C-h i       info               Read the Emacs documentation
    C-x r m     bookmark-set       Set a bookmark. Useful in searches
    C-x r b     bookmark-jump      Jump to a bookmark.
    ------------------------------------------------------------------
    
    ================================================================================
    GNU Emacs Reference Card:
    ================================================================================
    
    C-  means hold the CONTROL key while typing the character
        Thus, C-f would be: hold the CONTROL key and type f.
    M-  means hold the META or EDIT key down while typing .
        If there is no META or EDIT key, type , release it,
        then type the character .  "" stands for the
        key labelled "ALT" or "ESC".
    Type C-h t for a tutorial.
    
    
    Starting Emacs
    
    To enter Emacs, just type its name: emacs
    To read in a file to edit, see Files, below.
    
    Leaving Emacs
    
    suspend Emacs (the usual way of leaving it) C-z
    exit Emacs permanently              C-x C-c
    
    Files
    
    read a file into Emacs              C-x C-f
    save a file back to disk            C-x C-s
    insert contents of another file into this-buffer C-x i
    replace this file with the file you reallywant   C-x C-v
    write buffer to a specified file    C-x C-w
    run Dired, the directory editor     C-x d
    
    Getting Help
    
    The Help system is simple. Type C-h and follow the directions. If
    you are a first-time user, type C-h t for a tutorial. (This card
    assumes you know the tutorial.)
    
    get rid of Help window              C-x 1
    scroll Help window                  ESC C-v
    
    apropos: show commands matching a string  C-h a
    show the function a key runs        C-h c
    describe a function                 C-h f
    get mode-specific information       C-h m
    
    Error Recovery
    
    abort partially typed or executing command  C-g
    recover a file lost by a system crash       M-x recover-file
    undo an unwanted change                     C-x u or C-_
    restore a buffer to its original contents   M-x revert-buffer
    redraw garbaged screen                      C-l
    
    
    Incremental Search
    
    search forward                      C-s
    search backward                     C-r
    regular expression search           C-M-s
    
    Use C-s or C-r again to repeat the search in either direction.
    
    exit incremental search             ESC
    undo effect of last character       DEL
    abort current search                C-g
    
    If Emacs is still searching, C-g will cancel the part of the search
    not done, otherwise it aborts the entire search.
    
    
    Cursor motion:
    
      entity to move over          backward forward
      character                    C-b      C-f
      word                         M-b      M-f
      line                         C-p      C-n
      go to line beginning (or end)C-a      C-e
      sentence                     M-a      M-e
      paragraph                    M-[      M-]
      page                         C-x [    C-x ]
      sexp                         C-M-b    C-M-f
      function                     C-M-a    C-M-e
      go to buffer beginning (or end)M-<    M->
    
    Screen motion:
    
      scroll to next screen             C-v
      scroll to previous screen         M-v
      scroll left                       C-x <
      scroll right                      C-x >
    
    Killing and Deleting
    
    entity to kill                 backward forward
    character (delete, not kill)   DEL      C-d
    word                           M-DEL    M-d
    line (to end of)               M-0 C-k  C-k
    sentence                       C-x DEL  M-k
    sexp                           M-- C-M-kC-M-k
    
    kill region                         C-w
    kill to next occurrence of char     M-z char
    
    yank back last thing killed         C-y
    replace last yank with previous killM-y
    
    Marking
    
    set mark here                       C-@ or C-SPC
    exchange point and mark             C-x C-x
    
    set mark arg words away             M-@
    mark paragraph                      M-h
    mark page                           C-x C-p
    mark sexp                           C-M-@
    mark function                       C-M-h
    mark entire buffer                  C-x h
    
    Query Replace
    
    interactively replace a text string M-%
    using regular expressions  M-x query-replace-regexp
    
    Valid responses in query-replace mode are
    
    replace this one, go on to next     SPC
    replace this one, don't move        ,
    skip to next without replacing      DEL
    replace all remaining matches       !
    back up to the previous match       ^
    exit query-replace                  ESC
    enter recursive edit (C-M-c to exit)C-r
    
    Multiple Windows
    
    delete all other windows            C-x 1
    delete this window                  C-x 0                     M-q
    fill region                         M-g
    set fill column                     C-x f
    set prefix each line starts with    C-x .
    
    Case Change
    
    uppercase word                      M-u
    lowercase word                      M-l
    capitalize word                     M-c
    uppercase region                    C-x C-u
    lowercase region                    C-x C-l
    capitalize region             M-x capitalize-region
    
    The Minibuffer
    
    The following keys are defined in the minibuffer.
    
    complete as much as possible        TAB
    complete up to one word             SPC
    complete and execute                RET
    show possible completions           ?
    abort command                       C-g
    
    Type C-x ESC to edit and repeat the last command that used the
    minibuffer. The following keys are then defined.
    
    previous minibuffer command         M-p
    next minibuffer command             M-n
    
    Buffers
    
    select another buffer               C-x b
    list all buffers                    C-x C-b
    kill a buffer                       C-x k
    
    Transposing
    
    transpose characters                C-t
    transpose words                     M-t
    transpose lines                     C-x C-t
    transpose sexps                     C-M-t
    
    
    Spelling Check
    
    check spelling of current word           M-$
    check spelling of all words in region    M-x spell-region
    check spelling of entire buffer          M-x spell-buffer
    
    Tags
    
    find tag                            M-.
    find next occurrence of tag         C-u M-.
    specify a new tags file             M-x visit-tags-table
    
    regexp search on all files in tags           Mtable-x tags-search
    query replace on all the files               M-x tags-query-replace
    continue last tags search or query-replace   M-,
    
    Shells
    
    execute a shell command                      M-!
    run a shell command on the region            M-|
    filter region through a shell command        C-u M-|
    start a shell in window *shell*              M-x shell
    
    
    Rmail
    
    scroll forward                               SPC
    scroll reverse                               DEL
    beginning of message                         .  (dot)
    next non-deleted message                     n
    previous non-deleted message                 p
    next message                                 M-n
    previous message                             M-p
    delete message                               d
    delete message and back up                   C-d
    undelete message                             u
    reply to message                             r
    forward message to someone                   f
    send mail                                    m
    get newly arrived mail                       g
    quit Rmail                                   q
    output message to another Rmail file         o
    output message in Unix-mail style            C-o
    show summary of headers                      h
    
    Regular Expressions
    
    The following have special meaning inside a regular expression.
    
    any single character                         .  (dot)
    zero or more repeats                         *
    one or more repeats                          +
    zero or one repeat                           ?
    any character in set                         [ . .].
    any character not in set                     [^ . .].
    beginning of line                            ^
    end of line                                  $
    quote a special character c                  \c
    alternative (\or")                           \|
    grouping                                     \( . .\.)
    nth group                                    \n
    beginning of buffer                          \`
    end of buffer                                \'
    word break                                   \b
    not beginning or end of word                 \B
    beginning of word                            \<
    end of word                                  \>
    any word-syntax character                    \w
    any non-word-syntax character                \W
    character with syntax c                      \sc
    character with syntax not c                  \Sc
    
    Registers
    
    copy region to register                      C-x x
    insert register contents                     C-x g
    save point in register                       C-x /
    move point to saved location                 C-x j
    
    
    Info
    
    enter the Info documentation reader          C-h i
    
    Moving within a node:
    
      scroll forward                             SPC
      scroll reverse                             DEL
      beginning of node                          .  (dot)
    
    Moving between nodes:
    
      next node                                  n
      previous node                              p
      move up                                    u
      select menu item by name                   m
      select nth menu item by number             (1{5)n
      follow cross reference (return withfl)
      return to last node you saw                l
      return to directory node                   d
      go to any node by name                     g
    
    Other:
    
      run Info tutorial                          h
      list Info commands                         ?
      quit Info                                  q
      search nodes for regexp                    s
    
    
    Keyboard Macros
    
    start defining a keyboard macro              C-x (
    end keyboard macro definition                C-x )
    execute last-defined keyboard macro          C-x e
    append to last keyboard macro                C-u C-x (
    name last keyboard macro                     M-x name-last-kbd-macro
    insert lisp definition in buffer             M-x insert-kbd-macro
    
    
    Commands Dealing with Emacs Lisp
    
    eval sexp before point                       C-x C-e
    eval current defun                           C-M-x
    eval region                                  M-x eval-region
    eval entire buffer                           M-x eval-current-buffer
    read and eval minibuffer                     M-ESC
    re-execute last minibuffer command           C-x ESC
    read and eval Emacs Lisp file                M-x load-file
    load from standard system directory          M-x load-library
    
    
    
    ================================================================================
    
    
    IRC from within Emacs:
    ===========================================================
    
    How do I use IRC from inside Emacs?
    
    Download and install the package -- erc --- which is an irc client for Emacs.
    M-x erc-select RET irc.freenode.net RET
    
    
    Windows key binding in emacs:
    ===========================================================
    
    (global-set-key [(control c)(down)] 'windmove-down)
    (global-set-key [(control c)(up)] 'windmove-up)
    (global-set-key [(control c)(left)] 'windmove-left)
    (global-set-key [(control c)(right)] 'windmove-right)
    
    Colorize the syntax:
    ===========================================================
    
    Install packages  : TRAMPS , emacs-color-theme
    
    M-x font-lock-mode
    M-x color-theme-select  Hober, Euphoria
    
    
    Grep color highlighting:
    ===========================================================
    
    
    export  GREP_OPTIONS='--color=auto'
    
    M-x occur
    
    M-x grep-find
    
    C-x o
    
    C-x 0
    
    C-x 1
    
    C-x 2
    
    C-x 3
    
    
    Version Control commands:
    ==================================================
    
    M-x vc-annotate
    M-x vc-diff
    M-x vc-version-diff
    
    How do I get to know the conflicted files using Emacs?
    M-x cvs-examine RET path to the directory to be examined
    Emacs will examine and present the status of all the files in that directory. 
    Conflicted files may be presented in RED ( if you have color terminal ). 
    Navigate the buffer and goto the file by pressing enter. Once you modify the 
    (conflicted) file and save it, the status in the Emacs buffer is automatically 
    updated.
    
    
    
    General Editing:
    ==================================================
    C-M-\ indent
    C-M-p move to previous matching bracket
    C-M-n move to next matching bracket
    
    
    How to set spaces to be used instead of tabs?
    (setq indent-tabs-mode nil)
    ;; set the number of spaces to be used
    (setq tab-width 4)
    
    
    Recover a file from the last session:
    M-x recover-file
    
    How to navigate the next and previous buffers?
    Previous Buffer : C-x <C-Left>
    Next Buffer : C-x <C-Right>
    
    How to use the tabbed navigation ( like in Firefox ) within Emacs?
    use the
    M-x tabbar-mode
    
    How about repeating the last command in Emacs?
    
    C-x z (Repeats last command once)
    C-x z z z... ( Repeats last command thrice ... and so on.)
    
    
    How to create SSH login with no password required?
    On remote system (server):
    $ ssh-keygen -t rsa
    
    On local system (localhost):
    $ ssh-keygen -t rsa
    $ cd .ssh
    $ scp id_rsa.pub user@server:~/.ssh/id_rsa.user_at_localhost
    
    On remote system ( server ):
    $ cd  ~/.ssh
    $ cat id_rsa.user_at_localhost >> authorized_keys
    
    Now you login from localhost to server
    
    Shortcuts
     Indent a region : C-M-\
     Comment a region : M-;
     Auto Complete words : M-/
     To delete all trailing whitespace within the current buffer's restriction (see section AC.22 Narrowing),
     type M-x delete-trailing-whitespace RET. (This command does not remove the form-feed characters.)
     Code Folding
     To fold all the function bodies:   M-1 C-x $ and magic happens!
     As usual, it's white magic: C-x $ will bring your code back.
    
    ================================================================================
    Setting Emacs Load Path:
    ================================================================================
    Using csh:
            setenv EMACSLOADPATH .:/user/bil/emacs:/usr/local/share/emacs/20.3/lisp
    
    Here is how to set it using sh:
    
         export EMACSLOADPATH
         EMACSLOADPATH=.:/user/bil/emacs:/usr/local/share/emacs/20.3/lisp
    
    In .emacs file:
    
         (setq load-path
               (append (list nil "/user/bil/emacs"
                             "/usr/local/lisplib"
                             "~/emacs")
                       load-path))
    
    
    ================================================================================
    Emacs Code Browser
    ================================================================================
    sudo apt-get install ecb
    
    
    Shortcuts/Tips:
    ================================================================================
    Delete Indentation:
    M-^
    
    Delete Rectantular selection text
    C-x r k
    
    Paste Rectangular selection text
    C-x r y
    
    
    ==================================================
    Code Folding:
    ==================================================
    
    Below is an excrept somewhere from the internet regarding Code Folding:
    
    '''
    Code folding, the ability to hide code or text blocks in source or text files, 
    is a feature present in most editors nowadays. Emacs has several modes providing
    this functionality with various degrees of sophistication: outline-mode, 
    allout, hide-show or folding-mode come to mind. One can even use Emacs 
    narrowing capabilities to cook up custom folding.
    
    Over the time, i've noticed that, at the end of the day, i have usually little 
    use for folding. I strive for short functions (whenever a function body extends 
    a half-page, i feel a strong refactoring urge), and as a consequence i seldom 
    need to hide their bodies, nor to mention blocks within them.
    
    There is however one folding trick that i use all the time. I often want to 
    hide all function bodies in a file, to get a quick summary of it contents. As 
    it happens, you don't need any package or extra configuration for that. Just 
    go to any source file, type
    
            M-1 C-x $
    
    and magic happens! As usual, it's white magic: C-x $ will bring your code back.
    
    We can use Emacs help system to discover what's going on: C-h k C-x $ tells 
    us that the above key combination is calling set-selective-display, a 
    function that takes one numerical argument (the M-1 prefix passes 1 as the 
    value of that argument) and, unsurprisingly, sets the variable selective-display 
    to the value of that argument. I'll let you read about the details in Emacs 
    help itself, although i'm sure that by now you get the idea.
    
    If you find yourself setting and unsetting selective-display as often as i do, 
    next thing will be defining a handy keyboard shortcut, right?
    
    (defun jao-toggle-selective-display ()
      (interactive)
      (set-selective-display (if selective-display nil 1)))
    
    (global-set-key [f1] 'jao-toggle-selective-display)
    
    or we can also use an optional numerical prefix (with 1 as default) with a little modification:
    
    (defun jao-toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (if selective-display nil (or column 1))))
    
    Happy folding!
    
    '''
    
    ==================================================
    Special modes:
    ==================================================
    
    Mason Emacs Mode: For editing the Mason Templates
    
    Setting up Mason Mode: Add these lines to the .emacs file
    
    ;; for Mason mode
    ;; (add-to-list 'load-path (expand-file-name "/full/path/to/lisp/site/"))
    (setq load-path
          (append (list nil "/full/path/to/lisp/site/")
                  load-path))
    (require 'mmm-auto)
    (setq mmm-global-mode 'maybe)
    (add-to-list 'auto-mode-alist '("\\.mhtml\\'" . html-mode))
    (mmm-add-mode-ext-class 'html-mode "\\.mhtml\\'" 'mason)
    (set-foreground-color "#ffffff")
    (set-background-color "#000000")
    
    M-x mmm-mode
    
    NOTE: When the .emacs configuration file is not getting
     loaded then force by setting an alias in ~/.bashrc
     or ~/.profile file like so:
    
    alias e="emacs -l ~/.emacs"
    
    
    
    
    ================================================================================
    Customize your EMACS using the .emacs configuration file:
    ================================================================================
    
    (setq additional-paths '("/home/tuxdna" "/home/tuxdna/.emacs.d/site-lisp"))
    (setq load-path (append additional-paths load-path))
    
    ;;;;;;;;;;;;;;;;;
    ;; APPEARANCE
    ;;;;;;;;;;;;;;;;;
    (setq font-lock-maximum-decoration t)
    (setq visible-bell t)
    (setq require-final-newline t)
    (setq resize-minibuffer-frame t)
    (setq column-number-mode t)
    (setq-default transient-mark-mode t)
    (setq next-line-add-newlines nil)
    (setq blink-matching-paren nil)
    (global-font-lock-mode 1 t)
    (blink-cursor-mode -1)
    (tool-bar-mode -1)
    (tooltip-mode -1)
    
    ;;Customized syntax highlighting colors
    (set-default-font "-misc-fixed-medium-r-normal-*-*-200-*-*-c-*-koi8-r")
    (set-foreground-color "#dbdbdb")
    (set-background-color "#000000")
    (set-cursor-color "#ff0000")
    (custom-set-variables '(load-home-init-file t t))
    
    (if (> (display-color-cells) 20)
        (custom-set-faces
         '(font-lock-builtin-face ((t (:foreground "deepskyblue"))))
         '(font-lock-comment-face ((t (:foreground "gray60"))))
         '(font-lock-doc-face ((t (:foreground "darkkhaki"))))
         '(font-lock-keyword-face ((t (:foreground "magenta"))))
         '(font-lock-function-name-face ((t (:foreground "green" :background "seagreen"))))
         '(font-lock-string-face ((t (:foreground "gold"))))
         '(font-lock-type-face ((t (:foreground "cyan" :background "slateblue"))))
         '(font-lock-variable-name-face ((t (:foreground "yellow"))))
    
         '(modeline ((t (:foreground "plum1" :background "navy"))))
         '(region ((t (:background "sienna"))))
         '(highlight ((t (:foreground "black" :background "darkseagreen2"))))
    
         '(diff-added-face ((t (:foreground "green"))))
         '(diff-changed-face ((t (:foreground "yellow"))))
         '(diff-header-face ((t (:foreground "cyan"))))
         '(diff-hunk-header-face ((t (:foreground "magenta"))))
         '(diff-removed-face ((t (:foreground "red")))))
    )
    
    ;;;;;;;;;;;;;;;;;
    ;; KEYS
    ;;;;;;;;;;;;;;;;;
    
    (setq suggest-key-bindings t)
    (global-set-key [delete] 'delete-char)
    (global-set-key [kp-delete] 'delete-char)
    (global-set-key "\C-h" 'backward-delete-char)
    (global-set-key "\C-x\ ?" 'help)
    (global-set-key "\C-c\ l" 'goto-line)
    (global-set-key "\C-x\ f" 'find-file-other-window)
    (global-set-key "\C-x\ \C-r" 'recentf-open-files)
    (global-set-key [home] 'beginning-of-buffer)
    (global-set-key [end] 'end-of-buffer)
    (global-set-key "\C-z" nil)
    
    ;;;;;;;;;;;;;;;;;
    ;; MISC
    ;;;;;;;;;;;;;;;;;
    
    ;; go right to an empty buffer
    (setq inhibit-startup-message t)
    
    ;; translates ANSI colors into text-properties, for eshell
    (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
    (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
    
    ;; cvs stuff
    (setq vc-default-back-end 'CVS)
    (autoload 'cvs-add "cvs-add" "CVS add" t)
    (autoload 'cvs-commit "cvs-commit" "CVS commit" t)
    (autoload 'cvs-diff "cvs-diff" "CVS diff" t)
    
    ;; recentf stuff
    (require 'recentf)
    (recentf-mode 1)
    (setq recentf-max-menu-items 25)
    
    ;; mode stuff
    (setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))
    (autoload 'ruby-mode "ruby-mode" nil t)
    (setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
    
    ;; autorevert stuff
    (autoload 'auto-revert-mode "autorevert" nil t)
    (autoload 'turn-on-auto-revert-mode "autorevert" nil nil)
    (autoload 'global-auto-revert-mode "autorevert" nil t)
    (global-auto-revert-mode 1)
    
    (defalias 'yes-or-no-p 'y-or-n-p)
    (setq auto-save-interval 50)
    (setq list-matching-lines-default-context-lines 1) ;; for M-x occur
    
    ;; counting functions
    (defalias 'lc 'count-lines-page)
    
    (defun wc ()
      "Count the words in the current buffer, show the result in the minibuffer"
      (interactive)          ; *** This is the line that you need to add
      (save-excursion
        (save-restriction
          (widen)
          (goto-char (point-min))
          (let ((count 0))
          (while (forward-word 1)
          (setq count(1+ count)))
          (message "There are %d words in the buffer" count)))))
    
    ;; normally disabled by default
    (put 'downcase-region 'disabled nil)
    (put 'upcase-region 'disabled nil)
    
    ;; Highlights the selected region
    (transient-mark-mode t)
    
    
    ;; Are we running XEmacs or Emacs?
    (defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))
    
    ;; Set up the keyboard so the delete key on both the regular keyboard
    ;; and the keypad delete the character under the cursor and to the right
    ;; under X, instead of the default, backspace behavior.
    (global-set-key [delete] 'delete-char)
    (global-set-key [kp-delete] 'delete-char)
    
    ;; Turn on font-lock mode for Emacs
    (cond ((not running-xemacs)
           (global-font-lock-mode t)
    ))
    
    ;; Always end a file with a newline
    ;;(setq require-final-newline t)
    
    ;; Stop at the end of the file, not just add lines
    (setq next-line-add-newlines nil)
    
    ;; Always open .pl.in file in perl-mode (cperl-mode)
    (setq auto-mode-alist (cons '("\.pl\.in$" . perl-mode) auto-mode-alist))
    
    ;; Brace matching.....
    
    (global-set-key "%" 'match-paren)
        (defun match-paren (arg)
          "Go to the matching paren if on a paren; otherwise insert %."
          (interactive "p")
          (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
                ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
                (t (self-insert-command (or arg 1)))))
    
    ;; Setting tab width
    
    (setq default-tab-width 4)
    
    ;; Enable wheelmouse support by default
    
    (if (not running-xemacs)
        (require 'mwheel) ; Emacs
      (mwheel-install) ; XEmacs
    )
    
    (put 'downcase-region 'disabled nil)
    
    
    
    ;; Brace matching! Again , the another way.
    
    (global-set-key "%" 'match-paren)
        (defun match-paren (arg)
          "Go to the matching paren if on a paren; otherwise insert %."
          (interactive "p")
          (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
                ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
                (t (self-insert-command (or arg 1)))))
    
    
    ;; Perl mode! Dont know what it does :-) , but it is here anyways
    
    (add-hook 'perl-mode-hook '(lambda () (local-set-key [?\C-c ?\C-f] 'perl-run)))
    (defvar perl-run-window-size '7 "*size of output screen for perl")
    (defun perl-run () (interactive) (save-buffer)
      (let* ((old-buffer (buffer-name))
       (output-buffer "*Shell Command Output*"))
         (shell-command (concat "./" old-buffer))
           (set-buffer (get-buffer-create output-buffer))
             (pop-to-buffer output-buffer)
    	   (shrink-window (- (window-height) perl-run-window-size))
    	     (pop-to-buffer old-buffer)
    	       ))
    
    
    
    
    
    
    
    
    
# ERC:

I use the following code in .emacs with Emacs ERC to get notified using notify-send whenever anyone pings me on IRC:
( by skannan )

    (defun erc-global-notify (matched-type nick msg)
      (interactive)
      (when (eq matched-type 'current-nick)
        (shell-command
         (concat "notify-send -t 8000 -c "im.received" ""
                 (car (split-string nick "!"))
                 " mentioned your nick" ""
                 msg
                 """))))
    (add-hook 'erc-text-matched-hook 'erc-global-notify)


# Emacs quick reference

    Key prefix                                                Description
    C-c                                                       Commands particular to the current editing mode
    C-x                                                       Commands for files and buffers
    C-h                                                       Help commands
    M-x                                                       Literal function name
    
    
    Binding                         Function name             Description
    C-x C-s                         save-buffer               Save current buffer to disk.
    C-x s                           save-some-buffers         Ask about saving all unsaved buffers to disk.
    C-x C-c                         save-buffers-kill-emacs   Ask about saving all unsaved buffers to disk and exit Emacs.
    C-x C-z                         suspend-emacs             Suspend Emacs and make it a background process.
    C-x C-b                         list-buffers              List all buffers.
    C-x k                           kill-buffer               Kill a buffer (the current buffer, by default).
    C-x C-q                         vc-toggle-read-only       Toggle read-only status on the current buffer (and perform version control if applicable).
    C-x i                           insert-file               Insert the contents of a file at point.
    
    
    Keystroke                       Function                  Description
    C-p, UpArrow                    previous-line             Move point up to the previous line.
    C-n, DownArrow                  next-line                 Move point down to the next line.
    C-f, RightArrow                 forward-char              Move point forward to the next character.
    C-b, LeftArrow                  back-char                 Move point backward to the previous character.
    M-f                             forward-word              Move point forward to the next word.
    M-b                             backward-word             Move point backward to the previous word.
    C-v, PgDn                       scroll-up                 Scroll the text upward by a screen.
    M-v, PgUp                       scroll-down               Scroll the text downward by a screen.
    Home                            beginning-of-buffer       Move point to the beginning of the buffer. (On some versions, this key is defined by default to move to the beginning of the current line.)
    End                             end-of-buffer             Move point to the end of the buffer. (On some versions, this key is defined by default to move to the end of the current line.)
    C-a                             beginning-of-line         Move point to the beginning of the line.
    C-e                             end-of-line               Move point to the end of the line.
    M-a                             beginning-of-sentence     Move point to the beginning of the sentence.
    M-e                             end-of-sentence           Move point to the end of the sentence.
    C-{                             beginning-of-paragraph    Move point to the beginning of the paragraph.
    C-}                             end-of-paragraph          Move point to the end of the paragraph.
    
    
    
    
    Keystroke                       Function                  Description
    Ins                             overwrite-mode            Toggle overwrite mode (default is off).
    Backspace,Del                   delete-backward-char      Delete the character before point.
    C-d                             delete-char               Delete the character at point.
    M-d                             kill-word                 Delete the characters from point forward to the end of the word.
    M-Backspace,M-Del               backward-kill-word        Delete the characters from point backward to the beginning of the word.
    C-_                             undo                      Undo your last typing or action.
    C-q character or XXX            quoted-insert             Insert, at point, the literal character keypress or the character whose octal value is XXX.
    C-u number command              universal-argument        Execute command a total of number (default 4) times in succession.
    
    
    
    Keystroke                       Function                  Description
    C-Space                         set-mark-command          Set the mark at point.
    C-k                             kill-line                 Kill all text from point to the end of the line.
    C-w                             kill-region               Kill the region.
    M-w                             kill-ring-save            Save the region in the kill ring, but don't kill it.
    C-y                             yank                      Yank text from the kill ring.
    
    
    Mouse command                                             Description
    B1                                                        This command sets the point; drag B1 to set the region.
    B1-B1                                                     This command marks a word.
    B1-B1-B1                                                  This command marks a line.
    B2                                                        This command yanks the text.
    B3                                                        This command sets and highlights the region, and then places it in the kill buffer without killing it. If a region is already highlighted and set, the end of the region moves to the place where you click.
    B3-B3                                                     This command sets and highlights the region and then kills it. If a region is already highlighted and set, the end of the region moves to the place where you click, and then the region is killed.
    
    
    
    
    
    Mode                            Function                           Type        Description
    Fundamental                     fundamental-mode                   Major       This mode is the default Emacs mode with minimal settings and bindings.
    Text                            text-mode                          Major       This mode is the basic mode for editing text.
    Abbrev                          abbrev-mode                        Minor       This mode is for making and using abbreviations (see Abbrev mode).
    Auto Fill                       auto-fill-mode                     Minor       This mode is for automatic word wrap and filling long lines and paragraphs.
    Overwrite                       overwrite-mode                     Minor       This mode is for overwriting any existing text in a buffer instead of inserting text at point. It's bound by default to the Ins key.
    C                               c-mode                             Major       This mode is for editing C program source code.
    Line Number                     line-number-mode                   Minor       This mode is for displaying the current line number.
    Lisp Interaction                lisp-interaction                   Major       This mode is for editing and compiling Lisp code.
    Paragraph-Indent Text           paragraph-indent-text-mode         Major       This mode is a special variation of the Text mode where the paragraph-movement commands work for paragraphs whose first lines are indented, and not just for paragraphs separated by blank lines.
    TeX                             tex-mode                           Major       This mode is for editing TeX documents.
    WordStar                        wordstar-mode                      Major       This special mode provides the key bindings of the WordStar editor.
    
    
    
    
    Key                             Description or function
    Esc                             Prefix for mode-specific commands
    Esc Tab, M-Tab                  ispell-complete-word
    Esc S, M-S                      center-paragraph
    Esc s, M-s                      center-line 
    
    
    
    Binding                         Command or function     Description
    C-x C-i, C-x Tab                indent-rigidly          This command indents lines in the region (or at point).
        fill-region                 This command fills all paragraphs in the region.
    M-q                             fill-paragraph     This command fills the single paragraph at point.
    M-\                             delete-horizontal-space         This command removes any horizontal space to the right and left of point.
    C-o                             open-line                       This command opens a new line of vertical space below point, without moving point.
    C-t                             transpose-chars                 This command transposes the single characters to the right and left of point.
    M-t                             transpose-words                 This command transposes the single words to the right and left of point.
    C-x C-t                         transpose-lines                 This command transposes the line at point with the line before it.
    M-^                             delete-indentation              This command joins the line at point with the previous line. Preface with C-1 to join the line at point with the next line.
    M-u                             uppercase-word                  This command converts the text at point to the end of the word to uppercase letters.
    M-l                             downcase-word                   This command converts the text at point to the end of the word to lowercase letters.
    C-x C-l                         downcase-region                 This command converts the region to lowercase letters.
    C-x C-u                         upcase-region                   This command converts the region to uppercase letters.
    
    
    
    
    
    
    Key Description
    Space, y        Replace this match.
    Del, n Skip this match and move to the next.
    Enter, q    Exit query-replace.
    .      Make this replacement and then exit query-replace.
    ,      Make this replacement, move point to it, and exit query-replace.
    C-r    Specify a recursive edit.
    C-w    Delete the match and recursive edit.
    C-l    Redraw the screen with this line in the center.
    !      Continue making all replacements without querying first.
    E      Edit the replacement string.
    ^      Go back to the previous replacement.
    
    
    
    Binding   Command or function  Description
    C-s [string] [C-w] [C-y]       isearch-forward  Incrementally search forward through the buffer for string (default is the last search string you gave, if any); C-w uses the text from point forward to the end of the word and C-y uses everything from point to the end of the line.
    C-r [string] [C-w] [C-y]       isearch-backward               Incrementally search backward through the buffer for string (default is the last search string you gave, if any); C-w uses the text from point forward to the end of the word, and C-y uses everything from point to the end of the line.
    C-s Enter C-w word or phrase   word-search-forward            Search forward through the buffer for the given word or phrase, regardless of spacing.
    C-r Enter C-w word or phrase   word-search-backward           Search backward through the buffer for the given word or phrase, regardless of spacing.
    C-M-s     isearch-forward-regexp                              Incrementally search forward through the buffer for a given regular expression.
    C-M-r     isearch-backward-regexp                             Incrementally search backward through the buffer for a given regular expression.
              replace-string                                      Search for a given string from point to the end of the buffer and replace it with a given string.
              replace-regexp                                      Search for a given regular expression from point to the end of the buffer and replace it with a given string.
    M-%       query-replace                                       Search for a given string from point to the end of the buffer and, in each instance, query (as described in Table 4) to replace it with a given string.
    C-M-%     query-replace-regexp                                Search for a given regular expression from point to the end of the buffer and, in each instance, query (as described in Table 4) to replace it with a given string.
    
    
    
    
    Key       Description
    character       Make the suggested replacement prefaced by (character).
    Space           Accept this word as correct in this context.
    i               Accept this word as correct and insert it into the personal dictionary file.
    a               Accept this word as correct only for this Emacs session.
    A               Accept this word as correct only for this buffer in this Emacs session.
    r               Replace the word with a string you type (and that Ispell then rechecks).
    R               Replace the word with a string you type (and that Ispell then rechecks) and run a query-replace through the rest of the buffer.
    l               Replace the word with a given string and do a lookup of the new string in a given dictionary file.
    u               Insert a lowercase version of the word into the personal dictionary file.
    m               Replace the word with a given string, save it to the personal dictionary, and then recheck the word.
    C-l             Recenter the screen on the current line.
    C-r             Enter a recursive edit.
    C-z             Suspend Emacs. (In X, this iconifies the Emacs client window.)
    x               Exit the spell check and move point back to its original position.
    X               Exit the spell check, leaving point where it is.
    q               Immediately quit the spell check.
    ?               Display a menu of options.
    
    
    
    
    
    
    
    Binding         Description
    M-$             Correct the last misspelled word using Ispell.
    M-x flyspell-auto-correct-word, M-Tab       Correct the last misspelled word automatically, with a suggestion found with Ispell.
    M-x flyspell-auto-correct-previous-word     Correct the previous misspelled word automatically, with a suggestion found with Ispell.
    M-x flyspell-correct-word, B2               Display a pop-up menu with word suggestions.
    
    
    
    Binding                    Command or function      Description
    M-$                        ispell-word              Call Ispell to check the spelling of the word at point.
                               ispell-region            Call Ispell to check the spelling of the region.
                               ispell-buffer            Call Ispell to check the spelling of all the words from point to the end of the buffer.
                               flyspell-mode            Call Ispell to check the spelling of all the words in buffer in the background as you type and highlight all misspellings.
    
    
    
    
    Option                     Description
    --foreground-color color
    -fg color          Set the foreground color to color.
    --background-color color
    -bg color          Set the background color to color.
    --border-color color
    -bd color      Set the border color to color.
    --cursor-color color
    -cr color      Set the cursor color to color.
    --mouse-style color
    -ms color     Set the mouse pointer color to color.
    
    
    
    
    Option        Description
    --visit=filespec
    --file=filespec
    filespec        Open filespec into individual buffers for editing.
    +row[:column]   Move point to line number row and (optional) horizontal position column in the file (default is +1:1).
    --insert file
             Insert file at the beginning of the buffer.
    --debug-init    Use the Lisp debugger on the .emacs startup file.
    --no-init-file
    -q      Don't run any .emacs startup file.
    --no-site-file    Don't run the global site-start.el file.
    -u user
    --user user     Use the .emacs startup file of user.
    --funcall function
    -f function     Execute the Emacs Lisp function.
    --eval expression
    --execute expression    Evaluate the Emacs Lisp expression.
    --load file
    -l file         Execute the Emacs Lisp instructions in file.
    -batch
    --batch         Use batch (non-interactive) mode.
    -kill
    --kill  Exit Emacs when in batch mode.
    --name name  Use name as the name for the Emacs X client window (default is "emacs").
    -T title
    --title title   Use title as the title for the Emacs X client window (default is name@FQDN, where FQDN is the host's fully qualified domain name).
    --reverse-video
    -r      Use reverse video, swapping the foreground and background colors.
    --iconic
    -iconic         Start Emacs as an icon instead of an active window.
    --icon-type
    -i      When iconifying the Emacs window, use the Emacs icon (usually qat /usr/share/emacs/version/etc/gnu.xpm) instead of any window manager defaults.
    -fn name
    -font name      Use name for the Emacs window font.
    --border-width width
    -bw width      Set the window border to width pixels.
    --internal-border width
    -ib width         Set the window's internal border to width pixels.
    --g dimensions
    --geometry dimensions   Set the window's width, height, and position according to the given X window dimensions (the default is to make the window 80x40 characters).
    --foreground-color color
    -fg color          Set the foreground color to color.
    --background-color color
    -bg color          Set the background color to color.
    --border-color color
    -bd color      Set the border color to color.
    --cursor-color color
    -cr color      Set the cursor color to color.
    --mouse-color color
    -ms color     Set the mouse-pointer color to color.
    -d name
    --display name  Open the Emacs window on the X display corresponding to name.
    -nw
    --no-windows    In X, don't use an X client window, but open in the current terminal window instead. This option doesn't affect console sessions.
    -t file
    --terminal file         Redirect standard I/O to file instead of terminal.
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    Key        Function     Description
    C-x r space X           point-to-register       Save point to register X.
    C-x r s X   copy-to-register                    Save the region to register X.
    C-x r r X   copy-rectangle-to-register          Save the selected rectangle to register X.
    undefined   view-register                       View the contents of a given register.
    C-x r j X   jump-to-register                    Move point to the location given in register X.
    C-x r i X   insert-register                     Insert the contents of register X at point.
    
    
    
    
    
    
    
    Key Function                                    Description
    C-x r m Bookmark                                bookmark-set    Set a bookmark named Bookmark.
    C-x r l                                         bookmarks-bmenu-list  List all saved bookmarks.
        bookmark-delete                             Delete a bookmark.
    C-x r b Bookmark                                bookmark-jump   Jump to the location set in the bookmark named Bookmark.
    undefined                                       bookmark-save   Save all bookmarks to the bookmark file, ~/.emacs.bmk.
    
    
    
    
    Function                                        Description
    windmove-up                                     Move to the window directly above the current window, if it exists.
    windmove-down                                   Move to the window directly below the current window, if it exists.
    windmove-left                                   Move to the window directly to the left of the current window, if it exists.
    windmove-right                                  Move to the window directly to the right of the current window, if it exists.
    
    
    
    
    Function                                        Binding Description
    split-window-vertically                         C-x 2   Split the current window in half across the middle, stacking the new buffers vertically.
    switch-to-buffer-other-window                   C-x 4 b       Split the current window in half vertically, prompting for the buffer to use the bottom window and making that the active window.
    display-buffer                                  C-x 4 C-o     Display a buffer in another window, prompting for the buffer to use the other window but keeping the current window active. (If only one window exists, then split the window vertically to display the other buffer.)
    find-file-other-window                          C-x 4 f       Open a new file in a new buffer, drawing it in a new vertical window.
    find-file-read-only-other-window                C-x 4 r       Open a new file in a new read-only buffer, drawing it in a new vertical window.
    scroll-other-window                             C-M-v         Scroll to the window that would be the next one to switch to with C-x o.
    scroll-all                                                    Toggle the scroll-all minor mode. When it's on, all windows displaying the buffer in the current window are scrolled simultaneously and in equal, relative amounts.
    other-window                                                  C-x o  Move the cursor to the next window, and make it the active window.
    windmove-up                                                       Move to the window directly above the current window, if it exists.
    windmove-down                                                          Move to the window directly below the current window, if it exists.
    windmove-left                                                               Move to the window directly to the left of the current window, if it exists.
    windmove-right                                                                   Move to the window directly to the right of the current window, if it exists.
    delete-window                                                                    C-x 0   Delete the current window, and move the cursor to the window that would be the next one to switch to with C-x o.
    delete-other-windows                                                             C-x 1   Delete all windows except the current window.
    kill-buffer-and-window                                                           C-x 4 0        Delete the current window, and kill its buffer.
    split-window-horizontally                                                        C-x 3          Split the current window in half down the middle, stacking the new buffers horizontally.
    follow-mode                                                                          Toggle follow, a minor mode. When it's on in a buffer, all windows displaying the buffer are connected into a large virtual window.
    enlarge-window                                                                       C-x ^  Make the current window taller by a line; preceded by a negative, this makes the current window shorter by a line.
    shrink-window-horizontally                                                           C-x }  Make the current active window thinner by a single column.
    enlarge-window-horizontally                                                          C-x {  Make the current active window wider by a single column.
    shrink-window-if-larger-than-buffer                                                  C-x -  Reduce the current active window to the smallest possible size for the buffer it contains.
    balance-windows                                                                      C-x +  Balance the size of all windows, making them approximately equal.
    compare-windows                                                                          Compare the current window with the next window, beginning with point in both windows and moving point in both buffers to the first character that differs until reaching the end of the buffer.
    
    
    
    
    
    Function                                                                                 Binding Description
    make-frame-command                                                                       C-x 5 2        Make a new Emacs frame, and make it the active frame.
    switch-to-buffer-other-frame                                                             C-x 5 b        Open a specified buffer in another frame. If no other frame exists, create a new frame.
    find-file-other-frame                                                                    C-x 5 f        Open a specified file in another frame. If no other frame exists, create a new frame.
    find-file-read-only-other-frame                                                          C-x 5 r        Open a specified file in a read-only buffer in another frame. Create a new frame if no other frame exists.
    other-frame                                                                              C-x 5 o        Move to the next frame, and make it the active frame.
    delete-frame                                                                             C-x 5 0        Delete the current frame, and make the next frame the active frame.
    delete-other-frames                                                                      C-x 5 1        Delete all frames but the current frame.
    iconify-or-deiconify-frame                                                               C-z   Iconify the current frame. If the frame is already iconified, then deiconify it. (In a console, this binding suspends Emacs.)
    
    
    
    
    
    
    Mode                                                                                     Description
    animate                                                                                  Make the mouse pointer move quickly away to a random position in the frame whenever the cursor gets close to it.
    banish                                                                                   Banish the mouse pointer to the upper-right corner of the window as soon as you start typing.
    cat-and-mouse                                                                            Synonym for animate.
    exile                                                                                    Move the mouse pointer to the upper-right corner of the window (like banish) only if the pointer gets too close to the cursor. Once the cursor moves away, bring the pointer back to its original position.
    jump                                                                                     Make the mouse pointer instantly jump to a random position in the frame whenever the cursor gets close to it.
    none                                                                                     No mouse avoidance (the default).
    proteus                                                                                  Move the mouse pointer as in animate, but like Proteus of Greek mythology, change the mouse pointer's shape (a random image character is used).
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    Variable                                                                                 Description
    auto-mode-alist                                                                          If set to nil, automatic selection of major mode based on file name extension is turned off. Its default value is a list of file name extensions and corresponding modes.
    auto-save-default                                                                        If not set to nil, Emacs automatically saves a changed buffer to its corresponding file at preset intervals. Its default value is t.
    auto-save-interval                                                                       Contains the number of character changes after which Auto-save mode, if true, is invoked; the default value is 300.
    calendar-latitude                                                                        Contains the latitude value for the location of the user's workstation, in degrees; the default value is nil.
    calendar-longitude                                                                       Contains the longitude value for the location of the user's workstation, in degrees; the default value is nil.
    calendar-location-name                                                                   Contains the value for the location name (such as city, state, and country) for the location of the user's workstation; the default value is nil.
    colon-double-space                                                                       If not set to nil, commands for filling text insert two spaces after a colon instead of one. The default value is nil.
    command-line-args                                                                        Contains the list of arguments used in the command line that executed the current Emacs session.
    command-line-default-directory                                                           Contains the path name of the directory from which the current Emacs session was executed.
    compare-ignore-case                                                                      If not set to nil, Emacs ignores differences in uppercase and lowercase letters when running the compare-windows function, as described in fifth installment of this series (see Resources). The default value is nil.
    confirm-kill-emacs                                                                       If set to nil, Emacs doesn't ask for a confirmation when exiting; otherwise, the exit verification might be customized as an Emacs Lisp function such as y-or-n-p (see the Make short answers possible section). The default value is nil.
    default-justification                                                                    Sets the default justification style. The value can be one of left, right, center, full, or none. The default value is left.
    default-major-mode                                                                       Selects the default major mode for new files or buffers. The default value is fundamental-mode.
    display-time-24hr-format                                                                 If set to t, Emacs displays time in 24-hour military format, instead of the standard 12-hour format with AM or PM suffix. The default value is nil.
    display-time-day-and-date                                                                If not set to nil, Emacs displays time with the current day of the week, current month, and current day of the month, instead of just the hour and minute. The default value is nil.
    fill-column                                                                              Contains the number for the column on each line where text begins to be filled to the next line. The default value is 70.
    initial-major-mode                                                                       Specifies the major mode to use for the *scratch* buffer on startup. The default value is lisp-interaction-mode.
    inverse-video                                                                            If not set to nil, Emacs inverts the display colors, if possible. The default value is nil.
    kill-ring                                                                                Contains the contents of the Emacs kill ring, as described in third installment of this series (see Resources).
    kill-ring-max                                                                            Sets the number of allowable entries in the Emacs kill ring. The default value is 60.
    kill-whole-line                                                                          If not set to nil, the kill-line function (bound to C-k) kills the current line and its trailing newline character, if the function is executed at the very beginning of the line. The default value is nil.
    make-backup-files                                                                        If not set to nil, Emacs saves a backup of a buffer before any changes are made to a file of the same name but with a tilde character (~) appended to the end.
    mark-ring                                                                                Contains the contents of the current mark ring of the buffer, as described in third installment of this series (see Resources).
    mark-ring-max                                                                            Contains the number of allowable entries in the mark ring. The default value is 16.
    mouse-avoidance-mode                                                                     Contains a value describing the type of mouse-avoidance mode, as described in fifth installment of this series (see Resources). The default value is nil.
    next-line-add-newline                                                                    If not set to nil, Emacs adds a new line whenever the down arrow is pressed at the end of the buffer. The default value is nil (in more recent versions of Emacs).
    scroll-bar-mode                                                                          Contains the value for the side of the
    
    
    
    
    
    
    
    Function                                                                                 Description
    column-number-mode                                                                       Toggle the display, in the mode line, of the current column the cursor is at, preceded by a C. The default value is nil.
    display-time                                                                             Toggle the display of the current time in the mode line. The default value is nil.
    font-lock-mode                                                                           If not set to nil, Emacs turns on the Font Lock mode automatically for the current buffer. The default value is nil.
    global-font-lock-mode                                                                    If not set to nil, Emacs turns on the Font Lock mode automatically for all buffers. The default value is nil.
    line-number-mode                                                                         Toggle the display, in the mode line, of the current line the cursor is at, preceded by an L. The default value is t.
    menu-bar-mode                                                                            Toggle the display of the Emacs menu bar. The default value is t.
    sunrise-sunset                                                                           Display the time of today's sunrise and sunset for the current geographic location. If preceded with the universal-argument, this function prompts for a specific day.
    tool-bar-mode                                                                            Toggle the display of the Emacs toolbar. The default value is t.
    
    
    
    
    
    
    
    
    Function                                                                                 Description
    customize-changed-options Enter version                                                  Open a new customization buffer for all faces, options, or groups that have been changed since the version of Emacs given by version.
    customize-customized      Open a new customization buffer for all options and faces that have already been customized but haven't been saved to disk.
    customize-face Enter regexp    Open a new customization buffer for all the face, option, or groups relevant to the regular expression given by regexp.
    customize-face Enter face      Open a new customization buffer for the face name given by face.
    customize-group Enter group    Open a new customization buffer for the group name given by group.
    customize-option Enter option  Open a new customization buffer for the option name given by option.
    customize-saved  Open a new customization buffer for all faces and options that you've changed with the Customize function.
    
    
    
    
    
    
    
    Keystroke                                                                       Function        Description
    Tab                                                                                             This command performs command completion if given as part of a command, showing all possible input values for the given command.
    command prefix or keystroke C-h                                                                      This command describes all the possible commands and functions available for the given command prefix or keystroke.
    C-h c keystroke   describe-key-briefly                                                               This command reports in the minibuffer the name of function that keystroke is bound to.
    C-h k keystroke   describe-key                                                                       This command opens a new help-buffer window that describes the function that keystroke is bound to.
    C-h l             view-lossage                                                                       This command opens a new buffer and displays the last 100 characters typed.
        open-dribble-file                                                                                This command opens a specified file and dribbles a copy of all keyboard input to that file.
    
    
    
    
    
    
    
    
    Keystroke                                                                                            Function     Description
                                                                                                         apropos      This command gives a list of apropos commands and variables to a given regexp.
    C-h a regexp                                                                                         command-apropos   This command gives a list of apropos commands to regexp.
    C-h b                                                                                                describe-bindings      This command describes all the valid key bindings for the current major mode in a new help buffer window.
    C-h f function                                                                                       describe-function      This command describes the purpose of function in a new help buffer window.
    C-h v variable                                                                                       describe-variable      This command describes the purpose of variable in a new help buffer window.
    C-h w function                                                                                       where-is               This command describes which keyboard binding (if any) a particular function is bound to.
    
    
    
    
    
    Keystroke                                                                                            Function               Description
    H                                                                                                    Info-help              This command opens a hands-on Info tutorial in a new buffer.
    Q                                                                                                    Info-exit              This command moves to the last buffer you visited, putting the *info* buffer in the end of the buffer list.
    Enter
    or
    B2              This command follows the cross reference at or near point.
    N               Info-next    This command moves to the current node's Next node.
    P               Info-prev    This command moves to the current node's Previous node.
    U               Info-up      This command moves to the current node's Up node.
    D               Info-directory    This command moves to the Directory node.
    L               Info-last         This command moves to the last node you visited.
    T               Info-top-node     This command moves to the Top node of the current document.
    >               Info-final-node   This command moves to the final node pointed to in the current document.
    Spacebar        Info-scroll-up    This command moves forward in the current node by a single screen; if at the end of the node, then move to the Next node.
    Backspace       Info-scroll-down  This command moves backward in the current node by a single screen; if at the beginning of the node, then move to the Previous node.
    B               beginning-of-buffer    This command goes to the beginning of the current node.
    S               Info-search            This command searches forward in the current Info document for a given regexp.
    Tab             Info-next-reference    This command moves the cursor forward to the first cross reference.
    M-Tab           Info-prev-reference    This command moves the cursor backward to the last cross reference.
    
    
    
    
    
    
    
    
    Keystroke       Function               Filename     Description
    C-h C-d         describe-distribution  DISTRIB      Information on obtaining a copy of the latest distribution of the Emacs software
    C-h F           view-emacs-faq         /usr/share/info/emacs-mainversion/efaq.gz    Emacs FAQ
    C-h C-c         describe-copying       COPYING                                      GNU General Public License (GNU GPL)
    C-h C-w         describe-no-warranty   COPYING                                      Section "NO WARRANTY" of the GNU General Public License (GNU GPL)
    C-h n           view-emacs-news        NEWS                                         News concerning the latest changes in the current version of Emacs
    C-h P           view-emacs-problems    PROBLEMS                                     Emacs problems file
    C-h C-p         describe-project       THE-GNU-PROJECT                              Essay by Richard Stallman concerning the founding of the GNU Project
    C-h t           help-with-tutorial     TUTORIAL                                     Hands-on tutorial for learning the basics of Emacs
    
    
    
    
    Keystroke       Function               Description
                    apropos                This command gives a list of apropos commands and variables to a given regexp.
                    open-dribble-file      This command opens a specified file and dribbles a copy of all keyboard input to that file.
    Tab                                    This command performs command completion if given as part of a command, showing all possible input values for the given command.
    command prefix or keystroke C-h             This command describes all possible commands and functions available for the given command prefix or keystroke.
    C-h C-c        describe-copying             This command views the GNU General Public License (GNU GPL).
    C-h C-d        describe-distribution        This command views information on obtaining a copy of the latest distribution of the Emacs software.
    C-h C-p        describe-project             This command views an essay by Richard Stallman concerning the founding of the GNU Project.
    C-h C-w        describe-no-warranty         This command views the "NO WARRANTY" section of the GNU GPL.
    C-h a regexp   command-apropos              This command gives a list of apropos commands to regexp.
    C-h b          describe-bindings            This command describes all valid key bindings for the current major mode in a new help buffer window.
    C-h c keystroke                             describe-key-briefly   This command reports in the minibuffer the name of function that keystroke is bound to.
    C-h F                                       view-emacs-faq         This command views the Emacs FAQ Info document.
    C-h f function                              describe-function      This command describes the purpose of function in a new help buffer window.
    C-h k keystroke                             describe-key           This command opens a new help buffer window that describes the function that keystroke is bound to.
    C-h l                                       view-lossage           This command opens a new buffer, and displays the last 100 characters typed.
    C-h n                                       view-emacs-news        This command views news concerning the latest changes in the current version of Emacs.
    C-h P                                       view-emacs-problems    This command views the Emacs problems file.
    C-h t                                       help-with-tutorial     This command opens a hands-on tutorial for learning the basics of Emacs.
    C-h v variable                              describe-variable      This command describes the purpose of variable in a new help buffer window.
    C-h w function                              where-is               This command describes which keyboard binding (if any) a particular function is bound to.
    



## Emacs Code Browser

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Emacs Code Browse stuff starts
    ;;
    ;; ecb <--- semantic, eieio, speedbar
    ;; semantic <--- eieio, speedbar
    
    
    ;; setting up eieio
    (add-to-list 'load-path "~/.emacs.d/eieio-0.17/")
    
    ;; setting up speedbar
    (add-to-list 'load-path "~/.emacs.d/speedbar-0.14beta4/")
    
    ;; setting up Semantic
    (add-to-list 'load-path "~/.emacs.d/semantic-1.4.4/")
    (setq semantic-load-turn-everything-on t)
    (require 'semantic-load)
    
    ;; setting up ECB
    (setq load-path
          (append (list nil "~/.emacs.d/ecb-2.32/")
                  load-path))
    
    (require 'ecb)
    (require 'ecb-autoloads)
    ;;
    ;; Emacs Code Browse stuff ends
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;; Activate ECB now
    (ecb-activate)
    
