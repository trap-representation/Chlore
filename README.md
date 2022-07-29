### Sasm ###
![sasm logo](./sasm-logo-github-light.png#gh-light-mode-only)
![sasm logo](./sasm-logo-github-dark.png#gh-dark-mode-only)

----
This is Sasm - a stack based, assembly-like language that's made with a focus on speed and simplicity.

Design goals:
- Trust the programmer
- Keep the language as simple as possible
- Keep the standard library as minimal as possible
- One pays for only as much as one wants to do

What Sasm will *never* have:
- Automatic memory management
- Implicit safety checks; everything has to be done explicitly by the programmer

The reference implementation of Sasm that I've been working on is called MSasm.

MSasm can currently target:
- STVM

In the future MSasm will be able to target:
- WebAssembly
- CIL
- JVM

A simple Hello World program written in a standard compliant implementation of Sasm <sup>1)</sup>:

````
import "./lib/import/io.sah"

:string dat str "Hello, World!\n"

:main
;register the library that we need to use
pushu8 0 str0
%reg_std_io

;register the symbol from the library that we are going to need
pushu8 0 pushu8 0 str1 str0
%reg_std_io_puts

;invoke the registered symbol
pushi64 string ptr_data
pushu8 0 !
hlt
````

###### 1) Check out more examples in the `examples` directory. ######

A formal language specification is extremely important for the development of a language, and Sasm has a (WIP) standard too. You'll be able to find a standard draft of this language here in a month or two.

You'll also be able to find the source of the reference implementation of Sasm that I've been working on here soon.

PS: Check out the Sasm website [here](https://trap-representation.github.io/Sasm/).
