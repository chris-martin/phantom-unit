{-# LANGUAGE FlexibleInstances, FunctionalDependencies #-}

module PhantomUnit.Math.ScalarDivision
    ( ScalarDivision (..)
    ) where

import qualified Data.Ratio
import qualified Prelude

class ScalarDivision a b | a -> b where
    (/) :: a -> a -> b

instance ScalarDivision Prelude.Int (Data.Ratio.Ratio Prelude.Int) where
    (/) = (Data.Ratio.%)

instance ScalarDivision Prelude.Integer (Data.Ratio.Ratio Prelude.Integer) where
    (/) = (Data.Ratio.%)

instance ScalarDivision (Data.Ratio.Ratio Prelude.Int) (Data.Ratio.Ratio Prelude.Int) where
    (/) = (Prelude./)

instance ScalarDivision (Data.Ratio.Ratio Prelude.Integer) (Data.Ratio.Ratio Prelude.Integer) where
    (/) = (Prelude./)

instance ScalarDivision Prelude.Float Prelude.Float where
    (/) = (Prelude./)

instance ScalarDivision Prelude.Double Prelude.Double where
    (/) = (Prelude./)
