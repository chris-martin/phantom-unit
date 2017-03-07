{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

module PhantomUnit.Math.Exponentiation
    ( Exponentiation (..)
    ) where

import Data.Ord ((>=))

import qualified Data.Ratio
import qualified Prelude

class Exponentiation a b c where
    (^) :: a -> b -> c

instance Exponentiation Prelude.Int Prelude.Int (Data.Ratio.Ratio Prelude.Integer) where
    a ^ b = if b >= 0 then Prelude.toInteger a Prelude.^ b Data.Ratio.% 1
                      else 1 Data.Ratio.% (Prelude.toInteger a Prelude.^ Prelude.negate b)

instance Exponentiation Prelude.Int Prelude.Int Prelude.Float where
    a ^ b = Prelude.fromIntegral a Prelude.^^ b

instance Exponentiation Prelude.Int Prelude.Int Prelude.Double where
    a ^ b = Prelude.fromIntegral a Prelude.^^ b
