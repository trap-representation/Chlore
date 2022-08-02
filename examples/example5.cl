/ example 5: Calculating the length of a nul-terminated string
  This program calculates the length of the nul-terminated string pointed to by `string'
/

set LD_DYN 1 ;if LD_DYN is set to 1, it'll hint the compiler that libraries can be loaded dynamically
;it is still nothing more than just a hint, so the compiler is free to put the library in the binary even if LD_DYN is set

import "./lib/import/io.clh"
import "./lib/import/string.clh"
import "./lib/import/porttypes.clh"

:string dat str "Hello, World!\n"


:main
%pushuc 0
%pushp reg_std_string
call ;load in the `std_string' library

%pushuc 1
%pushp reg_std_io
call ;load in the `std_io' library

%pushuc 0 %pushuc 0
%pushp reg_std_string_strlen
call

%pushp string ptr_data
%pushuc 0 !

;the length of the string pointed to by `string' is now on the top of the stack

%pushuc 1 %pushuc 1
%pushp reg_std_io_putl
call

%pushuc 1 !

hlt
