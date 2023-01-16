Chlore
----

![Chlore logo](./chlore-logo-github-light.png#gh-light-mode-only)
![Chlore logo](./chlore-logo-github-dark.png#gh-dark-mode-only)

This is Chlore - a stack based language that's made with a focus on simplicity.

The reference implementation of Chlore that I've been working on is called MChlore.

MChlore can currently target:
- STVM

In the future MChlore will be able to target:
- SUBLEQ
- WebAssembly
- CIL
- JVM

A simple Hello World program written in a standard compliant implementation of Chlore <sup>1.</sup>:

````
import "./lib/import/io.chloreh"

:main
pushuc 0
pushp std_io call

pushuc 0 pushuc 0
pushp putstr call

pushp "Hello, World!\n"
pushuc 0!
hlt
````

1. Check out more examples in the `examples` directory.

You can find a summary of the syntax in `grammar.txt`.

A language specification is extremely important for the development of a language, and Chlore has a (WIP) standard too. A link to the standard will be put here soon.

PS: Check out the Chlore website [here](https://trap-representation.github.io/Chlore/).  
Join the [discord](https://discord.gg/5FCpR5eZyp).
