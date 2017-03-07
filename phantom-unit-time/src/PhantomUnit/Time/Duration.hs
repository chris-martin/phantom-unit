{-# LANGUAGE ExplicitForAll, ScopedTypeVariables, TypeApplications #-}

module PhantomUnit.Time.Duration
    ( Duration
    , duration
    , toScalar
    ) where

import PhantomUnit.Math
import PhantomUnit.Time.TimeUnit

import Data.Semigroup ((<>))
import Prelude (Show, show)

data Duration u n = Duration { toScalar :: n }

instance (TimeUnit u, Show n) => Show (Duration u n) where
    show (Duration n) = "Duration @" <> timeUnitName @u <> " (" <> show n <> ")"

duration :: forall u n. n -> Duration u n
duration = Duration
