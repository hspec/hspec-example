module Main where

import Test.Hspec
import qualified Data.String.StripSpec

main :: IO ()
main = hspec Data.String.StripSpec.spec
