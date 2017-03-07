{-# LANGUAGE FlexibleContexts #-}

module PhantomUnit.Math
    (
    -- * Integer conversion
      FromInteger (..)
    , Rounding (..)

    -- * Arithmetic

    -- ** Addition
    , Addition (..)

    -- ** Multiplication
    , ScalarMultiplication (..)

    -- ** Division
    , ScalarDivision (..)

    -- ** Exponentation
    , Exponentiation (..)
    , e

    ) where

import PhantomUnit.Math.Addition
import PhantomUnit.Math.Exponentiation
import PhantomUnit.Math.FromInteger
import PhantomUnit.Math.Rounding
import PhantomUnit.Math.ScalarDivision
import PhantomUnit.Math.ScalarMultiplication

import qualified Prelude

e :: Exponentiation Prelude.Int Prelude.Int a => Prelude.Int -> a
e = ((10 :: Prelude.Int) ^)
