/ example 1: Hello, World!
  This program writes "Hello, World" to stdout
/

import "./lib/import/io.clh"
import "./lib/import/porttypes.clh"

:string dat str "Hello, World!\n" ;this string is automatically nul-terminated

:main

;register the library that we need to use
%pushuc 0 ;the library will be registered at the 0th index of the object handler table
%pushp reg_std_io
call ;registers the `std_io' library

;register the symbol from the library that we are going to need
%pushuc 0 ;for loading a symbol from the library loaded at the 0th index of the object handler table
%pushuc 0 ;the symbol will be registered at the 0th index of the symbol handler table
%pushp reg_std_io_putstr
call ;registers the `std_io_putstr' symbol

;invoke the registered symbol
%pushp string ptr_data
%pushuc 0 ! ;invoke the symbol registered at the 0th index of the symbol handler table
hlt


;NOTE the bang invocation operator (!) has to check whether the symbol at the [top]th index of the symbol handler table is present in a NAO, or an AO, which might be slow
;if you want to avoid this, directly use `invokenaosym' or `invokeaosym' based on how the library is implemented
;the bang invocation and the tilde unload (~) operators are made just to have a common operator for invoking/unloading symbols irrespective of where those symbols are present in