There are some files here named like this: `__std_<lib_name>_relative_addr.sa`, and these files are generated only for AO files, not NAOs.

These files contain macros (named like this: `sym_<label_name>`), which are basically named after the labels that a particular AO has and their locations in the binary.

The value of these symbols usually change depending on the compiler flags passed, and the target environment, so don't use the same relative address file for all the versions of an AO; instead, compile the AO with the `-genobjh` flag to generate a symbol table just like the ones here.
