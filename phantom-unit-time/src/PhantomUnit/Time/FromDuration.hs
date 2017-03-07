{-# LANGUAGE FlexibleInstances, FlexibleContexts, MultiParamTypeClasses, ScopedTypeVariables,
             TypeApplications #-}

module PhantomUnit.Time.FromDuration
    ( FromDuration (..)
    ) where

import PhantomUnit.Math
import PhantomUnit.Time.Duration
import PhantomUnit.Time.TimeUnit

import qualified Data.Ratio
import qualified Prelude

class FromDuration u n a where
    fromDuration :: Duration u n -> a

instance (TimeUnit u, TimeUnit u', TimeScalar n, ScalarDivision n n') => FromDuration u n (Duration u' n') where
    fromDuration x = duration @u' ( toScalar x
                                  * (secondsPerTimeUnit @u)
                                  / (secondsPerTimeUnit @u')
                                  )

instance FromDuration u Prelude.Int Prelude.Int where
    fromDuration = toScalar

instance FromDuration u Prelude.Integer Prelude.Integer where
    fromDuration = toScalar

instance FromDuration u (Data.Ratio.Ratio Prelude.Int) (Data.Ratio.Ratio Prelude.Int) where
    fromDuration = toScalar

instance FromDuration u (Data.Ratio.Ratio Prelude.Integer) (Data.Ratio.Ratio Prelude.Integer) where
    fromDuration = toScalar

instance FromDuration u Prelude.Float Prelude.Float where
    fromDuration = toScalar

instance FromDuration u Prelude.Double Prelude.Double where
    fromDuration = toScalar
