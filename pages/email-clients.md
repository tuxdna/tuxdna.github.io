---
layout: page
title: "Email Clients"
description: ""
---

{% include JB/setup %}

# Email Clients

## Text Based Email Clients

Only requirement:

 - confirmant with Maildir?
 - supports email search?
 - can withstand huge amounts of email?

Sup - 

 * has a very nice interface
 * simplet to use
 * UI becomes really slow with lots of messages

Emacs: Gnus, VM, Rmail

 * slow for lots of messages
 * difficult to configure

Alpine apparently doesn't have Maildir support yet. ( I know there is a patch, which I didn't want to apply yet http://www.linuxquestions.org/questions/linux-software-2/alpine-configuration-for-maildir-format-815947/ )

Sup has nice features: fast search, email tagging, email threads etc. But once the mailbox grows huge, the the whole navigation inteface slows down gradually ( probably its Ruby ). 
Emacs (Gnus, VM, Rmail) - the first problem, when email is synchronized the first time, the whole Emacs freezes. I have observed this in other cases, specially when the command you type in minibuffer ( M-x ) does a blocking operation like - connecting to some server etc. Also, I couldn't figure out if there is any support for searching emails fast once they are synced.

Evolution - I've heard is not so secure.

Thunderbird - It's not just an email client. It is an organizer too. It just works! It detects account settings automatically ( for accounts like Gmail, Yahoo etc. ). Only that sometimes, it freezes and throws javascript errors ( just like Firefox does ). 
Has extra features:

 - tasks
 - calendar
 - notification
 - notes

Mutt

 - supports Maildir
 - email threads
 - is FAST!

Enter Mutt + Offline IMAP combo :)


## GUI Email Clients

