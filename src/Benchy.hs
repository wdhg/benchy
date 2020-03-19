{-# LANGUAGE BangPatterns #-}
module Benchy where

import Data.Time.Clock.POSIX

data Benchmark
  = Benchmark POSIXTime POSIXTime
  | BenchmarkN [Benchmark]

instance Show Benchmark where
  show benchmark@(Benchmark start end)
    =  "===== BENCHMARK ====="
    ++ "\nSTART TIME: " ++ (show start)
    ++ "\n  END TIME: " ++ (show end)
    ++ "\nTIME TAKEN: " ++ (show $ timeTaken benchmark)
  show benchmark@(BenchmarkN benchmarks)
    =  "===== BENCHMARK ====="
    ++ "\n[RAN " ++ (show $ length benchmarks) ++ " BENCHMARKS]"
    ++ "\nMEAN TIME TAKEN: " ++ (show $ timeTaken benchmark)

timeTaken :: Benchmark -> POSIXTime
timeTaken (Benchmark start end)
  = end - start
timeTaken (BenchmarkN benchmarks)
  = (sum times) / (fromIntegral $ length times)
    where
      times
        = map timeTaken benchmarks

bench :: a -> IO Benchmark
bench action
  = do
    !start <- getPOSIXTime
    let !_ = action
    !end   <- getPOSIXTime
    return $ Benchmark start end

benchN :: Int -> a -> IO Benchmark
benchN n value
  = BenchmarkN <$> (mapM bench $ replicate n value)
