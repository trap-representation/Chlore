Sasm
----
This is Sasm - a stack based, assembly-like language.

A formal language specification is extremely important for the development of a language, and Sasm has a standard too. You'll be able to find a draft of the standard on this repository soon.

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

A simple Hello World program written in a standard compliant implementation of Sasm <sup>1)</sup>:

    import "./lib/import/io.sah"   
    :string dat str "Hello, World!\n"
    :main
    pushi64 string ptr_data
    pushu8 0 pushu8 0 inva
    call std_io_puts
    hlt

1) Check out more examples in the `examples` folder of this repository.

PS: You'll soon be able to find the source of the reference implementation of Sasm that I've been working on on this repository.

PPS: Check out the Sasm website [here](https://sites.google.com/view/sasm-lang/sasm-home).
