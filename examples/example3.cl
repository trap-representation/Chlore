/ example 3: Aligned alloc
  This program allocates a chunk of memory aligned to a 8 byte boundary, stores the number (n) 42 (unsigned int) in that chunk with an aligned store; then it loads n back from the chunk with an aligned load, and writes n to stdout
  NOTE This example requires the target to have an addressable heap
/
import "./lib/import/io.clh"
import "./lib/import/alloc2.clh"
import "./lib/import/porttypes.clh"

:terminate_on_error { & lfr0 panic } ;this macro checks the value returned by a an invoked symbol, and if it is non-zero, the program terminates
;Note however, if this program terminates after the call to `alloc2_init' and before the call to `alloc2_close', there will be a memory leak

:main

;register libraries
%pushuc 0
%pushp reg_std_alloc2
call
%pushuc 1
%pushp reg_std_io
call

;register symbols
%pushuc 0 %pushuc 0
%reg_std_alloc2_aaseg
%pushuc 0 %pushuc 1
%reg_std_alloc2_close
%pushuc 1 %pushuc 2
%reg_std_io_putui
%pushuc 0 %pushuc 3
%reg_std_alloc2_init

%pushuc 3 !
%terminate_on_error

%pushl 1024 ;we'll allocate a chunk of size 1024 bytes
%pushuc 8 ;aligned to a 8-byte boundary
%pushuc 0 !
%terminate_on_error

;the top of the stack now has an (explicit) pointer to the heap
phtip ;convert that to a "normal" pointer
dup str1 ;also store the pointer in register 1 for later
%pushui 42 ;this is the value that we're going to store in the heap
swap
%asthui ;do an aligned store

& lfr1 ;get the pointer that we had stored in register 1
& %alfhui ;do an aligned load from there
;42 should now be on the top of the stack
%pushuc 2 !

%pushuc 1 !

hlt
