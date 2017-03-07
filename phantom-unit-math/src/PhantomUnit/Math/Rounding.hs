{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

module PhantomUnit.Math.Rounding
    ( Rounding (..)
    ) where

import PhantomUnit.Math.FromInteger

import qualified Data.Ratio
import qualified GHC.Float
import qualified Prelude

class Rounding b a where
    round :: a -> b


--------------------------------------------------------------------------------
--  Trivial lossless conversions
--------------------------------------------------------------------------------

instance FromInteger i => Rounding i Prelude.Integer where
    round = fromInteger

instance FromInteger i => Rounding i Prelude.Int where
    round a = fromInteger (Prelude.toInteger a)

instance Rounding Prelude.Float Prelude.Float where
    round a = a

instance Rounding Prelude.Double Prelude.Double where
    round a = a

instance Rounding (Data.Ratio.Ratio a) (Data.Ratio.Ratio a) where
    round r = r


--------------------------------------------------------------------------------
--  Converting from Float
--------------------------------------------------------------------------------

instance Rounding Prelude.Int Prelude.Float where
    round = Prelude.round

instance Rounding Prelude.Integer Prelude.Float where
    round = Prelude.round

instance Rounding Prelude.Double Prelude.Float where
    round = GHC.Float.float2Double


--------------------------------------------------------------------------------
--  Converting from Double
--------------------------------------------------------------------------------

instance Rounding Prelude.Int Prelude.Double where
    round = Prelude.round

instance Rounding Prelude.Integer Prelude.Double where
    round = Prelude.round

instance Rounding Prelude.Float Prelude.Double where
    round = GHC.Float.double2Float


--------------------------------------------------------------------------------
--  Converting from Ratio
--------------------------------------------------------------------------------

instance Rounding Prelude.Int (Data.Ratio.Ratio Prelude.Int) where
    round = Prelude.round

instance Rounding Prelude.Int (Data.Ratio.Ratio Prelude.Integer) where
    round = Prelude.round

instance Rounding Prelude.Integer (Data.Ratio.Ratio Prelude.Int) where
    round = Prelude.round

instance Rounding Prelude.Integer (Data.Ratio.Ratio Prelude.Integer) where
    round = Prelude.round

instance Rounding Prelude.Float (Data.Ratio.Ratio Prelude.Int) where
    round x = Prelude.fromIntegral (Data.Ratio.numerator x) Prelude./
              Prelude.fromIntegral (Data.Ratio.denominator x)

instance Rounding Prelude.Float (Data.Ratio.Ratio Prelude.Integer) where
    round x = Prelude.fromIntegral (Data.Ratio.numerator x) Prelude./
              Prelude.fromIntegral (Data.Ratio.denominator x)

instance Rounding Prelude.Double (Data.Ratio.Ratio Prelude.Int) where
    round x = Prelude.fromIntegral (Data.Ratio.numerator x) Prelude./
              Prelude.fromIntegral (Data.Ratio.denominator x)

instance Rounding Prelude.Double (Data.Ratio.Ratio Prelude.Integer) where
    round x = Prelude.fromIntegral (Data.Ratio.numerator x) Prelude./
              Prelude.fromIntegral (Data.Ratio.denominator x)
