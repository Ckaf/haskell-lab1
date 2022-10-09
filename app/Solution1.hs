module Solution1 (p1, p2, p3, p4, p5) where
import Data.Set as Set
import Data.List (sort)

-- хвостовая рекурсия

p1_a n | n == 0 = 0
       | n `mod` 5 == 0 || n `mod` 3 == 0 = n + p1_a(n-1)
       | otherwise = p1_a (n-1)

p1 = p1_a 1000
-- рекурсия
p5_a :: Integer -> Integer
p5_a n = if n <= 1000
    then
      if  (n `mod` 5 == 0 )||( n `mod` 3 == 0)
      then n + p5_a(n+1)
      else p5_a(n+1)
    else 0

p5 = p5_a 0
-- модульная реализация

p2_list = [1..1000]

p2_filter = Prelude.filter (\x -> x `mod` 3 == 0
                    || x `mod` 5 == 0) p2_list

p2 = sum p2_filter


-- генерация последовательности
-- при помощи отображения (map)

p3_fst_l = Prelude.map (*3) [1..333]
p3_snd_l = Prelude.map (*5) [1..200]
p3_final_l = Set.fromList( p3_fst_l ++ p3_snd_l)
p3 = sum p3_final_l

-- работа с бесконечными списками для языков поддерживающих
-- ленивые коллекции или итераторы как часть языка
p4_filter = Prelude.filter (\x -> x `mod` 3 == 0
                    || x `mod` 5 == 0)
                    (takeWhile (\x -> x <= 1000) [1..])

p4 = sum p4_filter
