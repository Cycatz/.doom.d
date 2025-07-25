;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)
(package! org-super-agenda)
(package! evil-org)
(package! rotate)
(package! org-roam-ui)
(package! org-super-links
  :recipe (:host github :host github :repo "toshism/org-super-links" :branch "develop"))

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))
;
(package! org-hyperscheduler
  :recipe (:host github :repo "dmitrym0/org-hyperscheduler"))
(package! org-clock-budget
  :recipe (:host github :repo "Fuco1/org-clock-budget" :files ("org-clock-budget.el")))
(package! org-time-budgets
  :recipe (:host github :repo "leoc/org-time-budgets"))


;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; No more 'jk' to switch to the normal mode
(package! evil-escape :disable t)
;; Restore key 's'
(package! evil-snipe :disable t)

;; ref: https://emacs.stackexchange.com/questions/75827/doom-emacs-error-running-hook-global-git-commit-mode-because-void-variable
;; (package! transient :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440")
(package! with-editor :pin "bbc60f68ac190f02da8a100b6fb67cf1c27c53ab")


(package! why-this
        :recipe (:host nil :repo "https://codeberg.org/akib/emacs-why-this.git"))
(package! ox-gfm)


(package! python-black)

(package! zotxt)

(package! org-alert
  :recipe (:host github :repo "spegoraro/org-alert"))

(package! indent-bars
  :recipe (:host github :repo "jdtsmith/indent-bars"))

(package! org-ql)
(package! org-journal-tags)

;; (package! org-roam-ql
;;   :recipe (:host github :repo "ahmed-shariff/org-roam-ql"
;;                          :files (:defaults (:exclude "org-roam-ql-ql.el"))))

(package! vulpea)

(package!  org-table-wrap-functions
  :recipe (:host github :repo "analyticd/org-table-wrap-functions"))

(package! org-caldav)

(package! org-ref)
(package! org-roam-bibtex)
(package! kind-icon)

(package! svelte-mode)


;; Stop using corfu because Interactive Theorem Proving class requires me to use company-coq :)
(package! corfu :disable t)

(package! cook-mode
  :recipe (:host github
            :repo "cooklang/cook-mode"))

;; Wait until the lsp-ltex-ls doesn't crash
(package! lsp-ltex :disable t)
(package! todoist)

(package! org-todoist
  :recipe (:host github
           :repo "lillenne/org-todoist"
           :branch "main"
           :files ("org-todoist.el")))

(package! opam)
;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)
