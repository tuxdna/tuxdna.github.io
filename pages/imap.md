---
layout: page
title: "IMAP protocol and Mutt"
description: "How to use IMAP in Mutt?"
---

{% include JB/setup %}

# IMAP

## Email clients demystified

IMAP has a default folder. Inside this folder there are sub folders like:

 * INBOX
 * SPAM
 * TRASH
 * FOLDER1 etc.

Every message in a folder has message state information associated with it, which are usually - read, replied to, deleted etc.

Every folder has a set of messages for which we can

 * fetch the count of messages
 * the message ids
 * message headers can be fetched separately
 * message body ( complete text + attachments ) can be fetched separately

Fetching message headers is faster as compared to fetching the whole message body.
Therefore the mail client like Thunderbird and Evolution first fetch the header,
and display the message sender and subject. When we go to a particular, it is 
fetched and displayed thereafter.

Sample code using IMAP protocol: <https://github.com/tuxdna/mymail>

## Maildir:

In Maildir format, a mailbox has three sub-directories: new, cur, tmp

<http://en.wikipedia.org/wiki/Maildir>

## Mutt:

    Set the email's folder
    folder = "~/Mail/"
    
    # list of mailboxes will be filled using source directive
    # which will generated entries like these
    mailboxes = "/path/to/mailbox/to/be/watched"
    
