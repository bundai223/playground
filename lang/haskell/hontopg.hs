-- 本当のプログラマはHaskellを使う
-- http://itpro.nikkeibp.co.jp/article/COLUMN/20060915/248215/

repeated f n = \x -> (iterate f x)!!n

