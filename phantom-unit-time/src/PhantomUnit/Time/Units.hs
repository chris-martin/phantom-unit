{-# LANGUAGE TypeApplications #-}

module PhantomUnit.Time.Units
    (
    -- | Listed from the shortest time span ('Attosecond') to largest ('Day').
      Attosecond
    , Femtosecond
    , Picosecond
    , Nanosecond
    , Microsecond
    , Millisecond
    , Second
    , Minute
    , Hour
    , Day
    ) where

import PhantomUnit.Math
import PhantomUnit.Time.TimeUnit

import Data.String (IsString (fromString))
import Data.Typeable (Typeable, typeOf)

data Attosecond  deriving Typeable
data Femtosecond deriving Typeable
data Picosecond  deriving Typeable
data Nanosecond  deriving Typeable
data Microsecond deriving Typeable
data Millisecond deriving Typeable
data Second      deriving Typeable
data Minute      deriving Typeable
data Hour        deriving Typeable
data Day         deriving Typeable

instance TimeUnit Attosecond  where secondsPerTimeUnit = e (-18)
instance TimeUnit Femtosecond where secondsPerTimeUnit = e (-15)
instance TimeUnit Picosecond  where secondsPerTimeUnit = e (-12)
instance TimeUnit Nanosecond  where secondsPerTimeUnit = e (-9)
instance TimeUnit Microsecond where secondsPerTimeUnit = e (-6)
instance TimeUnit Millisecond where secondsPerTimeUnit = e (-3)
instance TimeUnit Second      where secondsPerTimeUnit = fromInteger 1
instance TimeUnit Minute      where secondsPerTimeUnit = fromInteger 60
instance TimeUnit Hour        where secondsPerTimeUnit = secondsPerTimeUnit @Minute * fromInteger 60
instance TimeUnit Day         where secondsPerTimeUnit = secondsPerTimeUnit @Hour * fromInteger 24
