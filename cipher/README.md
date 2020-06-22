# Cipher

Mix app with tasks to implement two simple substituon ciphers - the [Caesar](https://en.wikipedia.org/wiki/Caesar_cipher) and [Atbash](https://en.wikipedia.org/wiki/Atbash) ciphers.

In the Caesar cipher, each letter is replaced by a letter a number of positions after it in the alphabet. For instance, a shift of 5 would mean that `a` would become `f` (hence, `A` -> `F`), `t` - `y`, and `z` would become `e`.

In the Atbash cipher, the alphabet is mapped to its reversed version - `a` becomes `z`, `b` - `y`, `y` becomes `b`, `r` becomes `i`, and so on.

In the `test` directory, you'll find a few tests for these ciphers, but first there is a simpler test for single letter substitution in a string.

To solve the exercises:

- clone the repository;
- cd into the directory of this exercise;
- run `mix test` to run the tests;
- use the main module in the lib directory to implement solutions for the tests;
