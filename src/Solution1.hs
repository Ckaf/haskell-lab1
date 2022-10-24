module Solution1 (p1, p2, p3, p4, p5) where
import Data.Set as Set
import Data.List (sort)

-- хвостовая рекурсия
p1_a :: Int -> Int
p1_a n | n == 0 = 0
       | n `mod` 5 == 0 || n `mod` 3 == 0 = n + p1_a(n-1)
       | otherwise = p1_a (n-1)

p1 :: Int
p1 = p1_a 1000
-- рекурсия
p5_a :: Int -> Int
p5_a n | (n <= 1000 && ((n `mod` 5 == 0 )||( n `mod` 3 == 0))) = n + p5_a(n+1)
       | n <= 1000 = p5_a(n+1)
       | otherwise = 0

p5 :: Int
p5 = p5_a 0
-- модульная реализация

p2_list :: [Int]
p2_list = [1..1000]

p2_filter :: [Int]
p2_filter = Prelude.filter (\x -> x `mod` 3 == 0
                    || x `mod` 5 == 0) p2_list

p2 :: Int
p2 = sum p2_filter


-- генерация последовательности
-- при помощи отображения (map)
p3_fst_l :: [Int]
p3_fst_l = Prelude.map (*3) [1..333]

p3_snd_l :: [Int]
p3_snd_l = Prelude.map (*5) [1..200]

p3_final_l :: Set Int
p3_final_l = Set.fromList( p3_fst_l ++ p3_snd_l)

p3 :: Int
p3 = sum p3_final_l

-- работа с бесконечными списками для языков поддерживающих
-- ленивые коллекции или итераторы как часть языка
p4_filter :: [Int]
p4_filter = Prelude.filter (\x -> x `mod` 3 == 0
                    || x `mod` 5 == 0)
                    (takeWhile (\x -> x <= 1000) [1..])
p4 :: Int
p4 = sum p4_filter
