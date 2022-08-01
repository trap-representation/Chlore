### Chlorine ###
![Chlorine logo](./chlorine-logo-github-light.png#gh-light-mode-only)
![Chlorine logo](./chlorine-logo-github-dark.png#gh-dark-mode-only)

----
This is Chlorine - a stack based, assembly-like language that's made with a focus on speed and simplicity.

Design goals:
- Trust the programmer
- Keep the language as simple as possible
- Keep the standard library as minimal as possible
- One pays for only as much as one wants to do

What Chlorine will *never* have:
- Automatic memory management
- Implicit safety checks; everything has to be done explicitly by the programmer

The reference implementation of Chlorine that I've been working on is called MChlorine.

MChlorine can currently target:
- STVM

In the future MChlorine will be able to target:
- WebAssembly
- CIL
- JVM

A simple Hello World program written in a standard compliant implementation of Chlorine <sup>1)</sup>:

````
import "./lib/import/io.sah"
import "./lib/import/porttypes.sah"

:string dat str "Hello, World!\n"

:main
;register the library that we need to use
%pushuc 0
%reg_std_io

;register the symbol from the library that we are going to need
%pushuc 0 %pushuc 0
%reg_std_io_putstr

;invoke the registered symbol
%pushp string ptr_data
%pushuc 0 !
hlt
````

###### 1) Check out more examples in the `examples` directory. ######

A formal language specification is extremely important for the development of a language, and Chlorine has a (WIP) standard too. You'll be able to find a standard draft of this language here in a month or two.

You'll also be able to find the source of the reference implementation of Chlorine that I've been working on here soon.

PS: Check out the Chlorine website [here](https://trap-representation.github.io/Chlorine/).
