;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Fan Chung"
      user-mail-address "cycatz@staque.xyz")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setq doom-fon t (font-spec :family "Inconsolata" :size 24 :weight 'Regular :width "condensed")
;;       doom-variable-pitch-font (font-spec :family "Manrope" :weight 'normal :size 20))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-to-list '+lookup-provider-url-alist '("Merriam Webster" "https://www.merriam-webster.com/dictionary/%s"))

(setq confirm-kill-emacs nil)

(after! undo-tree
  ;; Enable undo-tree mode
  (global-undo-tree-mode)
  ;; Undo in non-file buffers
  (add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(after! recentf
  (setq
    recentf-save-file (concat user-emacs-directory "recentf")
    recentf-max-saved-items 10000
    recentf-max-menu-items 5000
    )
  ; Save the file list into recentf every 5 minutes:
  (run-at-time nil (* 5 60) 'recentf-save-list))

(defvar --backup-directory (concat (getenv "HOME") "/.emacs.saves"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))    ; don't litter my fs tree
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;; Setting medium weight for "Inconsolata Semibold" doesn't work, it doesn't exist in the list of `describe-font`.
;; (setq doom-font "-CYRE-Inconsolata-semibold-normal-semicondensed-*-24-*-*-*-m-0-iso10646-1")
;; (setq doom-font "-CYRE-Inconsolata-semibold-normal-semicondensed-*-24-*-*-*-m-0-iso10646-1")
;; (setq doom-font "-CYRE-Inconsolata-semibold-normal-semicondensed-*-22-*-*-*-m-0-iso10646-1")
(setq doom-font "-????-Sarasa Term TC-normal-normal-normal-*-20-*-*-*-d-0-iso10646-1")

;; (setq doom-font "-UKWN-JuliaMono-normal-normal-normal-*-20-*-*-*-m-80-iso10646-1")

;; The spacing doesn't work
;; (setq doom-font (font-spec :family "Julia Mono" :size 20 :spacing 90))
(setq doom-variable-pitch-font "-LINO-Helvetica Neue-normal-normal-normal-*-22-*-*-*-*-0-iso10646-1")

(setq doom-modeline-height 1)
(set-face-attribute 'mode-line nil :height 150)
(set-face-attribute 'mode-line-inactive nil :height 150)

;; The CJK characters will not be scaled when scaling in this approach.
;; UPD at 06/06: we just use Sarasa Term, it solves the problem that CJK font do not scale with Ctrl-+ and ctrl--
;; (defun cycatz/set-fonts()
;;   (set-fontset-font t 'unicode (font-spec :family "蘋方-繁" :size 20) nil 'append)
;;   (set-fontset-font t 'cjk-misc (font-spec :family "Noto Sans CJKS TC" :size 20) nil 'append))
;; (add-hook! 'after-setting-font-hook :append 'cycatz/set-fonts)

;; Actually we can append our CJK font into the emoji list, it solves the issue of missing fonts and is able to be scaled.
;; But the default size is too large for me.

(after! yasnippet
    (add-to-list 'yas-snippet-dirs (concat (getenv "HOME") "/Code/Snippets")))

;; Not decent enough, need to come up with a better way
(setq-default default-frame-alist
            (append (list
            '(internal-border-width . 20)
            '(left-fringe    . 0)
            '(right-fringe   . 0)
            '(tool-bar-lines . 0)
            '(menu-bar-lines . 0)
            '(vertical-scroll-bars . nil))))

(setq-default frame-title-format
              '(:eval
                (format "%s: %s %s - Doom Emacs"
                        (file-name-nondirectory server-name)
                        (buffer-name)
                        (cond
                         (buffer-file-truename
                          (concat "(" buffer-file-truename ")"))
                         (dired-directory
                          (concat "{" dired-directory "}"))
                         (t
                          "[no file]")))))

(setq x-stretch-cursor t)   ; Stretch cursor to the glyph width

;; Leader prefixes
(map! :leader
     :desc "M-x"                  "SPC" #'execute-extended-command
     :desc "File file in project" "\\"  #'projectile-find-file)

;; Swap ';' and ":" in evil-motion-state-map
(map! (:after evil
       :m ";" 'evil-ex
       :m ":" 'evil-repeat-find-char))

(map! :map vertico-map
      "C-o" #'embark-act)

(map! :leader
      :desc "Transpose window layout" "wz" #'rotate-layout)

(after! org;
  ; truncate lines
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

  ; Set tab width
  (add-hook 'org-mode-hook (lambda () (setq tab-width 2)))

  ; Set the default path for org-mode
  ; This way we can write relative path in org-capture
  (setq org-directory "~/org")

  ; Display images in-buffer by default
  (setq org-startup-with-inline-images t)
  (setq org-image-actual-width nil)

  ; Set correct color theme and tab in source block like in major mode
  (setq org-src-fontify-natively  t)
  (setq org-src-tab-acts-natively t)

  ;; Do not indent and keep any leading whitespace characters
  ;; It is recommended to edit source block with ~C-c '~
  ;; (setq org-edit-src-content-indentation 0)
  ;; (setq org-src-preserve-indentation   nil)

  ; Record a note when clocking out of an item.
  (setq org-log-note-clock-out t)


  (setq org-highest-priority ?A
        org-default-priority ?C
        org-lowest-priority ?E)


  ;; Force using id when storing links
  (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
  ;; Time stamped UUID
  (setq org-id-method 'ts)
  (setq org-attach-id-to-path-function-list '(org-attach-id-ts-folder-format org-attach-id-uuid-folder-format))
  ;; Override the default config
  (setq org-structure-template-alist
        '(("s" . "src")
          ("l" . "export latex\n")
          ("q" . "quote\n")))
  
  (add-to-list 'org-modules 'org-tempo t)
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("sh" . "src sh"))
  (add-to-list 'org-structure-template-alist '("sc" . "src scala"))
  (add-to-list 'org-structure-template-alist '("bash" . "src bash"))
  (add-to-list 'org-structure-template-alist '("fish" . "src fish"))
  (add-to-list 'org-structure-template-alist '("asm" . "src asm"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
  (add-to-list 'org-structure-template-alist '("json" . "src json"))
  
                                          ; templates for elisp source block
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
                                          ; templates for noweb reference syntax
  (add-to-list 'org-structure-template-alist '("ei" . "src emacs-lisp :noweb no-export"))
  (add-to-list 'org-structure-template-alist '("es" . "src emacs-lisp :tangle no :noweb-ref"))
  
                                          ; templates for C/C++ source block
  (add-to-list 'org-structure-template-alist '("c"  . "src C"))
  (add-to-list 'org-structure-template-alist '("cp" . "src cpp :includes <bits/stdc++.h> :namespaces std"))

  (setq org-journal-dir "~/org/journal/"
        org-journal-date-format "%A, %d %B %Y")

  ;; Refer from: https://orgmode.org/list/8763vfa9hl.fsf@legolas.norang.ca/
  
  (setq org-log-done 'note)
  ; Keywords to the left of the '|' are todo states
  ; Keywords to the right of the '|' are done (completed) states
  ; !: tells org-mode to record a date/time stamp
  ; @: tells org-mode to record a note and a date/time stamp
  ; For example:
  ; b!  : recording a date/time stamp when entering BUG state
  ; w@/!: recording a note and a date/time stamp when entering WAIT state,
  ;       and recording a date/time stamp when leaving WAIT state, too
  (setq org-todo-keywords
    '((sequence "TODO(t)" "DOIN(p!)" "NEXT(n@/!)" "|" "DONE(d@/!)")
        (sequence "WAIT(w@/!)" "|" "CANC(c@!/!)")
        (sequence "ONGOING(o)" "|")
        (sequence "WANT(s/!)" "|")
        (sequence "|" "SUSP(e@!/!)")
        (sequence "BUG(b!)" "KNOWNCAUSE(k)" "|" "FIXED(f!/!)")
        (sequence "DINE(n)" "CHAT(a)" "EMAIL(e)" "MEETING(m)" "|")))
  
  ;; (setq org-todo-keyword-faces
  ;;   '(("TODO"        . (:foreground "red" :weight bold))
  ;;     ("DOIN" . (:foreground "orange" :weight bold))
  ;;     ("NEXT"        . (:foreground "IndianRed3" :weight bold))
  ;;     ("DONE"        . (:foreground "forest green" :weight bold))
  ;;     ("DONE"        . (:foreground "forest green" :weight bold))
  ;;     ("WAIT"     . (:foreground "orange" :weight bold))
  ;;     ("CANC"   . (:foreground "forest green" :weight bold))
  ;;     ("WANT"     . (:foreground "orange" :weight bold))
  ;;     ("SUSP"     . (:foreground "orange" :weight bold))
  ;;     ("BUG"         . (:foreground "red" :weight bold))
  ;;     ("KNOWNCAUSE"  . (:foreground "red" :weight bold))
  ;;     ("FIXED"       . (:foreground "forest green" :weight bold))
  ;;     ("ONGOING"     . (:foreground "orange" :weight bold))))
  
  ;; (setq colors
  ;;   '(("red"    . "#fb4934")
  ;;     ("green"  . "#b8bb26")
  ;;     ("yellow" . "#fabd2f")
  ;;     ("blue"   . "#83a598")
  ;;     ("purple" . "#d3869b")
  ;;     ("aqua"   . "#8ec07c")
  ;;     ("orange" . "#f38019")
  ;;     ("gray" .   "#928374")))
  
  (setq org-todo-keyword-faces
    '(("TODO"        . (:foreground "#fb4934"    :weight bold))       ;; red
      ("DOIN"        . (:foreground "#f38019"    :weight bold))       ;; orange
      ("NEXT"        . (:foreground "IndianRed3" :weight bold))       ;; Indian red
      ("DONE"        . (:foreground "#b8bb26"    :weight bold))       ;; green
      ("WAIT"        . (:foreground "#fabd2f"    :weight bold))       ;; yellow
      ;; WANT to do someday
      ;; Alternatives: TBD., SOON
      ("WANT"        . (:foreground "#fabd2f"    :weight bold))       ;; yellow
      ;; cancelled
      ("CANC"        . (:foreground "#928374"    :weight bold))       ;; gray
      ;; suspended
      ("SUSP"        . (:foreground "#928374"    :weight bold))       ;; gray
      ("BUG"         . (:foreground "#fb4934"    :weight bold))       ;; red
      ("KNOWNCAUSE"  . (:foreground "#fb4934"    :weight bold))       ;; red
      ("FIXED"       . (:foreground "#b8bb26"    :weight bold))       ;; green
      ("ONGOING"     . (:foreground "#fabd2f"    :weight bold))))     ;; yellow
  (add-hook 'org-insert-todo-heading-hook (lambda () (org-set-property "CREATED" (format-time-string (org-time-stamp-format t t)))))
  (setq org-clock-clocktable-default-properties '(:scope subtree :maxlevel 4 :timestamp t :link t :tags t :narrow 36!))
  
  (defun cycatz/org-clock-report-with-tag ()
    (interactive)
    (insert "#+BEGIN: clocktable "
            (string-trim-right (string-trim-left (format "%s" org-clock-clocktable-default-properties) "(") ")")
            " :match \""
            (cycatz/counsel-org-tag-without-action)
            "\"\n#+END")
    (previous-line 1)
    (org-dblock-update))
  
  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;; Change tasks to whatever when clocking in
  (setq org-clock-in-switch-to-state "DOIN")
  ;; use pretty things for the clocktable (this solves the misalignment issue when the title contains CJK characters)
  (setq org-pretty-entities t)
  
  ;; save the clock history across Emacs sessions:
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  
  ;; 2023/01/29: This will result in the capture task being created at 04:00
  ;; I usually sleep before 04:00
  ;; (setq org-extend-today-until 4)

  ;; store new notes at the beginning of a file or entry.
  (setq org-reverse-note-order t)
  
  ;; Empty templates
  (setq org-capture-templates
          '(("i" "inbox" entry (file+headline "inbox.org" "Tasks")
  	         "** TODO %^{Title} %^g \n:PROPERTIES:\n:Created: %U\n:END:\n%?")
            ("n" "note" entry (file+headline "inbox.org" "Notes")
  	         "** %^{Title} %^g \n:PROPERTIES:\n:Created: %U\n:END:\n%?")
  
            ("a" "Agenda")
            ("ae" "event" entry (file+headline "agenda.org" "Event")
  	         "** %^{Title} %^g \n%^T\n:PROPERTIES:\n:Created: %U\n:END:\n%?")
            ("ad" "dine" entry (file+headline "agenda.org" "Dine")
  	         "** %^{Title} %^g \n%^T\n:PROPERTIES:\n:Created: %U\n:PEOPLE: %^{People}\n:LOCATION: %^{Location}\n:END:\n%?")
            ("am" "meeting" entry (file+headline "agenda.org" "Meeting")
  	         "** %^{Title} %^g \n%^T\n:PROPERTIES:\n:Created: %U\n:PEOPLE: %^{People}\n:LOCATION: %^{Location}\n:END:\n%?")
  
            ; Web information
            ("r" "Read/Watch")
            ("ra" "article" entry (file "web/articles.org")
  	         "** TODO %c %^g :article:\n:PROPERTIES:\n:Created: %U\n:END:\n%?")
            ("rb" "book" entry (file "web/books.org")
  	         "** TODO %^{Title} %^g :book:\n:PROPERTIES:\n:Created: %U\n:END:\n%?")
            ("rp" "paper" entry (file "web/paper.org")
  	         "** TODO %c %^g :research:\n:PROPERTIES:\n:Created: %U\n:END:\n%?")
            ("rv" "video" entry (file "web/videos.org")
  	         "** TODO %c %^g :video:\n:PROPERTIES:\n:Created: %U\n:END:\n%?")
  
            ("t" "Tracker")
            ("td" "dine" entry (file+olp+datetree "tracker.org")
  	         "** DINE %^{Title} %^g :dine:\n:PROPERTIES:\n:Created: %U\n:END:\n%?"
             :prepend t :tree-type week)
            ("tc" "chat" entry (file+olp+datetree "tracker.org")
  	         "** CHAT %^{Title} %^g :chat:\n:PROPERTIES:\n:Created: %U\n:END:\n%?"
             :prepend t :tree-type week)
            ("te" "email" entry (file+olp+datetree "tracker.org")
  	         "** EMAIL %^{Title} %^g :mail:\n:PROPERTIES:\n:Created: %U\n:END:\n- ref :: %a\n%?"
             :prepend t :tree-type week)
            ("tf" "chore" entry (file+olp+datetree "tracker.org")
  	         "** DOIN %^{Title} %^g :chore:\n:PROPERTIES:\n:Created: %U\n:END:\n- ref :: %a\n%?"
             :prepend t :tree-type week)
            ("ts" "sport" entry (file+olp+datetree "tracker.org")
  	         "** DOIN %^{Title} %^g :sport:\n:PROPERTIES:\n:Created: %U\n:END:\n- ref :: %a\n%?"
             :prepend t :tree-type week)
            ("ti" "interruption" entry (file+olp+datetree "tracker.org")
  	         "** DOIN %^{Title} %^g :interruption:\n:PROPERTIES:\n:Created: %U\n:END:\n- ref :: %a\n%?"
             :prepend t :tree-type week :clock-in t :clock-keep t)
  
            ;; for org-protcol firefox addon
            ("p" "org protocol" entry (file+headline "web/inbox.org" "Inbox")
                "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
            ("L" "org protocol Link" entry (file+headline "web/inbox.org" "Inbox")
                "* %? [[%:link][%:description]] \nCaptured On: %U")))

  ;; (setq org-agenda-files '((concat org-directory "")
  ;;                         (concat org-directory "/school")))
  
  (setq org-refile-targets '((nil :maxlevel . 3)
                             ("~/org/inbox.org" :maxlevel . 1)
                             ("~/org/agenda.org" :maxlevel . 1)
                             ("~/org/project.org" :maxlevel . 3)
                             ("~/org/todo.org" :maxlevel . 1)
                             ("~/org/tracker.org" :maxlevel . 3)
                             ("~/org/someday.org" :level . 1)))
  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)
  
  ;; Copy from https://emacs.stackexchange.com/a/10762
  (defun org-refile-to-datetree (&optional file)
    "Refile a subtree to a datetree corresponding to it's timestamp.
  
  The current time is used if the entry has no timestamp. If FILE
  is nil, refile in the current file."
    (interactive "f")
    (let* ((datetree-date (or (org-entry-get nil "TIMESTAMP" t)
                              (org-read-date t nil "now")))
           (date (org-date-to-gregorian datetree-date))
           )
      (with-current-buffer (current-buffer)
        (save-excursion
          (org-cut-subtree)
          (if file (find-file file))
          (org-datetree-find-date-create date)
          (org-narrow-to-subtree)
          (show-subtree)
          (org-end-of-subtree t)
          (newline)
          (goto-char (point-max))
          (org-paste-subtree 4)
          (widen)
          ))
      )
    )
  
  (general-define-key "C-c w" 'org-refile-to-datetree)
  
  
  ;; Leaving a link in origin place when refiling
  ;; See https://gist.github.com/samspills/895c29a1c0f6bf2e66c23149bfcc0f38
  ;; Not perfect now, the link of the refiled headline will insert at the end of the headline
  ;; And sometimes the link still uses filename rather than id, don't know why
  (defun cycatz/org-refile--insert-link ( &rest _ )
    (unless (string-suffix-p "inbox.org" buffer-file-name)
      (org-back-to-heading)
      (let* ((refile-region-marker (point-marker))
             (source-link (org-store-link nil)))
        (org-insert-heading)
        (insert source-link)
        (org-super-links-store-link nil)
        (goto-char refile-region-marker)
        (move-end-of-line nil)
        (org-super-links-insert-link)
        (goto-char refile-region-marker))))
  ;; Under testing, don't apply to org-refile directly
  ;; (advice-add 'org-refile
  ;;             :before
  ;;             #'org-refile--insert-link)
  
  (defun cycatz/org-refile-insert-link (&rest args)
    "Insert a link to the current location when refiling, then call org-refile."
    (interactive)
    (cycatz/org-refile--insert-link)
    ;; Call org-refile with the same arguments
    (apply 'org-refile args))
  
  
  ; Global agenda files
  (setq org-agenda-files '("~/org/inbox.org"
                           "~/org/agenda.org"
                           "~/org/project.org"
                           "~/org/todo.org"
                           "~/org/tracker.org"
                           "~/org/someday.org"))
  
  ;; Press enter to go to the link
  (setq org-return-follows-link t)
  
  ;; Always start on the current day.
  (setq org-agenda-start-on-weekday nil)
  
  ;; Default only showing today's agenda
  (setq org-agenda-span 'day)
  (setq org-agenda-start-day "-0d")
  
  ;; Sorting strategy
  (setq org-agenda-sorting-strategy '((agenda time-up category-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep)))
  
  ;; Enable log mode at start
  (setq org-agenda-start-with-log-mode t)
  
  ;; How to create default clocktable
  (setq org-clock-clocktable-default-properties
        '(:scope subtree :maxlevel 4 :timestamp t :link t :tags t :narrow 36!))
  
  ;; How to display default clock report in agenda view
  (setq org-agenda-clockreport-parameter-plist
        '(:scope subtree :maxlevel 4 :timestamp t :link t :tags t :narrow 36!))
  
  (setq org-columns-default-format
     "%40ITEM(Task) %TODO %3PRIORITY %13Effort(Estimated Effort){:} %CLOCKSUM %8TAGS(TAG)")
  
  
  ; Don't show scheduled items in agenda when they are in a DONE state.
  (setq org-agenda-skip-scheduled-if-done t)
  ;;Don't show tasks as scheduled if they are already shown as a deadline
  ; (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
  ; Restore layout after exit from agenda view
  (setq org-agenda-restore-windows-after-quit t)
  
  ;; (setq org-agenda-todo-ignore-deadlines 'past)
  ;; (setq org-agenda-todo-ignore-scheduled 'past)
  
  ; Default showing warnings for deadlines 14 days in advance.
  (setq org-deadline-warning-days 28)
  
  ; open agenda in current window and delete other windows
  ; (setq-default org-agenda-window-setup 'only-window)
  (setq-default org-agenda-window-setup 'reorganize-frame)
  
  (setq org-agenda-prefix-format '((agenda . " %i %-12:c %-6:e %?-12t% s")
                                   (todo . " %i %-12:c %-6:e ")
                                   (tags . " %i %-12:c %-6:e ")
                                   (search . " %i %-12:c %-6:e ")))
  
  (setq org-agenda-time-grid (quote ((daily today remove-watch)
                                     (800 1000 1200 1400 1600 1800 2000 2200 2400)
                                     "......"
                                     "-----------------------------------------------------"
                                     )))
  
  ; Define some custom agenda views
  (defun place-agenda-tags ()
    "Put the agenda tags by the right border of the agenda window."
    (interactive)
    (setq org-agenda-tags-column (- 10 (window-width)))
    (org-agenda-align-tags))
  (add-hook 'org-finalize-agenda-hook 'place-agenda-tags)
  
  ; Copy from https://www.labri.fr/perso/nrougier/GTD/index.html
  (defun gtd-save-org-buffers ()
    "Save `org-agenda-files' buffers without user confirmation.
  See also `org-save-all-org-buffers'"
    (interactive)
    (message "Saving org-agenda-files buffers...")
    (save-some-buffers t (lambda ()
               (when (member (buffer-file-name) org-agenda-files)
                 t)))
    (message "Saving org-agenda-files buffers... done"))
  
  ;; Add it after refile
  (advice-add 'org-refile :after
          (lambda (&rest _)
            (gtd-save-org-buffers)))
  
  
  (advice-add 'org-agenda-clock-in :after 'gtd-save-org-buffers)
  (advice-add 'org-agenda-clock-out :after 'gtd-save-org-buffers)
  )

;; Force using id when storing links
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
;; Time stamped UUID
(setq org-id-method 'ts)
(setq org-attach-id-to-path-function-list '(org-attach-id-ts-folder-format org-attach-id-uuid-folder-format))

(map!
      :after org
      :map org-mode-map
      :prefix "C-c s"
      "s"    #'org-super-links-link
      "l"    #'org-super-links-store-link
      "C-l"  #'org-super-links-insert-link
      "d"    #'org-super-links-quick-insert-drawer-link
      "i"    #'org-super-links-quick-insert-inline-link
      "C-d"  #'org-super-links-delete-link)

;; Refer from: https://orgmode.org/list/8763vfa9hl.fsf@legolas.norang.ca/

(setq org-log-done 'note)
; Keywords to the left of the '|' are todo states
; Keywords to the right of the '|' are done (completed) states
; !: tells org-mode to record a date/time stamp
; @: tells org-mode to record a note and a date/time stamp
; For example:
; b!  : recording a date/time stamp when entering BUG state
; w@/!: recording a note and a date/time stamp when entering WAIT state,
;       and recording a date/time stamp when leaving WAIT state, too
(setq org-todo-keywords
  '((sequence "TODO(t)" "DOIN(p!)" "NEXT(n@/!)" "|" "DONE(d@/!)")
      (sequence "WAIT(w@/!)" "|" "CANC(c@!/!)")
      (sequence "ONGOING(o)" "|")
      (sequence "WANT(s/!)" "|")
      (sequence "|" "SUSP(e@!/!)")
      (sequence "BUG(b!)" "KNOWNCAUSE(k)" "|" "FIXED(f!/!)")
      (sequence "DINE(n)" "CHAT(a)" "EMAIL(e)" "MEETING(m)" "|")))

;; (setq org-todo-keyword-faces
;;   '(("TODO"        . (:foreground "red" :weight bold))
;;     ("DOIN" . (:foreground "orange" :weight bold))
;;     ("NEXT"        . (:foreground "IndianRed3" :weight bold))
;;     ("DONE"        . (:foreground "forest green" :weight bold))
;;     ("DONE"        . (:foreground "forest green" :weight bold))
;;     ("WAIT"     . (:foreground "orange" :weight bold))
;;     ("CANC"   . (:foreground "forest green" :weight bold))
;;     ("WANT"     . (:foreground "orange" :weight bold))
;;     ("SUSP"     . (:foreground "orange" :weight bold))
;;     ("BUG"         . (:foreground "red" :weight bold))
;;     ("KNOWNCAUSE"  . (:foreground "red" :weight bold))
;;     ("FIXED"       . (:foreground "forest green" :weight bold))
;;     ("ONGOING"     . (:foreground "orange" :weight bold))))

;; (setq colors
;;   '(("red"    . "#fb4934")
;;     ("green"  . "#b8bb26")
;;     ("yellow" . "#fabd2f")
;;     ("blue"   . "#83a598")
;;     ("purple" . "#d3869b")
;;     ("aqua"   . "#8ec07c")
;;     ("orange" . "#f38019")
;;     ("gray" .   "#928374")))

(setq org-todo-keyword-faces
  '(("TODO"        . (:foreground "#fb4934"    :weight bold))       ;; red
    ("DOIN"        . (:foreground "#f38019"    :weight bold))       ;; orange
    ("NEXT"        . (:foreground "IndianRed3" :weight bold))       ;; Indian red
    ("DONE"        . (:foreground "#b8bb26"    :weight bold))       ;; green
    ("WAIT"        . (:foreground "#fabd2f"    :weight bold))       ;; yellow
    ;; WANT to do someday
    ;; Alternatives: TBD., SOON
    ("WANT"        . (:foreground "#fabd2f"    :weight bold))       ;; yellow
    ;; cancelled
    ("CANC"        . (:foreground "#928374"    :weight bold))       ;; gray
    ;; suspended
    ("SUSP"        . (:foreground "#928374"    :weight bold))       ;; gray
    ("BUG"         . (:foreground "#fb4934"    :weight bold))       ;; red
    ("KNOWNCAUSE"  . (:foreground "#fb4934"    :weight bold))       ;; red
    ("FIXED"       . (:foreground "#b8bb26"    :weight bold))       ;; green
    ("ONGOING"     . (:foreground "#fabd2f"    :weight bold))))     ;; yellow

(add-hook 'org-insert-todo-heading-hook (lambda () (org-set-property "CREATED" (format-time-string (org-time-stamp-format t t)))))

;; (setq org-agenda-files '((concat org-directory "")
;;                         (concat org-directory "/school")))

(setq org-refile-targets '((nil :maxlevel . 3)
                           ("~/org/inbox.org" :maxlevel . 1)
                           ("~/org/agenda.org" :maxlevel . 1)
                           ("~/org/project.org" :maxlevel . 3)
                           ("~/org/todo.org" :maxlevel . 1)
                           ("~/org/tracker.org" :maxlevel . 3)
                           ("~/org/someday.org" :level . 1)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)

;; Copy from https://emacs.stackexchange.com/a/10762
(defun org-refile-to-datetree (&optional file)
  "Refile a subtree to a datetree corresponding to it's timestamp.

The current time is used if the entry has no timestamp. If FILE
is nil, refile in the current file."
  (interactive "f")
  (let* ((datetree-date (or (org-entry-get nil "TIMESTAMP" t)
                            (org-read-date t nil "now")))
         (date (org-date-to-gregorian datetree-date))
         )
    (with-current-buffer (current-buffer)
      (save-excursion
        (org-cut-subtree)
        (if file (find-file file))
        (org-datetree-find-date-create date)
        (org-narrow-to-subtree)
        (show-subtree)
        (org-end-of-subtree t)
        (newline)
        (goto-char (point-max))
        (org-paste-subtree 4)
        (widen)
        ))
    )
  )

(general-define-key "C-c w" 'org-refile-to-datetree)


;; Leaving a link in origin place when refiling
;; See https://gist.github.com/samspills/895c29a1c0f6bf2e66c23149bfcc0f38
;; Not perfect now, the link of the refiled headline will insert at the end of the headline
;; And sometimes the link still uses filename rather than id, don't know why
(defun cycatz/org-refile--insert-link ( &rest _ )
  (unless (string-suffix-p "inbox.org" buffer-file-name)
    (org-back-to-heading)
    (let* ((refile-region-marker (point-marker))
           (source-link (org-store-link nil)))
      (org-insert-heading)
      (insert source-link)
      (org-super-links-store-link nil)
      (goto-char refile-region-marker)
      (move-end-of-line nil)
      (org-super-links-insert-link)
      (goto-char refile-region-marker))))
;; Under testing, don't apply to org-refile directly
;; (advice-add 'org-refile
;;             :before
;;             #'org-refile--insert-link)

(defun cycatz/org-refile-insert-link (&rest args)
  "Insert a link to the current location when refiling, then call org-refile."
  (interactive)
  (cycatz/org-refile--insert-link)
  ;; Call org-refile with the same arguments
  (apply 'org-refile args))


; Global agenda files
(setq org-agenda-files '("~/org/inbox.org"
                         "~/org/agenda.org"
                         "~/org/project.org"
                         "~/org/todo.org"
                         "~/org/tracker.org"
                         "~/org/someday.org"))

;; Press enter to go to the link
(setq org-return-follows-link t)

;; Always start on the current day.
(setq org-agenda-start-on-weekday nil)

;; Default only showing today's agenda
(setq org-agenda-span 'day)
(setq org-agenda-start-day "-0d")

;; Sorting strategy
(setq org-agenda-sorting-strategy '((agenda time-up category-up priority-down)
  (todo priority-down category-keep)
  (tags priority-down category-keep)
  (search category-keep)))

;; Enable log mode at start
(setq org-agenda-start-with-log-mode t)

;; How to create default clocktable
(setq org-clock-clocktable-default-properties
      '(:scope subtree :maxlevel 4 :timestamp t :link t :tags t :narrow 36!))

;; How to display default clock report in agenda view
(setq org-agenda-clockreport-parameter-plist
      '(:scope subtree :maxlevel 4 :timestamp t :link t :tags t :narrow 36!))

(setq org-columns-default-format
   "%40ITEM(Task) %TODO %3PRIORITY %13Effort(Estimated Effort){:} %CLOCKSUM %8TAGS(TAG)")


; Don't show scheduled items in agenda when they are in a DONE state.
(setq org-agenda-skip-scheduled-if-done t)
;;Don't show tasks as scheduled if they are already shown as a deadline
; (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
; Restore layout after exit from agenda view
(setq org-agenda-restore-windows-after-quit t)

;; (setq org-agenda-todo-ignore-deadlines 'past)
;; (setq org-agenda-todo-ignore-scheduled 'past)

; Default showing warnings for deadlines 14 days in advance.
(setq org-deadline-warning-days 28)

; open agenda in current window and delete other windows
; (setq-default org-agenda-window-setup 'only-window)
(setq-default org-agenda-window-setup 'reorganize-frame)

(setq org-agenda-prefix-format '((agenda . " %i %-12:c %-6:e %?-12t% s")
                                 (todo . " %i %-12:c %-6:e ")
                                 (tags . " %i %-12:c %-6:e ")
                                 (search . " %i %-12:c %-6:e ")))

(setq org-agenda-time-grid (quote ((daily today remove-watch)
                                   (800 1000 1200 1400 1600 1800 2000 2200 2400)
                                   "......"
                                   "-----------------------------------------------------"
                                   )))

; Define some custom agenda views
(defun place-agenda-tags ()
  "Put the agenda tags by the right border of the agenda window."
  (interactive)
  (setq org-agenda-tags-column (- 10 (window-width)))
  (org-agenda-align-tags))
(add-hook 'org-finalize-agenda-hook 'place-agenda-tags)

; Copy from https://www.labri.fr/perso/nrougier/GTD/index.html
(defun gtd-save-org-buffers ()
  "Save `org-agenda-files' buffers without user confirmation.
See also `org-save-all-org-buffers'"
  (interactive)
  (message "Saving org-agenda-files buffers...")
  (save-some-buffers t (lambda ()
             (when (member (buffer-file-name) org-agenda-files)
               t)))
  (message "Saving org-agenda-files buffers... done"))

;; Add it after refile
(advice-add 'org-refile :after
        (lambda (&rest _)
          (gtd-save-org-buffers)))


(advice-add 'org-agenda-clock-in :after 'gtd-save-org-buffers)
(advice-add 'org-agenda-clock-out :after 'gtd-save-org-buffers)

;; Clear org-super-agenda map
(after! org-super-agenda
  (setq org-super-agenda-header-map (make-sparse-keymap)))

(after! org-agenda
  (org-super-agenda-mode t))

(after! org-super-agenda
  (setq org-agenda-custom-commands
          '(("v" "Agenda day view"
            (
              (agenda ""
                (
                  (org-agenda-span 'day)
                  (org-deadline-warning-days 14)
                  (org-super-agenda-groups
                    '((:name "Today"
                            :time-grid t
                            ;; Aready set org-agenda-span to "day"
                            ;; :date today
                            :order 0)
                      (:name "Overdue" :deadline past :order 1)
                      (:name "Due Today" :deadline today :order 2)
                      (:name "Important"
                              :and (:priority "A" :not (:todo ("DONE" "CANC" "FIXED" "SUSP")))
                              :order 3)
                      (:name "Due Soon" :deadline future :order 4)
                      (:name "Todo" :not (:habit t) :order 5)
                      (:name "Habits" :habit t :order 6))
                    )
                )
              )
              (alltodo ""
                (
                  (org-agenda-overriding-header "") ;; Don't insert default headers
                  (org-super-agenda-groups
                    '((:name "All todos" :and (:not(:todo "WAIT") :not (:habit t))) ; Filter out habits
                      (:name "Waiting" :todo "WAIT")
                      (:discard (:anything t))))
                )
              )
              (tags "CLOSED>=\"<today>\""
                (
                  (org-agenda-overriding-header "") ;; Don't insert default headers
                  (org-super-agenda-groups
                    '((:name "Completed Today" :anything t))
                      )
                )
              )
              (tags "CLOSED>=\"<-7d>\""
                (
                  (org-agenda-overriding-header "") ;; Don't insert default headers
                  (org-super-agenda-groups
                    '((:name "Completed this week" :anything t))
                      )
                )
              )
            )
            (
              (org-agenda-compact-blocks t)
              (org-agenda-files '("~/org/inbox.org"
                                  "~/org/todo.org"
                                  "~/org/agenda.org"))
            )
        )

          ("w" "Agenda week view"
            (
              (agenda ""
                (
                  (org-agenda-span 'week)
                  (org-agenda-skip-scheduled-if-done t)
                  (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                  (org-deadline-warning-days 14)
                  (org-agenda-use-time-grid nil)
                  (org-habit-show-habits nil)
                  (org-super-agenda-groups
                    '((:name "Overdue" :deadline past :order 1)
                      (:name "Due Today" :deadline today :order 2)
                      (:name "Important"
                              :and (:priority "A" :not (:todo ("DONE" "CANC" "FIXED" "SUSP")))
                              :order 3)
                      (:name "Due Soon" :deadline future :order 4)
                      (:name "Todo" :not (:habit t) :order 5))
                    )
                )
              )
            )
            (
              (org-agenda-compact-blocks t)
              (org-agenda-files '("~/org/inbox.org"
                                  "~/org/todo.org"
                                  "~/org/agenda.org"))
            )
        )
        ;; Match all headlines
        ("r" "Readings (org-super-agenda)" tags "*"
          (
            (org-agenda-files '("~/org/web/articles.org"
                                "~/org/web/books.org"
                                "~/org/web/videos.org"
                                "~/org/web/paper.org"))
            (org-agenda-overriding-header "") ;; Don't insert default headers
            (org-super-agenda-groups
              '(
                (:name "Reading" :todo "DOIN" :order 0)
                (:name "To be read" :order 1 :not (:todo ("DONE" "CANC")))
                (:name "Done" :order 2 :todo ("DONE"))
                (:discard (:anything t))
                )
            )
          )
        )
         ("d" "Done tasks (org-super-agenda)" tags "/DONE|CANC"
            (org-super-agenda-groups nil)
         )


        ("o" "Someday (org-super-agenda)"
          (
            (alltodo "")
          )
          (
            (org-agenda-files '("~/org/someday.org"))
            (org-super-agenda-groups nil)
          )
        )
        ("D" "Upcoming deadlines (org-super-agenda)" agenda ""
          (
            (org-agenda-time-grid nil)
            (org-deadline-warning-days 365)
            (org-agenda-entry-types '(:deadline))
            (org-super-agenda-groups
              '((:name "Overdue" :deadline past :order 0)
                (:name "Due Today" :deadline today :order 1)
                (:name "Due Soon" :deadline future :order 2)
                ))
          )
        ))))

(after! org-habit
  (setq org-habit-graph-column 65)
  (setq org-habit-show-all-today nil)
  (setq org-habit-today-glyph ?.)
  (setq org-habit-completed-glyph ?v))

(setq org-clock-clocktable-default-properties '(:scope subtree :maxlevel 4 :timestamp t :link t :tags t :narrow 36!))

(defun cycatz/org-clock-report-with-tag ()
  (interactive)
  (insert "#+BEGIN: clocktable "
          (string-trim-right (string-trim-left (format "%s" org-clock-clocktable-default-properties) "(") ")")
          " :match \""
          (cycatz/counsel-org-tag-without-action)
          "\"\n#+END")
  (previous-line 1)
  (org-dblock-update))

;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Change tasks to whatever when clocking in
(setq org-clock-in-switch-to-state "DOIN")
;; use pretty things for the clocktable (this solves the misalignment issue when the title contains CJK characters)
(setq org-pretty-entities t)

;; save the clock history across Emacs sessions:
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; 2023/01/29: This will result in the capture task being created at 04:00
;; I usually sleep before 04:00
;; (setq org-extend-today-until 4)

;; Override the default config
(setq org-structure-template-alist
      '(("s" . "src")
        ("l" . "export latex\n")
        ("q" . "quote\n")))

(add-to-list 'org-modules 'org-tempo t)
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("sc" . "src scala"))
(add-to-list 'org-structure-template-alist '("bash" . "src bash"))
(add-to-list 'org-structure-template-alist '("fish" . "src fish"))
(add-to-list 'org-structure-template-alist '("asm" . "src asm"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
(add-to-list 'org-structure-template-alist '("json" . "src json"))

                                        ; templates for elisp source block
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
                                        ; templates for noweb reference syntax
(add-to-list 'org-structure-template-alist '("ei" . "src emacs-lisp :noweb no-export"))
(add-to-list 'org-structure-template-alist '("es" . "src emacs-lisp :tangle no :noweb-ref"))

                                        ; templates for C/C++ source block
(add-to-list 'org-structure-template-alist '("c"  . "src C"))
(add-to-list 'org-structure-template-alist '("cp" . "src cpp :includes <bits/stdc++.h> :namespaces std"))

(map! :after org
      :map org-mode-map
      :localleader
      "s" #'org-insert-structure-template)

(after! org-roam
  (setq org-roam-directory "~/org-roam")
  (setq org-roam-node-display-template (concat "${title:*} "
                                                  (propertize "${tags:30}" 'face 'org-tag))))

(setq org-journal-dir "~/org/journal/"
      org-journal-date-format "%A, %d %B %Y")

(map! :after org
      :map doom-leader-note-map
      "jJ" #'org-journal-new-date-entry)

(map! :after org
      :map org-mode-map
      :localleader
      "jb" 'org-beamer-export-to-pdf)

(after! ox-latex
  (setq org-latex-pdf-process
        '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
   (add-to-list 'org-latex-classes
                '("org-plain-latex"
                  "\\documentclass{article}
              [NO-DEFAULT-PACKAGES]
              [PACKAGES]
              [EXTRA]"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  ; Beamer
  (add-to-list 'org-latex-classes
               '("beamer"
                 "\\documentclass[presentation]{beamer}
             [NO-DEFAULT-PACKAGES]
             [PACKAGES]
             [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

   ; Cheatsheet
   (add-to-list 'org-latex-classes
                '("cheatsheet"
                  "\\documentclass{article}
              [NO-DEFAULT-PACKAGES]
              [PACKAGES]
              [EXTRA]"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  ; ; Code highlighting
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-listings 'minted)
  (setq org-latex-minted-options
        '(;;("frame" "lines")
          ("breaklines" "true")
          ("breakanywhere" "true")
          ("linenos" "")
          ("fontsize" "\\footnotesize")
          ("mathescape" "")
          ("samepage" "")
          ("xrightmargin" "0.5cm")
          ("xleftmargin"  "0.5cm")
          ))

  (setq org-export-in-background t)
  (setq org-latex-create-formula-image-program 'imagemagick)

  ; Clean up intermediate files after pdf is produced
  (setq org-latex-remove-logfiles t)
  (setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))

  ; You can also include your own package to insert custom code
  ; (add-to-list 'org-latex-packages-alist '("" "examplepackage"))
 )

(map! :after org
      :map org-mode-map
      :localleader
      "je" 'org-latex-export-to-pdf)

(after! org-superstar
  (setq org-superstar-headline-bullets-list '("◉" "○" "●" "◈" "◇")))

(after! org-download
  (setq org-download-method 'directory
        org-download-image-dir "~/photos/emacs"
        org-download-screenshot-method "flameshot gui --raw > %s"
        org-download-image-org-width 600
        org-download-heading-lvl 1))

(after! org-fancy-priorities
  ; (setq org-fancy-priorities-list '("❗" "⚠️" "⚑" "⬆" "⬇" "■" "☕")
  (setq org-fancy-priorities-list '("[#A]" "[#B]" "[#C]" "[#D]" "[#E]")))

(after! org
  (set-company-backend! 'org-mode
    'company-files 'company-tempo))

(use-package! org-clock-budget
  :config
  (setq org-clock-budget-intervals
    ;; Calculate from the installation day
    '(("BUDGET_SEM" (lambda() (cons (format-time-string "%Y-02-14 00:00:00") (format-time-string "%Y-05-12 23:59:59"))))
      ("BUDGET_WEEK" org-clock-budget-interval-this-week)))
  (setq org-clock-budget-daily-budgetable-hours 11))

(after! org-roam-ui
   (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(after! company
  (setq company-tempo-expand t)
  ;; Excluded file and dirs in company-files backend
  (setq company-files-exclusions '(".git/" ".stversions/" ".stfolder/" ".DS_Store"))
  ; Make completions Case-sensitive
  (setq company-dabbrev-downcase nil))

;; LSP
;; Clang
(setq lsp-clients-clangd-args '("-j=4"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! ccls
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
  (set-lsp-priority! 'ccls 0))
(setq ccls-executable "/usr/bin/ccls")
(setq ccls-args '("--log-file=/tmp/ccls.log"))

(after! cc-mode
  (setq-hook! 'cc-mode-hook tab-width 4 c-basic-offset 4))

(after! tramp
  (when (require 'lsp-mode nil t)

    (setq lsp-enable-snippet nil
          lsp-log-io nil
          ;; To bypass the "lsp--document-highlight fails if
          ;; textDocument/documentHighlight is not supported" error
          lsp-enable-symbol-highlighting nil)

    (lsp-register-client
     (make-lsp-client
      :new-connection
      (lsp-tramp-connection "/usr/bin/ccls")
       ; (lambda ()
       ;   (cons "clangd" ; executable name on remote machine 'ccls'
       ;         lsp-clients-clangd-args)))
      :major-modes '(c-mode c++-mode objc-mode cuda-mode)
      :remote? t
      :server-id 'ccls))))

(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))



(defun cycatz/copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'"
  (interactive)
  (let ((path-with-line-number
         (concat "[[" (buffer-file-name) "::" (number-to-string (line-number-at-pos)) "]]")))
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))
(map!
  "M-c" 'cycatz/copy-current-line-position-to-clipboard)

(defun modi/org-in-any-block-p ()
      "Return non-nil if the point is in any Org block.
The Org block can be *any*: src, example, verse, etc., even any
Org Special block.
This function is heavily adapted from `org-between-regexps-p'."
      (save-match-data
        (let ((pos (point))
              (case-fold-search t)
              (block-begin-re "^[[:blank:]]*#\\+begin_\\(?1:.+?\\)\\(?: .*\\)*$")
              (limit-up (save-excursion (outline-previous-heading)))
              (limit-down (save-excursion (outline-next-heading)))
              beg end)
          (save-excursion
            ;; Point is on a block when on BLOCK-BEGIN-RE or if
            ;; BLOCK-BEGIN-RE can be found before it...
            (and (or (org-in-regexp block-begin-re)
                     (re-search-backward block-begin-re limit-up :noerror))
                 (setq beg (match-beginning 0))
                 ;; ... and BLOCK-END-RE after it...
                 (let ((block-end-re (concat "^[[:blank:]]*#\\+end_"
                                             (match-string-no-properties 1)
                                             "\\( .*\\)*$")))
                   (goto-char (match-end 0))
                   (re-search-forward block-end-re limit-down :noerror))
                 (> (setq end (match-end 0)) pos)
                 ;; ... without another BLOCK-BEGIN-RE in-between.
                 (goto-char (match-beginning 0))
                 (not (re-search-backward block-begin-re (1+ beg) :noerror))
                 ;; Return value.
                 (cons beg end))))))

    (defun modi/org-split-block ()
;;   "Sensibly split the current Org block at point.
;; (1) Point in-between a line
;;     #+begin_src emacs-lisp             #+begin_src emacs-lisp
;;     (message▮ \"one\")                   (message \"one\")
;;     (message \"two\")          -->       #+end_src
;;                                        ▮
;;                                        #+begin_src emacs-lisp
;;                                        (message \"two\")
;;                                        #+end_src
;; (2) Point at EOL
;;     #+begin_src emacs-lisp             #+begin_src emacs-lisp
;;     (message \"one\")▮                   (message \"one\")
;;     (message \"two\")          -->       #+end_src
;;     #+end_src                          ▮
;;                                        #+begin_src emacs-lisp
;;                                        (message \"two\")
;;                                        #+end_src
;; (3) Point at BOL
;;     #+begin_src emacs-lisp             #+begin_src emacs-lisp
;;     (message \"one\")                    (message \"one\")
;;     ▮(message \"two\")          -->      #+end_src
;;     #+end_src                          ▮
;;                                        #+begin_src emacs-lisp
;;                                        (message \"two\")
;;                                        #+end_src
;; "
      (interactive)
      (if (modi/org-in-any-block-p)
          (save-match-data
            (save-restriction
              (widen)
              (let ((case-fold-search t)
                    (at-bol (bolp))
                    block-start
                    block-end)
                (save-excursion
                  (re-search-backward "^\\(?1:[[:blank:]]*#\\+begin_.+?\\)\\(?: .*\\)*$" nil nil 1)
                  (setq block-start (match-string-no-properties 0))
                  (setq block-end (replace-regexp-in-string
                                   "begin_" "end_" ;Replaces "begin_" with "end_", "BEGIN_" with "END_"
                                   (match-string-no-properties 1))))
                ;; Go to the end of current line, if not at the BOL
                (unless at-bol
                  (end-of-line 1))
                (insert (concat (if at-bol "" "\n")
                                block-end
                                "\n\n"
                                block-start
                                (if at-bol "\n" "")))
                ;; Go to the line before the inserted "#+begin_ .." line
                (beginning-of-line (if at-bol -1 0)))))
        (message "Point is not in an Org block")))

    (defun modi/org-meta-return (&optional arg)
      "Insert a new heading or wrap a region in a table.
Calls `org-insert-heading', `org-insert-item',
`org-table-wrap-region', or `modi/org-split-block' depending on
context.  When called with an argument, unconditionally call
`org-insert-heading'."
      (interactive "P")
      (org-check-before-invisible-edit 'insert)
      (or (run-hook-with-args-until-success 'org-metareturn-hook)
          (call-interactively (cond (arg #'org-insert-heading)
                                    ((org-at-table-p) #'org-table-wrap-region)
                                    ((org-in-item-p) #'org-insert-item)
                                    ((modi/org-in-any-block-p) #'modi/org-split-block)
                                    (t #'org-insert-heading)))))
    (advice-add 'org-meta-return :override #'modi/org-meta-return)

(use-package! python-black
  :demand t
  :after python
  :config
  ;; (add-hook! 'python-mode-hook #'python-black-on-save-mode)
  ;; Feel free to throw your own personal keybindings here
  (map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
  (map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
  (map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement)
)
