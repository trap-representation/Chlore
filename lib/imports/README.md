These are the header files that one can use to call C functions from the standard library.

Note: Symbols ending with `!` are macros.

While the value of a label can be assigned to the PC with `call`, macros can't be used with `call`. One has to just write the name of the label prefixed with a `%`.

For example, to set the PC to `std_io_puts!`, do this: `%std_io_puts!`.

The `%` expands the macro.
