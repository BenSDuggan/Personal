# Configs and Install for Apps

## emacs

### Install

1. Install GNU Emacs from the Ubuntu store
2. Backup existing emacs dot files
```
mv ~/.emacs ~/.emacs.bk
mv ~/.emacs.d ~/.emacs.d.bk
```
3. Copy the emacs dot files from here
```
cp -r .emacs ~/.emacs
cp -r .emacs.d ~/.emacs.d
```
4. Install Pie by typing `raco pkg install pie` in the terminal
5. Start up emacs

### Includes

Here is what the dot file includes

* Racket mode
* evil mode
* Rainbow theme (using spacemacs-dark)
* Autocomplete brackets
* visible-bell (get rid of sound)

### Usage

* Use LaTeX: `M-x set-input-method`, then `Tex`


