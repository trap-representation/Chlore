(This only applies to MSasm-stvm and MstvmSn8.)

As of now, `push*`es perform an unaligned read, so are slower than using an aligned load from the data (`aloadc*`).

Most of the examples here however, use `push*` for readability, but if performance is of concern, `aloadc*` should be used.

NOTE Before `aloadc*` is used, `eft*` must be used on the location where `aloadc*` is going to fetch its data from to avoid violating the strict aliasing rules of C.
