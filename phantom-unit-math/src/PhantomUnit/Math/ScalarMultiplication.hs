{-# LANGUAGE FlexibleInstances #-}

module PhantomUnit.Math.ScalarMultiplication
    ( ScalarMultiplication (..)
    ) where

import qualified Data.Ratio
import qualified Prelude

class ScalarMultiplication a where
    (*) :: a -> a -> a

instance ScalarMultiplication Prelude.Int where
    a * b = a Prelude.* b

instance ScalarMultiplication Prelude.Integer where
    a * b = a Prelude.* b

instance ScalarMultiplication (Data.Ratio.Ratio Prelude.Int) where
    a * b = a Prelude.* b

instance ScalarMultiplication (Data.Ratio.Ratio Prelude.Integer) where
    a * b = a Prelude.* b

instance ScalarMultiplication Prelude.Float where
    a * b = a Prelude.* b

instance ScalarMultiplication Prelude.Double where
    a * b = a Prelude.* b
