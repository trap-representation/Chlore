This is Sasm - a stack based, assembly-like language.

Design goals:
- Trust the programmer
- Keep the language as simple as possible
- Keep the standard library as minimal as possible
- One pays for only as much as one wants to do

What Sasm doesn't have:
- Automatic memory management
- Implicit safety checks; everything has to be done explicitly by the programmer

The reference implementation of Sasm that I've been working on is called MSasm.

MSasm can currently target:
- STVM

In the future MSasm will be able to target:
- WebAssembly
- CLR

A simple Hello World program written in a standard compliant implementation of Sasm <sup>1)</sup>:

    import "./lib/import/io.sah"   
    :string dat str "Hello, World!\n"
    :main
    pushu8 0 pushu8 0 inva
    pushi64 string
    call std.io.puts
    hlt

1) Check out more examples in the `examples` folder of this repository.

PS: You'll soon be able to find the source of the reference implementation of Sasm that I've been working on on this repository.

PPS: Check out the Sasm website [here](https://sites.google.com/view/sasm-lang/sasm-home).
