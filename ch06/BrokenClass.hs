{-# LANGUAGE FlexibleInstances, OverlappingInstances #-}

module BrokenClass where

import JSONClass
import SimpleJSON

instance (JSON a) => JSON [a] where
    toJValue = undefined
    fromJValue = undefined

instance (JSON a) => JSON [(String, a)] where
    toJValue = undefined
    fromJValue = undefined
