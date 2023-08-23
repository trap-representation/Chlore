Chlore
----

![Chlore logo](./chlore-logo.png)

This is Chlore - a stack-oriented programming language that's made with a focus on simplicity.

#### Philosophies behind the development of Chlore ####

- If it takes 10 rereads to interpret it right, it should NOT make it into the language
- Do not add features just for the sake of it
- Do not specify unnecessary details in the name of "portability"
- Guarantees are fine, so long as an addition is not expected to summon elephants

#### A quick introduction to the language ####

NOTE: This introduction does not at all cover the entire language. It is just meant to _introduce_ folks to the language, how it looks like, how some constructs behave, etc. Expect this to be extended in the future. And this goes without saying, this is non-normative, and is not meant to replace the work-in-progress standard.

During start up, the symbol `main` is `call`ed, which means execution always start from the label `:main`. So the simplest Chlore program would look something like this:

```
:main
  hlt
```

`hlt` terminates the execution of a program and returns the control to the execution environment. The last instruction evaluated must be one of `hlt`, `hltr`, `panic`, `force_panic`, and `exit`. `hlt` also returns the exit code 0 to the environment.

An item of type int can be pushed on top of the stack with `pushi`. So something like

```
:main
  pushi 42
  hltr
```

would return an exit code of 42 to the execution environment. `hltr` consumes the item at the top of the stack and returns its value to the environment.

A pointer to a symbol designating a label or a string constant can be pushed on the stack with `pushp`.

```
:main
  pushp "Hello, World!\n"
  hlt
```

This pushes a pointer to the string constant "Hello, World!\n" on the top of the stack. To write that to the standard output, we'd need to `call` some symbols set by the standard library.

However, three files have to be `import`ed before that: "stdlib.chloreh", "io.chloreh", and "exit.chloreh". "stdlib.chloreh" sets the symbol "STDLIB_ID" to point to a string constant designating the location of the standard library. "io.chloreh" defines symbols that can be `call`ed to perform input and output operations. "exit.chloreh" sets the "phclean" symbol that, if at least one `call` is made to one of the symbols defined by the standard library, must be `call`ed before the program terminates.

```
import "stdlib.chloreh"
import "io.chloreh"
import "exit.chloreh"

:main
  pushp "Hello, World!\n"
  hlt
```

The only thing that's left to be done now is to `call` the symbols we need. "putstr" consumes the pointer present at the top of the stack and writes the string pointed to it to the standard output, which is exactly what we want to achieve.

```
import "stdlib.chloreh"
import "io.chloreh"
import "exit.chloreh"

:main
  pushp "Hello, World!\n"
  pushp putstr call
  pushp phclean call
  hlt
```

While we are at it, we might as well check whether the write to the standard output was successful. "putstr" sets block0. A block is a kind of storage region; think of them as registers in ISAs. Any standard conforming implementation of Chlore _must_ provide at least 8 blocks. The item in a block can be accessed with the read and write instructions associated with that block. For example, for block0, `write0` consumes the item at the top of the stack and stores that in block0, and `get0` gets the item stored in block0 and pushes that item on the top of the stack.

After the return from "putstr", block0 contains either the number of bytes successfully written to the standard output, or, on failure, EOF. Since we're checking block0 against EOF, we'll need to `import` "stddef.chloreh", which defines the symbol "EOF".

```
import "stdlib.chloreh"
import "io.chloreh"
import "stddef.chloreh"
import "exit.chloreh"

:main
  pushp "Hello, World!\n"
  if(pushp putstr call get0 pushi EOF ne){
    pushi 0
  }
  else{
    pushi 1
  }
  pushp phclean call
  hltr
```

If the write is successful-- that is, it is not equal to (`ne`) EOF-- an item with the value "0" is pushed on the top of the stack; otherwise, "1" is pushed on the top of the stack.

A structure can be defined like so:

```
struct random_struct {
  i: foo
  i: bar
}
```

The structure has two members: "foo" and "bar", both of which are of type int.

The size of a structure can be pushed on the top of the stack using a construct like

```
sizeof random_struct
```

Memory can be allocated by using "aseg" defined in "alloc2.chloreh". We'll try allocating some memory that we'd be able to use to store all the members of the structure "random_struct".

```
import "stdlib.chloreh"
import "alloc2.chloreh"
import "exit.chloreh"

struct random_struct {
  i: foo
  i: bar
}

:main
  sizeof random_struct
  pushp aseg call
  pushp phclean call
  hlt
```

"aseg" consumes the item at the top of the stack and allocates memory of size denoted by that item. NULL is returned by "aseg" on failure, so we'd add a check for it.

```
import "stdlib.chloreh"
import "alloc2.chloreh"
import "stddef.chloreh"
import "exit.chloreh"

struct random_struct {
  i: foo
  i: bar
}

:main
  sizeof random_struct
  if(pushp aseg call push NULL eq){
    pushi 1 hltr
  }
  pushp phclean call
  hlt
```

It is always a good practice to free the memory we allocated before termination.

```
import "stdlib.chloreh"
import "alloc2.chloreh"
import "stddef.chloreh"
import "exit.chloreh"

struct random_struct {
  i: foo
  i: bar
}

:main
  sizeof random_struct
  if(pushp aseg call push NULL eq){
    pushi 1 hltr
  }
  pushp flush call
  pushp phclean call
  hlt
```

A construct like

```
+random_struct.foo
```

pushes an item on the top of the stack, which when added to the pointer returned after the `call` to "aseg" with `addp`, the result is a pointer to the member "foo".

```
mport "stdlib.chloreh"
import "alloc2.chloreh"
import "exit.chloreh"

struct random_struct {
  i: foo
  i: bar
}

:main
  sizeof random_struct
  if(pushp aseg call push NULL eq){
    pushi 1 hltr
  }
  pushi 42 over +random_struct.foo addp storei
  pushp flush call
  pushp phclean call
  hlt
```

When `addp` is evaluated, the item pushed by the construct `+random_struct.foo` must be at the top of the stack and the pointer to the allocated memory just underneath that.

`storei` stores in the storage region pointed to by the top of the stack the item present just underneath that. The number of bytes written to the memory is the value of the item pushed on the top of the stack after the evaluation of the construct `sizeof i`.

```
import "stdlib.chloreh"
import "alloc2.chloreh"
import "exit.chloreh"

struct random_struct {
  i: foo
  i: bar
}

:main
  sizeof random_struct
  if(pushp aseg call push NULL eq){
    pushi 1 hltr
  }
  pushi 42 over +random_struct.foo addp storei
  pushi 22 over +random_struct.bar addp storei
  dup +random_struct.foo addp loadi
  swap pushp flush call
  pushp phclean call
  hltr
```

The int written to the member "foo" can be loaded with `loadi`, which consumes a pointer to some memory from the top of the stack and reads from that memory an int, that is then pushed on the top of the stack.
