{-# LANGUAGE BangPatterns #-}

module Lib
    ( divisionDigit
    ) where

import Data.Char

divisionDigit :: Int -> Int -> Int -> Int
divisionDigit a b c
    | intRes == "0" = expansionDigitDropping a b c
    | a <= length intRes = digitToInt $ intRes !! (a-1)
    | otherwise = expansionDigit a rem c 0
    where !(i, rem) = divide b c
          !intRes = show i

expansionDigit :: Int -> Int -> Int -> Int -> Int
expansionDigit 0 _ _ acc = acc
expansionDigit !a !b !c _ = expansionDigit (a-1) rem c acc
    where !(acc, rem) = divide (b*10) c

expansionDigitDropping :: Int -> Int -> Int -> Int
expansionDigitDropping !a !b !c
    | acc == 0 = expansionDigitDropping a rem c
    | otherwise = expansionDigit (a-1) rem c acc
    where !(acc, rem) = divide (b*10) c

divide :: Int -> Int -> (Int, Int)
divide !a !b = (a `quot` b, a `mod` b)
