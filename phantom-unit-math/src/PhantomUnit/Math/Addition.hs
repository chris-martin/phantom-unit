{-# LANGUAGE FlexibleInstances #-}

module PhantomUnit.Math.Addition
    ( Addition (..)
    ) where

import qualified Data.Ratio
import qualified Prelude

class Addition a where
    (+) :: a -> a -> a

instance Addition Prelude.Int where
    (+) = (Prelude.+)

instance Addition Prelude.Integer where
    (+) = (Prelude.+)

instance Addition (Data.Ratio.Ratio Prelude.Int) where
    (+) = (Prelude.+)

instance Addition (Data.Ratio.Ratio Prelude.Integer) where
    (+) = (Prelude.+)

instance Addition Prelude.Float where
    (+) = (Prelude.+)

instance Addition Prelude.Double where
    (+) = (Prelude.+)
