module Benchy where

import Control.DeepSeq
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

bench :: NFData a => a -> IO Benchmark
bench value
  = do
    start <- getPOSIXTime
    end   <- value `deepseq` getPOSIXTime
    return $ Benchmark start end
