import Lib (divisionDigit)
import Test.Tasty
import Test.Tasty.SmallCheck as SC
import Test.Tasty.HUnit

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [scProps, unitTests]

scProps = localOption (SmallCheckDepth 10^3) $ testGroup "Properties"
    [ SC.testProperty "2 / 3, a > 0" $
        \a -> a > 0  SC.==> divisionDigit a 2 3 == 6
    , SC.testProperty "10000 / 8, a > 3" $
        \a -> a > 3 SC.==> divisionDigit a 2 3 == 0
    , SC.testProperty "1 / 2000, a > 1" $
        \a -> a > 3 SC.==> divisionDigit a 2 3 == 0
    ]

unitTests = testGroup "Unit tests"
    [ testCase "10000 / 8, 1. cyfra" $
        divisionDigit 1 10000 8 @?= 1
    , testCase "10000 / 8, 2. cyfra" $
        divisionDigit 1 10000 8 @?= 2
    , testCase "10000 / 8, 3. cyfra" $
        divisionDigit 1 10000 8 @?= 5
    , testCase "1 / 2000, 1. cyfra" $
        divisionDigit 1 10000 8 @?= 5
    , testCase "71 / 700, 1. cyfra" $
        divisionDigit 1 10000 8 @?= 1
    , testCase "71 / 700, 2. cyfra" $
        divisionDigit 1 10000 8 @?= 0
    , testCase "71 / 700, 3. cyfra" $
        divisionDigit 1 10000 8 @?= 1
    ]
