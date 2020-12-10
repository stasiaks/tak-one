import Test.Tasty
import Test.Tasty.HUnit

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests"
    [ testCase "Basic addition as placeholder" $
        1 + 3 @?= 4
    , testCase "Basic failure" $
        2 - 1 @?= 3
    ]
