Chlore
----

![Chlore logo](./chlore-logo-github-pages.png)

This is Chlore - a stack based language that's made with a focus on simplicity.

#### Why yet another new language? ####

1. Most of the modern languages are built with memory-safety in mind, and most translators perform a lot of complex operations to "guarantee" that "memory-safety" they promise. But let's be honest, the more complex the translator is, the more are the chances of subtle bugs to silp right through, and cause all sorts of weird stuff.

    Chlore is *not* "memory-safe", and its reference implementation is probably one of the simplest compilers you'll find out there.

2. Languages are slowly turning into a bloated mess:
- Huge standard libraries with "features" to make programmers' lives easier
- Package managers built right into the language encouraging the use of third-party libraries (which is one of the main causes of security vulnerabilities in softwares, since most programmers don't care to read the source of the library they're using)
- Some languages don't even have any specification

   Chlore does not and will *never* have any of these "features". Chlore follows a spec-first approach for the design of the language and it has a standard library that tries to be small, and lightweight.

3. Modern languages aren't simple anymore. Simplicity isn't always proportional to how much a language can make a programmer's life easier. A simple language should be ... well simple, and efficient. The programmer shall be the one in full control of his code, rather than the translator.

#### Design goals: ####
- Trust the programmer
- Keep the language as simple as possible
- Keep the standard library as minimal as possible
- One pays for only as much as one wants to do

#### What Chlore will *never* have: ####
- Automatic memory management
- Run-/Compile-time memory-safety checks; everything has to be done explicitly by the programmer

The reference implementation of Chlore that I've been working on is called MChlore.

#### MChlore can currently target: ####
- STVM

#### In the future MChlore will be able to target: ####
- SUBLEQ
- WebAssembly
- CIL
- JVM

#### A simple Hello World program written in a standard compliant implementation of Chlore: ####

````
import "./lib/import/io.chloreh"

:string dat str "Hello, World!\n"

:main
pushuc 0
%std_io

pushuc 0 pushuc 0
%putstr

pushp string ptr_data
pushuc 0 !
hlt
````
