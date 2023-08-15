Chlore
----

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

:main
  pushp "Hello, World!\n"
  pushp putstr call
  hlt
````

If you're curious about how the language looks like, you can check the `grammar.txt` file, which contains a summary of the syntax of Chlore.

A language specification is extremely important for the development of a language, and Chlore has a (WIP) standard too. A link to the standard will be put here soon.

Implementations of Chlore:
1. [Toc](https://github.com/trap-representation/toc)

Cool stuff implemented in Chlore:
1. [The YET text editor](https://github.com/trap-representation/YET)
2. [Solutions to some Project Euler problems](https://github.com/trap-representation/Project-Euler)
3. [POSIX shell utilities](https://github.com/trap-representation/posix-shell-utilities)
4. [The Carsee IRC client](https://github.com/trap-representation/Carsee)

----

Every source file in this repository is licensed under the GPLv3 license, even if the text of the license is not explicitly placed at the start of the file. For files where the license is not explicitly placed in, modify/use/distribute them the way you would've had the following text been present in the file.

```
    Copyright (C) 2022-2023  Somdipto Chakraborty

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

---

1. Check out the Chlore programming language's official website [here](https://trap-representation.github.io/Chlore/)
2. Check out our [discord](https://discord.gg/5FCpR5eZyp)
3. Check out our [reddit community](https://www.reddit.com/r/Chlore)
