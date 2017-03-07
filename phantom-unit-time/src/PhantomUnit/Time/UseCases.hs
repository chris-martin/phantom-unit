{-# LANGUAGE AllowAmbiguousTypes, ScopedTypeVariables, TypeApplications, FlexibleContexts #-}

module PhantomUnit.Time.UseCases
    ( getCPUTime
    , cpuTimePrecision
    , threadDelay
    ) where

import PhantomUnit.Time.Duration
import PhantomUnit.Time.ToDuration
import PhantomUnit.Time.FromDuration
import PhantomUnit.Time.Units

import Prelude (IO, (<$>), (.))

import qualified Control.Concurrent
import qualified Prelude
import qualified System.CPUTime

convert :: forall u n a b. (ToDuration u n a, FromDuration u n b) => a -> b
convert = fromDuration @u @n
        . toDuration   @u @n

getCPUTime :: FromDuration Picosecond Prelude.Integer a => IO a
getCPUTime = (fromDuration . duration @Picosecond <$> System.CPUTime.getCPUTime)

cpuTimePrecision :: FromDuration Picosecond Prelude.Integer a => a
cpuTimePrecision =
    fromDuration (duration @Picosecond System.CPUTime.cpuTimePrecision)

threadDelay :: ToDuration Microsecond Prelude.Int a => a -> IO ()
threadDelay = Control.Concurrent.threadDelay . convert @Microsecond @Prelude.Int
