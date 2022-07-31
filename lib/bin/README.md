There are some files here named like this: `__std_<lib_name>_relative_addr.sa`, and these files are generated only for AO files, not NAOs.

These files contain macros (named like this: `sym_<label_name>`), which are basically named after the labels that a particular AO has and their locations in the binary.

The value of these symbols usually change depending on the compiler flags passed, the target environment, and the compiler used, so don't use the same relative address file for all the versions of an AO; instead, compile the AO and use your implementation-specific flag to generate such a file.
