# JapaneseNumbers

Mix app with tasks to calculate Japanese numbers, which uses a grouping by 10,000.
Some of the rules are simplified - for example, here only `juu` (10), `hyaku` (100),
`sen` (1000), and `man` (10,000) are used, and `sen` is not changed to `zen` or `hyaku` to `pyaku` or `byaku`
where it is normally done in the Japanese language.

For reference: https://en.wikipedia.org/wiki/Japanese_numerals

For instance, `JapaneseNumbers.calculate(100000)` should return `"10 man"`,
and `JapaneseNumbers.calculate(1005000)` should return "100 man 5 sen".

To solve the exercises:

- clone the repository;
- cd into the directory of this exercise;
- run `mix test` to run the tests;
- use the main module in the lib directory to implement solutions for the tests;
