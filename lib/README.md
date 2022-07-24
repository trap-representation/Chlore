All the libraries in here are standard-compliant and support the *basic instruction set*.

For shared objects that are being dynamically loaded, if an environment doesn't support dynamically loading shared objects, it will produce a *force_panic* with/without any extra diagonistic message.

For SSO (Simple Static Objects) that are being loaded in, if an environment doesn't support dynamically loading SSOs, the behavior will be as if the library were statically *include*d in the binary.

If the environment doesn't support calling a statically *include*d library, it will produce a *force_panic* with/without any extra diagonistic message.
