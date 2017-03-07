{-# LANGUAGE FlexibleInstances, FlexibleContexts, MultiParamTypeClasses,
             ScopedTypeVariables, TypeApplications #-}

module PhantomUnit.Time.ToDuration
    ( ToDuration (..)
    ) where

import PhantomUnit.Math
import PhantomUnit.Time.Duration
import PhantomUnit.Time.TimeUnit

import qualified Data.Ratio
import qualified Prelude

class ToDuration u n a where
    toDuration :: a -> Duration u n

instance (TimeUnit u, TimeUnit u', TimeScalar n, ScalarDivision n n') => ToDuration u' n' (Duration u n) where
    toDuration x = duration @u' ( toScalar x
                                * (secondsPerTimeUnit @u)
                                / (secondsPerTimeUnit @u')
                                )

instance ToDuration u Prelude.Int Prelude.Int where
    toDuration = duration @u

instance ToDuration u Prelude.Integer Prelude.Integer where
    toDuration = duration @u

instance ToDuration u (Data.Ratio.Ratio Prelude.Int) (Data.Ratio.Ratio Prelude.Int) where
    toDuration = duration @u

instance ToDuration u (Data.Ratio.Ratio Prelude.Integer) (Data.Ratio.Ratio Prelude.Integer) where
    toDuration = duration @u

instance ToDuration u Prelude.Float Prelude.Float where
    toDuration = duration @u

instance ToDuration u Prelude.Double Prelude.Double where
    toDuration = duration @u
