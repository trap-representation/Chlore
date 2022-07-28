NOTEs:

- These are the header files that one can use to register shared objects and AOs present in the standard library.

- While the value of a label can be assigned to the PC with `call`, macros can't be used with `call`. One has to just write the name of the label prefixed with a `%`.

For example, to expand the `std_io_puts` macro, do this: `%std_io_puts`.

The `%` expands the macro.

- You'll also see that some header files have things like this:

````
$if SYM 42
/ ... /
$fi
````

those are there for conditional compilation.


- It doesn't matter if a marco and a label have the same name, since macros are deleted after the symbol replacement phase anyway.
