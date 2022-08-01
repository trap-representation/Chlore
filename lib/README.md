All the object files and header files in here are strictly standard conforming (and support the *basic instruction set*).

Since these object files are strictly standard conforming, these will work with any environment that a particular implementation of Sasm can target (at least as long as the environment supports the functionalities that the libraries expect the environment to support).

The way some environments load executable code in memory, often times differ from how Sasm expects AOs and NAOs to be loaded in. In those cases, Sasm tries to emulate that behavior, which may turn out to be slower than directly using what's given to us by the environment. For situations like this, an implementation may provide **optional** environment-dependent header files/libraries that use that implementation's *extended instruction set* to load AOs, and NAOs.

For NAOs (Non-Addressable objects) that are being dynamically loaded, if an environment doesn't support dynamically loading NAOs, it will produce a *force_panic* with/without any extra diagonistic message.

For AOs (Addressable Objects) that are being loaded in dynamically, if an environment doesn't support dynamically loading AOs, the behavior is undefined.

NOTE Even though everything here is *strictly standard conforming*, these are *not* portable across different implementations, and might change.
For example, an implementation is free to define `char` to be 32 bits, and some of the libraries and headers might not work on that implementation.

The header files and the source of the object files in the standard library are put here just to demonstrate how those are created, and implementations may define their own version of the objects and headers.
