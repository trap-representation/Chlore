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

You can find a summary of the syntax of Chlore in `grammar.txt`.

A language specification is extremely important for the development of a language, and Chlore has a (WIP) standard too. A link to the standard will be put here soon.

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
