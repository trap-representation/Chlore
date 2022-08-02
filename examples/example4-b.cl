/ example 4-b: Addressable object
  This is an addressable object file that can be loaded by or placed in another object||standalone file during run-||compile-time
/

set IS_DYOBJ 1 ;this macro needs to be set, or all the calls to the standard library functions will simply fail
import "./lib/import/porttypes.clh"
import "./lib/import/io.clh"

:abs_addr { & lfr1 %addp } ;this macro should be applied to pointers that are pointing to stuff that are present in this object. This macro calculates an absolute address from a relative address

:string dat str "Hello, World!\n"

:oentry ;this is the entry point

swap str1 ;save the base address of this object in GPR 1

%pushuc 0
& lfr1 ;since we're using the header files from the standard library, and they're `import'ed in an object, they require the base address of the object which they're `include'd in to be at the top of the stack
%pushp reg_std_io %abs_addr
call

%pushuc 0 %pushuc 0
& lfr1
%pushp reg_std_io_putstr %abs_addr
call

%pushp string %abs_addr ptr_data
%pushuc 0 !

hlt