module Solution30 (sum5_1, sum5_2, sum5_3, sum5_4, sum5_5) where
import Data.Char

-- хвостовая рекурсия

digitSum :: Int -> Int
digitSum =  sum . map (^5) . map digitToInt . show

sum5_1a :: Int -> Int
sum5_1a n | n == 354294 = 0
          | n == digitSum n = n + sum5_1a(n+1)
          | otherwise = sum5_1a (n+1)

sum5_1 :: Int
sum5_1 = sum5_1a 10

-- рекурсия
sum5_2a :: Int -> Int
sum5_2a n | n > 10 && n == digitSum n = n + sum5_2a(n-1)
          | n > 10 = sum5_2a(n-1)
          | otherwise = 0

sum5_2 :: Int
sum5_2 = sum5_2a 354294

-- модульной реализации,
-- где явно разделена генерация последовательности, фильтрация и свёртка
sqnce :: [Int]
sqnce = [10 .. 354294]

s_filter :: [Int]
s_filter = filter (\x -> x == digitSum x) sqnce

sum5_3 :: Int
sum5_3 = foldr (+) 0 s_filter

-- генерация последовательности при помощи отображения (map)
sum5_4 :: Int
sum5_4 = sum . map(\x -> if x == digitSum x then x else 0) $
        (takeWhile (\x -> x <= 354294) [10..])

-- работа с бесконечными списками для языков поддерживающих
-- ленивые коллекции или итераторы как часть языка

s_filter2 :: [Int]
s_filter2 = filter (\x -> x == digitSum x)
                    (takeWhile (\x -> x <= 354294) [10..])

sum5_5 :: Int
sum5_5 = sum s_filter2
