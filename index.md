Chlorine
----

![Chlorine logo](./chlorine-logo-github-pages.png)

----
This is Chlorine - a stack based, assembly-like language that's made with a focus on speed and simplicity.

#### Why yet another new language? ####
Most of the modern languages are built with safety in mind. But let's be honest, a compiler can never be perfect; it's not hard for subtle bugs to slip through and cause all sorts of weird stuff.

This is why Chlorine does *not* try to be safe at all. It is built with a focus on speed and optimizations, rather than safety. It's always better to make the programmer aware that they're programming in an unsafe language, rather than give them a false sense of safety.

Languages are slowly turning into a bloated mess:
- Huge standard libraries with "features" to make programmers' lives easier
- Package managers built right into the language encouraging the use of third-party libraries (which is one of the main causes of security vulnerabilities in softwares, since programmers don't care to read the source of the library they're using)
- Some languages don't even have any formal specification

Chlorine does not and will *never* have any of these "features". Chlorine follows a spec-first approach for the design of the language and it has a standard library that tries to be small, lightweight, and as close to libc as possible.

#### Design goals: ####
- Trust the programmer
- Keep the language as simple as possible
- Keep the standard library as minimal as possible
- One pays for only as much as one wants to do

#### What Chlorine will *never* have: ####
- Automatic memory management
- Implicit safety checks; everything has to be done explicitly by the programmer

The reference implementation of Chlorine that I've been working on is called MChlorine.

#### MChlorine can currently target: ####
- STVM

#### In the future MChlorine will be able to target: ####
- WebAssembly
- CIL
- JVM

#### A simple Hello World program written in a standard compliant implementation of Chlorine: ####

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

#### Future plans: ####
- Build a useful standard library
- Build a compiler for a higher-level language that will be able to target Chlorine
- Make MChlorine self-hosted
