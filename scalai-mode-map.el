;;; scalai-mode:map.el - Major mode for editing scala, keyboard map
;;; Copyright (c) 2012 Heikki Vesalainen
;;; For information on the License, see the LICENSE file

(require 'scalai-mode-indent)

(defvar scalai-mode-map
  (let ((map (make-sparse-keymap)))
    ;;(set-keymap-parent map prog-mode-map)
    ;;(substitute-key-definition 'delete-indentation 'scala-indent:join-line map global-map)
    ;; \C-c< does not seem to work !?!?
    (define-key map "\C-c<" 'scalai-indent:shift-left)
    (define-key map "\C-c>" 'scalai-indent:shift-right)
    (define-key map (kbd "C-c C-l") 'scalai-indent:shift-left)
    (define-key map (kbd "C-c C-r") 'scalai-indent:shift-right)
    ;; these are not working yet
    (define-key map "\177" 'scalai-indent:dedent-line-backspace)
    (define-key map (kbd "<backtab>") 'scalai-indent:dedent-line)    
    map)
  "Local key map used for scala mode")


(defun scalai-mode-map:add-self-insert-hooks ()
  ;; (add-hook 'post-self-insert-hook
  ;;           'scala-indent:indent-on-parentheses)
  ;; (add-hook 'post-self-insert-hook
  ;;           'scala-indent:indent-on-special-words)
  ;; (add-hook 'post-self-insert-hook
  ;;           'scala-indent:indent-on-scaladoc-asterisk)
  ;; (add-hook 'post-self-insert-hook
  ;;           'scala-indent:fix-scaladoc-close)
  )

(defun scalai-mode-map:add-remove-indent-hook ()
  (add-hook 'post-command-hook
            'scala-indent:remove-indent-from-previous-empty-line))

(provide 'scalai-mode-map)


