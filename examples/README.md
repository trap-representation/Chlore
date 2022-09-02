All the examples here are *standard conforming*.

Most of the examples here use `push*` for readability, but if performance is a concern, it's better to avoid using `push*`, since it does an unaligned access to read its immediate.

If the same immediate is being pushed frequently, consider storing it in a general purpose register.
