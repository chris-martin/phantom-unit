{-# LANGUAGE FlexibleInstances #-}

module PhantomUnit.Math.FromInteger
    ( FromInteger (..)
    ) where

import qualified Data.Ratio
import qualified Prelude

class FromInteger a where
    fromInteger :: Prelude.Integer -> a

instance FromInteger Prelude.Integer where
    fromInteger = Prelude.id

instance FromInteger Prelude.Int where
    fromInteger = Prelude.fromInteger

instance FromInteger Prelude.Float where
    fromInteger = Prelude.fromInteger

instance FromInteger Prelude.Double where
    fromInteger = Prelude.fromInteger

instance FromInteger (Data.Ratio.Ratio Prelude.Int) where
    fromInteger = Prelude.fromInteger

instance FromInteger (Data.Ratio.Ratio Prelude.Integer) where
    fromInteger = Prelude.fromInteger
