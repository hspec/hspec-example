[![Build Status](https://travis-ci.org/hspec/hspec-example.png)](https://travis-ci.org/hspec/hspec-example)

# Running tests

First make sure that all dependencies are installed:

```
$ cabal install --only-dependencies --enable-tests
```

## `cabal`

Just run

```
$ cabal test
```

and return code will indicate success or failure.  However, you won't get nice
test output.

## `runhaskell`

If you want nice output you can use `runhaskell`:

```
$ runhaskell -isrc -itest test/Spec.hs
```

Alternatively, you can build and run the test suite manually:

```
$ cabal configure --enable-tests --disable-optimization && cabal build && ./dist/build/spec/spec
```

## `ghci`

The fastest way to run your specs is with `ghci`.  Make sure that `.ghci` is
only writeable by you:

```
$ chmod go-w .ghci
```

Then you can run the specs with:

```
$ ghci test/Spec.hs
*Main> :main
```

After modifying code use:

```
*Main> :reload
*Main> :main
```

(note that the `:reload` will be much faster than loading the code initially,
this makes a big difference for larger projects)

## Cabal sandboxes

To use `runhaskell` or `ghci` with Cabal sandboxes, run it with `cabal exec`:

```
$ cabal exec ghci test/Spec.hs
*Main> :main
```

```
$ cabal exec -- runhaskell -isrc -itest test/Spec.hs
```

## A warning word about `cabal repl`

It might be tempting to use `cabal repl` instead of `ghci`, but this does not
properly work with `:reload`:

> If you have a `test-suite` section that depends on the `library` section of
> your cabal file, then `:reload` will not reload any changes you make  to your
> library.
