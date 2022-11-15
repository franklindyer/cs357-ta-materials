We will be using Racket, which you can [download here](https://racket-lang.org/download/). Alternatively, you can log into the UNM CS machines, where Racket is already installed.

### Useful emacs shortcuts

You can open the `hello.rkt` test file with emacs using `emacs hello.rkt`. Here are just a few useful shortcuts in emacs:
- `Ctrl-x Ctrl-s` to save your file
- `Ctrl-x Ctrl-c` to save and quit
- `Ctrl-a` to go to the beginning of the current line
- `Ctrl-e` to go to the end of the current line
- `Ctrl-k` to delete the current line

### Running Racket

On the command line, you can run Racket with the command `racket`. Once you are in, you should be able to print a simple "Hello World!" statement as follows:
```
> (display "Hello World!\n")
Hello World!
```
You can load a Racket file from the same directory where you ran `racket` using the command `,enter`. For instance, if you launch Racket in this directory, you should be able to carry out the following:
```
> ,enter "hello.rkt"
Hello World!
"hello.rkt"> (plus x y)
69  
```
To leave the Racket REPL, you can use `(exit)`.