module Main where

import System.Environment
import System.Exit
import Text.Read 
import Lib

main :: IO ()
main = getArgs >>= parse >>= print

parse :: [String] -> IO Int
parse [] = usageMessage >> exitFailure
parse [a, b] = usageMessage >> exitFailure
parse [a, b, c] = processArguments a b c
parse _ = usageMessage >> exitFailure

processArguments :: String -> String -> String -> IO Int
processArguments x x' x'' =
    case (readMaybe x, readMaybe x', readMaybe x'') of
        (Just a, Just b, Just c) -> return $ divisionDigit a b c 
        (Nothing, _, _) -> argumentIntMessage x >> exitFailure
        (_, Nothing, _) -> argumentIntMessage x' >> exitFailure
        (_, _, Nothing) -> argumentIntMessage x'' >> exitFailure

usageMessage :: IO ()
usageMessage = putStrLn "usage: tak-one-exe <a> <b> <c>" 

argumentIntMessage :: String -> IO ()
argumentIntMessage a = putStrLn $ '\'' : a  ++ "' nie jest liczbą całkowitą"

