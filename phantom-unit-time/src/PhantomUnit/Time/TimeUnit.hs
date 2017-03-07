{-# LANGUAGE AllowAmbiguousTypes, DefaultSignatures, FlexibleContexts,
             RankNTypes, ScopedTypeVariables, ConstraintKinds #-}

module PhantomUnit.Time.TimeUnit
    ( TimeUnit (..), TimeScalar
    ) where

import PhantomUnit.Math

import Data.String (IsString (fromString))
import Data.Typeable (Typeable, typeOf)
import Prelude (show, undefined)

import qualified Prelude

type TimeScalar n =
    ( Exponentiation Prelude.Int Prelude.Int n
    , FromInteger n
    , ScalarMultiplication n
    )

class TimeUnit u where

    secondsPerTimeUnit :: forall n. TimeScalar n => n

    timeUnitName :: forall s. IsString s => s
    default timeUnitName :: (Typeable u, IsString s) => s
    timeUnitName = fromString (show (typeOf (undefined :: u)))
