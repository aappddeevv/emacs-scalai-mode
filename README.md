# significant indentation scala mode (scalai)

A mode for editing scala files that contain significant indentation, much like
python. The mode is barebones. All it does is indent/outdent the selection. The
mode does not allow significant indentation to co-exist with braces. Per some of
the last minute changes, you can "cut and paste" brace-oriented code into an
indent file, surround it with braces and it will compile like before. This is
unsupported because it would require blending to modes together and this mode is
exclusively focused on significant indentation.

To change your source code, manually change your sbt scalacOptions to "-rewrite"
and "-new-syntax" (2 separate strings in the options sequence, then "-rewrite",
"-indent". After each scalacOptions change, run `clean` and `compile` to apply
the rewrite.

If someone knows how to blend in the python code into a scala mode, please help
as I only created this mode to fill an immediate need but cannot maintain or
significantly enhance it.

# Setup

In your init.el you can add a package load that forces all `*.scala` files to
use this formatting or you can use it on a per-file basis. dotty requires that
all the sources compiled in a project use the same formatting scheme. If you
want to keep part of your code using the old syntax, put that code in a separate
project.

```lisp
(use-package scalai-mode
  :diminish scalai-mode
  ;; use :pin melpa if you install from melpa
  :pin  melpa
  ;; or place the distribution in ~/.emacs.el/scalai-mode and use :load-path
  :load-path "scalai-mode"
  :mode ("\\.s\\(c\\|scala\\|bt\\)$")
  :init (progn
          (setq
           scalai-indent:use-javadoc-style t
           )
          ;; I have this, you may not want it
          (add-hook 'scalai-mode-hook
                    (lambda ()
                      (show-paren-mode t)
                      (smartparens-mode t)
                      (git-gutter-mode t)
                      (prettify-symbols-mode t)
                      )))
  :bind (
    ))
```

To turn this mode on using a per-file syntax, add this to the top of your
`*.scala` files:

```scala
// -*- mode: scalai -*-
```

# Attribution

The code was taken from http://github.com/ensime/emacs-scala-mode and from the
existing code for emac's python mode.

