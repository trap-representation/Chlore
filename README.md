Chlore
----

![Chlore logo](./chlore-logo-github-light.png#gh-light-mode-only)
![Chlore logo](./chlore-logo-github-dark.png#gh-dark-mode-only)

This is Chlore - a stack based language that's made with a focus on simplicity.

The reference implementation of Chlore that I've been working on is called Ehre.

Ehre can currently target:
- STVM

In the future Ehre will be able to target:
- SUBLEQ
- WebAssembly
- CIL
- JVM

A simple Hello World program written in a standard compliant implementation of Chlore <sup>1.</sup>:

````
import "./lib/import/stdlib.chloreh"
import "./lib/import/io.chloreh"

:main
pushp "Hello, World!\n"
pushp putstr call
hlt
````

You can find a summary of the syntax of Chlore in `grammar.txt`.

A language specification is extremely important for the development of a language, and Chlore has a (WIP) standard too. A link to the standard will be put here soon.

If you're curious about how the language looks like though, you can check the `grammar.txt` which contains a summary of the syntax of Chlore. Ehre adds some new instructions to Chlore, so you might also want to take a look at `ehre_specific_grammar.txt`.

The syntax of Chlore was recently changed, so I decided to nuke the `self_hosted` directory because the self hosted compiler wouldn't compile with the new implementation anymore. I'm working on a new self hosted implementation now, which I'll put here once I get the lexer written.

Every source file in this repository is licensed under the GPLv3 license, even if the text of the license is not explicitly placed at the start of the file. For files where the license is not explicitly placed in, modify/use/distribute them the way you would've had the following text been present in the file.

```
    Copyright (C) 2022  Somdipto Chakraborty

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
```

In case you're distributing the file, please put the aforementioned text at the beginning of the file you're about to distribute.

PS: Check out the Chlore website [here](https://trap-representation.github.io/Chlore/).  
Join the [discord](https://discord.gg/5FCpR5eZyp).
