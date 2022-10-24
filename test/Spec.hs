-- module Main (main) where

import Test.HUnit
import Test.QuickCheck
import Solution1
import Solution30

main :: IO ()
main = runTestTTAndExit tests

-- ==========================Tests 1======================================
test1_1 :: Test
test1_1 = TestCase (assertEqual "for (sumOfPrimes 1)," 234168 p1)

test2_1 :: Test
test2_1 = TestCase (assertEqual "for (sumOfPrimes 1)," 234168 p2)

test3_1 :: Test
test3_1 = TestCase (assertEqual "for (sumOfPrimes 1)," 234168 p3)

test4_1 :: Test
test4_1 = TestCase (assertEqual "for (sumOfPrimes 1)," 234168 p4)
-- ==========================Tests 30=====================================
test1_30 :: Test
test1_30 = TestCase (assertEqual "for (sumOfPrimes 1)," 443839 sum5_1)

test2_30 :: Test
test2_30 = TestCase (assertEqual "for (sumOfPrimes 1)," 443839 sum5_2)

test3_30 :: Test
test3_30 = TestCase (assertEqual "for (sumOfPrimes 1)," 443839 sum5_3)

test4_30 :: Test
test4_30 = TestCase (assertEqual "for (sumOfPrimes 1)," 443839 sum5_4)

tests :: Test
tests = TestList [TestLabel "test1_1" test1_1, TestLabel "test2_1" test2_1,
                  TestLabel "test3_1" test3_1, TestLabel "test3_1" test4_1,
                  TestLabel "test1_30" test1_30, TestLabel "test2_30" test2_30,
                  TestLabel "test3_30" test3_30, TestLabel "test4_30" test4_30]
