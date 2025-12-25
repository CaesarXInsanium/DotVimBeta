# Vim Notes

Currently on 5.7 in manual

I will now be trying to master the vim text editor for real now. I think I
should not try and

I did not that the current buffer can be printed. It will render it that same way
as the vim editor itself

There might be a new version of this doc with Neovim Specific stuff

```text
:TOhtml
```

```
# move to new buffer
:w filepath
# open file in browser
# print
```

`:hardcopy` works if PostScript printer is found

Right not my biggest question is wether or not I can create a vim configuration
that is easily reproducable in neovim.

## Help

useful help topics

**bold text**

- deleting
- index
- eval.txt: learn about vimscript
- function-list:
- options
  - `:help 'number'`

it is possible to get help with builtin key binding

```
# this will do so for normal mode binding
:help CTRL-f
# help with binding in insert mode
:help i_CTRL_H
```

### Help

- "C-]" jump to tag, topic, from help link
- "C-o" jump back in history
- "C-t" will go back one node

If somehow errors are found

```text
:help E297
```

## Insert Mode

Deletion will only work in insert mode up to the point of the start of the insert
mode status. Where we first started inserting. Will not go further than that.

Here are some good help locations

- backspace
- autoindent
- nocompatible
- eol
- start

### Completion

While in insert mode, one has the option to trigger completion by one of two ways.

"C-n" will trigger keyword completion and search the current buffer for matches
for the current word selected by the user.

One can also hit "C-x" to enter a mode to select new forms for completion.
It continues by then selecting another key combo. The ones list in `ins-complete`
are not the whole extent but simple that most interesting to me.

- "C-e" cancel completion
- "C-o" omnicompletion
- "C-n" search forward keywords
- "C-p" search backwards keywords
- "C-l" dictionary
- "C-t" thesaurus
- "C-]" ctags
- "C-f" file names /home/cxi/Projects
- "C-d" will select and write out the completion. Help topics include `insert` `omnifunc` `complete` `tags` ## Viewing
It is possible to open files in read-only mode

From Command line

```sh
vim -R file
```

### Windows and Splits

`:split` command will open horizontal split by default with current buffer.
Can also pass other files as arugments to open them in split.

`:close` will close split without quitting vim.

`:only` will close all windows except focused window

## Editing

In general there are two types of keys. Movement and action. Generally we can chain
movements and then actions to peform on the correspinding movement. Operator-motion
pattern.

```text
'dw' will delete a word
'd$' will delete from cursor to end of line
'dG' delete until end of file
```

'c' key will delete across a motion and then leave in insert mode.
"c2wbe<Esc>" will change, across 2 words, enter insert mode tybe "be" and then escape.
It should be same to change this key to something else.

- "dd" delete line, "cc" delete line and enter insert mode
- "C" delete until end of line and enter insert
- "s" delete one character and enter insert mode

"." will repeat the last command

When deleting text with "d", we can paste the results else where with "p".
"P" will paste just before the cursor.

See the following help docs

- `:help operator`
- `:help tildeop`

It is possible to append contents of edited file to another with command like
`:write >> logfile`

### Saving a File

it is possible to write changes to new file, `:saveas newname.c`. Original will
still be around in order to compare.

### Text Objects

with the "a" key it is possible to operate on text objects

- "daw" will delete the word the cursor is on, regardless of exact position
- "cis" will delete `c`, the text object `i`, `s` a sentence
  delete the current sentence and enter insert mode

### Replace Mode

`R` will enter replace mode where each char type will overwrite the next characters.

- backspace will 'undo' the replacement.
- after overriting characters is reached then the next chars will be added after
  wards

## Visual Mode

With visual mode it is possible to select a region of text and perform operations
on text. "V" will start selecting lines.

Editing in rectable regions is possible with "C-v". Used for editing tables.

## Keys

### Yanking

"y" will yank the current motion. "yw" will yank the next word.

- "Y", "yy" will yank the whole line.
- "z$" yank to end of file.

In order to use system clipboard preprend `"*` to commands, tick and quote mark.
This refers to the system clipboard register. It works in wayland

- `"*yw` will yank word to system clipboard
- `"*p` will paste from system clipboard

- see `:help registers`
- `clipboard`

### Normal Mode Stuff

I will try and focus on things that I did not previously know

Remember that prepending a number before a command will repeat x number of times.

- "J" will join lines, delete the newline
  - sdassad
    sdasdas
- "u" undoes a thing
  - "<C->r" will redo the thing
  - "U" will undo all changes to line
- "o" will inser line below and goto it, "O" will do the same above
- "xp" swap to characters next to each other. deletes character, then paste it after
  the cursor, in this case it moved to next character

### Movement

Generic Notes

- "ge" previes end of word
- "gE" will consider only whitespace delimited word as words
- "W" will only consider whitespace
- "^" start of line
- "$" end of line
- "%" matching delimeter ()

"f<char>" command will search until it find the specified char. "fa" will go forward
until an a is found. Limited by the fact that you have to cound homar times a letter
appears until your target. "F" wills search backwards

Moving Around Pages in Text File

I dont like any of these bindings

- "C-f" move forward on page, "C-b" backwards
- "C-d" half a page forward, "C-u" backwards
- "C-e" scroll down one line, "C-y" backwards
- i dont like these bindings
- "H" will move cursor to top of view
- "M" middle
- "L" Bottom

