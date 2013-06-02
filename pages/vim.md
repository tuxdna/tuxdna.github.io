---
layout: page
title: "Vim Editor"
description: "Notes on Vi Editor"
---

{% include JB/setup %}

# Vim plugins:

    taglist
    cvim
    grep

# Vim Shell Integration

# Vim tag list

    First Install exuberant ctags:
    
    $ sudo aptitude install exuberant-ctags
    
    Donwload and install taglist as detailed in here:
    http://vim-taglist.sourceforge.net/installation.html
    
    $ mkdir ~/.vim
    $ cd ~/.vim
    $ wget http://jaist.dl.sourceforge.net/sourceforge/vim-taglist/taglist_45.zip
    $ unzip taglist_45.zip
    $ cd doc/
    $ vim 
    
    Now inside vim ":helptags ."
    
    $ cd ~
    $ vim
    
    Now inside vim ":TlistToggle ."
    
    
    Thats it!
    
