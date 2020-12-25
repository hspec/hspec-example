![Build Status](https://github.com/hspec/hspec-example/workflows/build/badge.svg)

# Running tests

You can run your tests with `stack`, `cabal`, `ghci` or `sensei`.  All of these
options are discussed below.

**Note:** Using `stack` or `cabal` is slow.  Use `ghci` or `sensei` for a
faster edit-compile-test cycle.

## With `stack`

Simply run:

```
$ stack test
```

## With `cabal`

First make sure that you have a recent version of `cabal-install` (you need at
least `v3.0.0.0`:

```
$ cabal --numeric-version
3.2.0.0
```

Then simply run:

```
$ cabal test --test-show-details=direct
```

## With `ghci`

The fastest way to run your tests is with `ghci`.  Make sure that `.ghci` is
only writeable by you:

```
$ chmod go-w . .ghci
```

Then you can run your tests with:

```
$ cabal exec ghci test/Spec.hs
*Main> :main
```

After modifying code use:

```
*Main> :reload
*Main> :main
```

**Note:** `:reload` will be much faster than loading the code initially.  This
makes a big difference for larger projects.

## With `sensei`

Using [hspec/sensei](https://github.com/hspec/sensei) is similar to using
`ghci`, but it runs your tests automatically on file modifications.  You don't
have to invoke `:reload` and `:main` manually.

1. Install `sensei` with
   ```
   $ stack install sensei
   ```
   or

   ```
   $ cabal install sensei --installdir=$HOME/.local/bin
   ```

1. Make sure that `.ghci` is only writeable by you:
   ```
   $ chmod go-w . .ghci
   ```

1. Run `sensei` with
   ```
   $ stack exec sensei test/Spec.hs
   ```
   or
   ```
   $ cabal exec sensei test/Spec.hs
   ```
