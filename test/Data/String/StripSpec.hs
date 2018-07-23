module Data.String.StripSpec (spec) where

import Test.Hspec
import Data.String.Strip

spec :: Spec
spec = do
  describe "strip" $ do
    it "removes leading and trailing whitespace" $ do
      strip "\t  foo bar\n" `shouldBe` "foo bar"
