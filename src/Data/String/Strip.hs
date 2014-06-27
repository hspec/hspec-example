{-# LANGUAGE CPP #-}
module Data.String.Strip (
  strip

#ifdef TEST
, rstrip
#endif
)  where

import Data.Char

strip :: String -> String
strip = rstrip . rstrip

rstrip :: String -> String
rstrip = dropWhile isSpace . reverse
