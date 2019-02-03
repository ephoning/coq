-----------------------------------------------------
key bindings for special chars (from: ~/.coqide-gtk2rc)
(see also: http://library.gnome.org/devel/gtk/unstable/gtk-Resource-Files.html)

<CTRL><SHIFT>a  :  ∀
<CTRL><SHIFT>e  :  ∃
<CTRL><META>e   :  ∄
<CTRL><SHIFT>z  :  →
<CTRL><SHIFT>x  :  ↔
<CTRL><SHIFT>n  :  ⌉

<CTRL><SHIFT>o  :  ∨
<CTRL><SHIFT>p  :  ∧

<CTRL><META>h  :  ≤
<CTRL><META>g  :  ≥
<CTRL><META>n  :  ≠

<CTRL><META>d  :  ⇒
<CTRL><SHIFT>y  :  λ

-----------------------------------------------------
character sets:
note: choose 'italic' to have special chars displayed properly (why?)
good char sets are:
- Bitstream Versa Sans
- Bitstream Vera Serif
- Clean
- Luxi Sans
- Luxi Serif
- Serif

-----------------------------------------------------
cannot currenty print; attempt to print results in error:

Uncaught exception Failure("lexing: empty token")
lpr: Error - stdin is empty, so no job has been sent
-----------------------------------------------------
export to file works
has to change 'Preferences - Externals' setting for coqdoc as follows:
/usr/local/bin/coqdoc -q -g -utf8

so in order to print, just export to file (e.g. html), and print outside of Coqide
-----------------------------------------------------
to use coq IDE (X-windows):
- start X11
- in xterm:
  coqide.opt -I /usr/local/lib/coq/ide&    (<-- get you utf8 char set + key binding for quantifiers)

- or:
  pick from X11 application's menu (shortcut: <shift><apple>B)


-----------------------------------------------------
coq build / install order:
1. ocaml 3.10.2
2. camlp5 5.09 (configure in 'transitional' MODE)
3. lablgtk 2.10.1
4. coq 8.1pl3
source, etc. downloads: see: ~/downloads/coq-stuff

-----------------------------------------------------
configuration
see:
~/.coqiderc
~/.coqide-gtk2rc
~/.coqide.keys
/usr/local/lib/coq/ide/utf8.v
  (also copy in: ~/projects/coq/lib/utf8.v)

-----------------------------------------------------
OBSOLETE

to install coq with ide:
- install macports from http://www.macports.org
- run /opt/local/bin/port:
   $ port install lablgtk2
   $ port install coq

updated:

- put copy of /usr/local/lib/coq/ide/.coqide-gtk2rc in user's home dir
- edit/define key bindings
   note: use <CTRL> and <SHIFT>, etc.
