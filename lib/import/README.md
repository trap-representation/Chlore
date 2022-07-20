These are the header files that one can use to call C functions from the standard library. Some header files however (like `string.h`, for example), don't call C functions at all; instead, they have the implementation of the functions that we're calling written in Sasm itself.

Note: Symbols ending with `!` are macros.

While the value of a label can be assigned to the PC with `call`, macros can't be used with `call`. One has to just write the name of the label prefixed with a `%`.

For example, to set the PC to `std_io_puts!`, do this: `%std_io_puts!`.

The `%` expands the macro.