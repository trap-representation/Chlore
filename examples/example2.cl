/ example 2: This isn't rocket science
  This program was made for the "This isn't rocket science" code-golf (code-golf question 91182), though it was never submitted
/

import "./lib/import/io.clh"
import "./lib/import/stddef.clh"
import "./lib/import/porttypes.clh"

:rocket_top dat str "\n  |\n /_\\\n"
:rocket_bottom dat str " |_|\n/___\\\n VvV\n"
:pipe_with_space dat str " |"
:pipe_with_newline dat str "|\n"

:main

;register libraries
%pushuc 0
%reg_std_io

;register symbols
%pushuc 0 %pushuc 0
%reg_std_io_getchar
%pushuc 0 %pushuc 1
%reg_std_io_putchar
%pushuc 0 %pushuc 2
%reg_std_io_putstr


%pushuc 0 !

%pushp rocket_top ptr_data
%pushuc 2 !

:loop
	dup %pushuc '\n' jeq quit ;check for newline
	dup %pushc EOF jeq quit ;check for EOF
	%pushp pipe_with_space ptr_data
	%pushuc 2 !
	%pushuc 1 !
	%pushp pipe_with_newline ptr_data
	%pushuc 2 !
	%pushuc 0 !
	jmp loop

:quit
%pushp rocket_bottom ptr_data
%pushuc 2 !
hlt
