Most of the examples here use `push*` for readability, but if performance is a concern, it's better to avoid using `push*`, since it does an unaligned access to read its immediate.

If the same immediate is being pushed frequently, consider storing it in a general purpose register (if the implementation/target supports/has one).

NOTE All the examples here use the `Msasm-stvm` implementation, but may need some modifications to make them work on other implementations.
