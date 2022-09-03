Chlore
----

![Chlore logo](./chlore-logo-github-light.png#gh-light-mode-only)
![Chlore logo](./chlore-logo-github-dark.png#gh-dark-mode-only)

This is Chlore - a stack based language that's made with a focus on speed and simplicity.

Design goals:
- Trust the programmer
- Keep the language as simple as possible
- Keep the standard library as minimal as possible
- One pays for only as much as one wants to do

What Chlore will *never* have:
- Automatic memory management
- Run-/Compile-time memory-safety checks; everything has to be done explicitly by the programmer

The reference implementation of Chlore that I've been working on is called MChlore.

MChlore can currently target:
- STVM

In the future MChlore will be able to target:
- SUBLEQ
- WebAssembly
- CIL
- JVM

A simple Hello World program written in a standard compliant implementation of Chlore <sup>1)</sup>:

````
import "./lib/import/io.chloreh"

:string dat str "Hello, World!\n"

:main
;register the object that we need to use
pushuc 0
%reg_std_io

;register the symbol from the object that we are going to need
pushuc 0 pushuc 0
%reg_std_io_putstr

;invoke the registered symbol
pushp string ptr_data
pushuc 0 !
hlt
````

###### 1) Check out more examples in the `examples` directory. ######

A formal language specification is extremely important for the development of a language, and Chlore has a (WIP) standard too. You can find working drafts of the Chlore22 standard in the [Chlore-spec-working-drafts](https://github.com/trap-representation/Chlore-spec-working-drafts) repository.

You'll be able to find the source of the reference implementation of Chlore that I've been working on here soon.

PS: Check out the Chlore website [here](https://trap-representation.github.io/Chlore/).
