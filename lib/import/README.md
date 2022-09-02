NOTEs:

- These are the header files that one can use to register NAOs and AOs present in the standard library.

- You'll also see that some header files have things like this:

   ````
   $if SYM 42
   / ... /
   $fi
   ````

   those are there for conditional compilation.


- It doesn't matter if a marco and a label have the same name, since macros are deleted after the symbol replacement phase anyway.
