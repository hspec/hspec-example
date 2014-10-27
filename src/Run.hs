module Run where

import           System.Environment

main :: IO ()
main = getArgs >>= putStrLn . unwords
