Chlore
----

![Chlore logo](./chlore-logo-github-light.png#gh-light-mode-only)
![Chlore logo](./chlore-logo-github-dark.png#gh-dark-mode-only)

This is Chlore - a stack based language that's made with a focus on simplicity.

Design goals:
- Trust the programmer
- Keep the language as simple as possible
- Keep the standard library as minimal as possible

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
pushuc 0
%sav_std_io

pushuc 0 pushuc 0
%sav_std_io_putstr

pushp string ptr_data
pushuc 0 !
hlt
````

###### 1) Check out more examples in the `examples` directory. ######

A language specification is extremely important for the development of a language, and Chlore has a (WIP) standard too. A link to the standard will be put here soon.

The `self_hosted` directory contains the source to the (WIP) self-hosted compiler of the language.

PS: Check out the Chlore website [here](https://trap-representation.github.io/Chlore/).  
Join the [discord](https://discord.gg/5FCpR5eZyp).