### Marks

We can jump backwards and forwards because both of these are jumps. Jump is any
movement that goes accross lines. A history will be saved.

- "G" will move to specified line.
- `\` (double ticks) will go back from where we came from
- "C-o" can go back older positions, don't go back too far

":jumps" command will give history of marks

Named marks will be created with "m<char>". "ma" will set mark named a.

We can move there with "'<char>". "'a" will go to mark a.

":marks" will show history of marks.

Here are some extra marks

```text
'	The cursor position before doing a jump
"	The cursor position when last editing the file
[	Start of the last change
]	End of the last change
```

### View

- "zz" will center curser in window
- "zt" move cursor to top of page
- "zb" bottom of page

## Searching

"/<stuff>" will begin a search query forward of entire document. It uses regex by
default. Prefix with "?" to search backwards

```text
# will search for all instances if 'one'
/one
```

one can also use "\* " on current word and search for it in the document. Prepend
with value n and will search for nth occurence of word

":set nohlsearch" will remove any highlighting resulting from recent search results

Help documents

- incsearch
- wrapscan
- ignorecase

### Regex Basics

for more details do ":help pattern"

- "/w.rd" will match with any character in between w and rd
- "/word\." will escape the character dot and search for it

## Vim Configuration

We will finally learn how to use the vim configuration file. Vim configuration
is generally located in `~/.vimrc`. Vimscript allows for easy seperation of
configuration in seperate files.

In order to learn about possible configuration options check out
`:help options`

`:options` will bring up menu where options can be viewed and set?

If no user vimrc is found, then the defaults are loaded in with OS packaged default
configuration.

Generally, mappings are sequences of keys that are to be executed as if the user
had done so themselves.

```vim
vnoremap _g y:exe "grep /" .. escape(@", '\\/') .. "/ *.c *.h"<CR>
```

## Mapping

a mapping a list of keys, the trigger and the result to be executed

## Filetypes

Setting filetype detection allows for syntax highlighting, indent options and
certain plugin settings to apply. New file types can be added by placing the correct
script into the correct location

- `:help 'filetype'`
- `:help cindent`

## New Commands

new commands can be added that call other commands or take arguments to define behaviour

## Packages and Plugins

A package is a set of files added to vim. Vim has some packages that can be optionally
turned on.

- "packadd package_name" will add package that is inside of runtime path
- v

### Creating a New PLugin

There are two types, global and filetype specific. It is just a vimscript file
that is loaded on vim startup.

- 'standard-plugin-list' is a list of vimscript functionallity packaged with vim
  but not compiled in in C
- 'load-plugin' will show information on how plugins are loaded

The correct way to install plugins is to get a uncompress copy and to paste it into
the correct directory where it can be found and loaded.

Filetype specific plugins are loaded in by placing the correct script with the correct
name inside of `~/.vim/ftplugin/stuff.vim`

Here are some help topics

- filetype-plugins
- load-plugins
- ftplugin-overrule
- write-plugin
- plugin-details
- new-filetype

### Plugin Help

Sometimes a plugin developer would package in a help document.

Check user-manual 5.7, add local help for creating a help doc and help tags.

## Buffer Windows

## Language Specific

### Syntax Highlighting

see `:help syntax` and chapter 6 of user manual.

### Tags and Ctags and GNU Global

help topics, to to chapter 29 of reference manual.

- `tags`
- `ctags`

### Markdown

The markdown plugin allows for some folding expressions and default folding behavior.

- `ge` will follow link
- `gx` will follow a link in the browser
- `]]` next header
- `][` go to next sibling header if any

Never mind it has some bugs that I hate

## Folding

see `:help fold-commands`

The thing here is that vim allows for text to be folded, hidden way until it is
ready to be seen to be edited. most useful commands

- `zo` will open a single fold
- `zE` get rid of all folds
- `]z` will move to be next fold, same with other braket
- `zr` reduce fold level
- `zR` open everything all the way
- `zm` increase fold level
- `zM` fold everything all the way
- `zc` fold area where cursor is at
- `zi` will toggle foldenable option

```c
int main (void){
  printf("Hello World!\n");
  return 0;
}
```


## Lisp

I have installed 3 plugins related, vim-sexp, vim-sexp-mappings and vim-parinfer.
The only one that I really need to worry about is vim-sexp-mappings since I will
have to memorize the mappings.

### Parinfer

Automatically balanace parenthesis, indentation.

### Vim Sexp and Mappings

Allows for easy list manipulation and navigation. Some people seem to disagree
with some mappings and so the mappings pluggins is added to make it no so painful

## Vimscript

## FZF Plugin

### How to build quickfix?

1. select items
  - <Alt-a> for everything
  - <Tab> for invidual item
2. <Ctrl-q> to build quickfix

# Using Vim Editor as IDE

I did some refactoring of my vim config

## Sed

## Quickfix

In fzf window can a quickfix options be selected

- ALT-A select all
- ALT-D deselect ALL

## Vimgrep

Can be used to search files using grep

## Grep

learn about the option the option `grepprg`

## `cdo` and `cfdo`

## Make

### `makeprg`

## `errorformat`

## Windowing


## FZF

- CTRL-T, CTRL-V, CTRL-X are open for opening in new tab and split

### Custom Completion
