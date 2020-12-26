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


### With `ghcid`

[ghcid](https://github.com/ndmitchell/ghcid) is a wrapper around `ghci` that
automatically issues a `:reload` to `ghci` whenever you save your source files.
You can configure `ghcid` to automatically run the tests on a successful build.
With the right editor integration this makes for a fast and convenient
edit-compile-test cycle.

With the right setup, `ghcid` allows you to automatically recompile your
project on save, source any compile errors into your editor, update your tags
file, and run the tests. All this with the speed of `ghci :reload`.

To install ghcid, use stack:

```
$ stack install ghcid
```

`ghcid` requires you to set up `ghci` so that a `:reload` reloads all your
source files. This is your responsibility. Any `ghci` will do, here we describe
how to set it up with `stack ghci`.

The default project layout you get from `stack new` consists of three
components: a library, a main executable, and a test suite. Ideally, you would
want to `:reload` all three, but it is not possible to have both the test suite
and the main executable loaded in `ghci` at the same time. The workaround we
suggest is to move all code from the main executable to the library, into a
`Run.hs` module. This way `ghci` only has to `:reload` the library and the test
suite, which works nicely.

Once you have set up your stack project `your-project` like this, create a file
`.ghcid` in your project directory with the following contents, and then run
`ghcid`.

```
$ cat .ghcid
--command=stack ghci your-project:your-project-test your-project:lib --test=main
```

As added bonus, `ghcid` can write the compiler output to a file. If you use vim
for example, make the file `errors.err`, have a correct error format, and you
can `:cfile` compiler errors.

As another added bonus, `ghcid` can call an external program on successful
build. The flag for this is called `--lint`, but you can use any program you
want. For example, you can update your tags file on each successful build. The
shell script `make-tags-haskell.sh` here is a wrapper around `hasktags -c .`

```
$ cat .ghcid
--command=stack ghci your-project:your-project-test your-project:lib --outputfile=errors.err --lint=make-tags-haskell.sh --test=main
```




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
