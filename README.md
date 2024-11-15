Chlore
---

![Chlore logo](./chlore-logo.png)

This is Chlore - a stack-oriented programming language that's made with a focus on simplicity.

Philosophy behind the development of Chlore:
- If it takes 10 rereads to interpret it right, it should NOT make it into the language
- Do not add features just for the sake of it
- Do not specify unnecessary details in the name of "portability"
- Guarantees are fine, so long as an addition is not expected to summon elephants

A simple Hello World program written in a standard compliant implementation of Chlore[^1]:

[^1]: Check out more examples in the `examples` directory.

````
import "stdlib.chloreh"
import "io.chloreh"
import "exit.chloreh"

:main
  pushp "Hello, World!\n"
  pushp putstr call
  pushp phclean call
  hlt
````

If you're curious about how the language looks like, you can check the `grammar.txt` file, which contains a summary of the syntax of Chlore.

A language specification is extremely important for the development of a language, and Chlore has a (WIP) standard too. A link to the standard will be put here soon.

Implementations of Chlore:
1. [Toc](https://github.com/trap-representation/toc)

Cool stuff implemented in Chlore:
1. [The YET text editor](https://github.com/trap-representation/YET) [^2]
2. [Solutions to some Project Euler problems](https://github.com/trap-representation/Project-Euler) [^2]
3. [POSIX shell utilities](https://github.com/trap-representation/posix-shell-utilities) [^2]
4. [The Carsee IRC client](https://github.com/trap-representation/Carsee)

[^2]: This might not work with the latest revision of the language

---

Do whatever you want with the files in `./examples/`. `chlore-logo.png` and `grammar.txt` are licensed under the Creative Commons Attribution-NoDerivatives 4.0 International License. Copyright (c) 2023 Somdipto Chakraborty.

---

Check out the [discord server](https://discord.gg/5FCpR5eZyp)
