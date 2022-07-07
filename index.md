Sasm
----
This is Sasm - a stack based, assembly-like language.

Most of the modern languages are built with safety in mind. But let's be honest, a compiler can never be perfect; it's not hard for subtle bugs to slip through and cause all sorts of weird stuff.

This is why Sasm does *not* try to be safe at all. It is built with a focus on speed and optimizations, rather than safety. It's always better to make the programmer aware that they're programming in an unsafe language, rather than give them a false sense of safety.

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
- CLR

A simple Hello World program written in a standard compliant implementation of Sasm:

    import "./lib/import/io.sah"   
    :string dat str "Hello, World!\n"
    :main
    pushi64 string ptr_data
    pushu8 0 pushu8 0 inva
    call std_io_puts
    hlt

Future plans:
- Build a useful standard library
- Build a compiler for a higher level-language that will be able to target Sasm
- Make Sasm self-hosted
