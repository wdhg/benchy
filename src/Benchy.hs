{-# LANGUAGE BangPatterns #-}
module Benchy where

import Data.Time.Clock.POSIX

data Benchmark
  = Benchmark POSIXTime POSIXTime

instance Show Benchmark where
  show (Benchmark start end)
    =  "===== BENCHMARK ====="
    ++ "\nSTART TIME: "
    ++ (show start)
    ++ "\n  END TIME: "
    ++ (show end)
    ++ "\nTIME TAKEN: "
    ++ (show $ end - start)

bench :: a -> IO Benchmark
bench value
  = do
    !start <- getPOSIXTime
    let !_ = value
    !end   <- getPOSIXTime
    return $ Benchmark start end
