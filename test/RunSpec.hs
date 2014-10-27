module RunSpec (spec) where

import           Test.Hspec
import           System.IO.Silently
import           System.Environment

import           Run

spec :: Spec
spec = do
  describe "main" $ do
    it "prints command-line arguments" $ do
      capture_ (withArgs ["foo", "bar"] main) `shouldReturn` "foo bar\n"
