All the libraries in here are strictly standard conforming (and support the *basic instruction set*).

Since these libraries are strictly standard conforming, these will work with any environment that a particular implementation of Sasm can target (at least as long as the environment supports functionality that the libraries expect the environment to support).

The way some environments load shared objects or executable code in memory, often times differ from how Sasm loads SSOs, and shared objects. In those cases, Sasm tries to emulate that behavior, which may turn out to be slower than directly using what's given to us by the environment. For situations like this, an implementation may provide environment-dependent header files/libraries that use that implementation's *extended instruction set* to load SSOs, and shared objects.

For shared objects that are being dynamically loaded, if an environment doesn't support dynamically loading shared objects, it will produce a *force_panic* with/without any extra diagonistic message.

For SSO (Simple Static Objects) that are being loaded in, if an environment doesn't support dynamically loading SSOs, the behavior will be as if the library were statically *include*d in the binary.

If the environment doesn't support calling a statically *include*d library, it will produce a *force_panic* with/without any extra diagonistic message.
