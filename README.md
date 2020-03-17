# benchy

`benchy` is a library for running bench marks in Haskell.

## Example

Single pass benchmarks:

```
λ bench $ sum [0..1000000]
===== BENCHMARK =====
START TIME: 1584203398.500460682s
  END TIME: 1584203398.731131055sTIME TAKEN: 0.230670373s
λ bench $ foldr (+) 0 [0..10000000]
===== BENCHMARK =====
START TIME: 1584277909.781853316s
  END TIME: 1584277911.232354588s
TIME TAKEN: 1.450501272s
λ bench $ foldl (+) 0 [0..10000000]
===== BENCHMARK =====
START TIME: 1584277914.931813301s
  END TIME: 1584277916.7549672s
TIME TAKEN: 1.823153899s
```
