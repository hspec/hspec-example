[![Build Status](https://travis-ci.org/hspec/hspec-example.png)](https://travis-ci.org/hspec/hspec-example)

# Running tests

First make sure that all dependencies are installed:

```
$ cabal install --only-dependencies --enable-tests
```

## `cabal` - monochrome output

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

## `cabal repl` - colored output

Run the specs with:

```
$ cabal repl test/Spec.hs
*Main> :main
```

For reload see ghci bellow.

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
