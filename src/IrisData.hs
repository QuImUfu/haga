{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE NoImplicitPrelude #-}

module IrisData where

import Data.Csv
import Protolude

data IrisClass = Setosa | Virginica | Versicolor deriving (Eq, Generic, Show, Enum, Bounded)

instance FromRecord IrisClass

instance ToRecord IrisClass

irisTrainingData :: [((Float, Float, Float, Float), IrisClass)]
irisTrainingData =
  [ ((6.7, 3.1, 4.4, 1.4), Versicolor),
    ((5.4, 3.7, 1.5, 0.2), Setosa),
    ((5.4, 3.0, 4.5, 1.5), Versicolor),
    ((5.1, 3.8, 1.5, 0.3), Setosa),
    ((5.0, 2.3, 3.3, 1.0), Versicolor),
    ((6.0, 2.7, 5.1, 1.6), Versicolor),
    ((4.6, 3.2, 1.4, 0.2), Setosa),
    ((5.6, 2.7, 4.2, 1.3), Versicolor),
    ((6.7, 3.3, 5.7, 2.1), Virginica),
    ((6.9, 3.1, 5.1, 2.3), Virginica),
    ((7.7, 3.8, 6.7, 2.2), Virginica),
    ((6.1, 2.8, 4.7, 1.2), Versicolor),
    ((5.8, 2.7, 3.9, 1.2), Versicolor),
    ((6.7, 3.3, 5.7, 2.5), Virginica),
    ((5.0, 3.4, 1.5, 0.2), Setosa),
    ((4.7, 3.2, 1.6, 0.2), Setosa),
    ((6.8, 3.0, 5.5, 2.1), Virginica),
    ((6.2, 2.2, 4.5, 1.5), Versicolor),
    ((5.7, 3.8, 1.7, 0.3), Setosa),
    ((5.8, 4.0, 1.2, 0.2), Setosa),
    ((7.2, 3.2, 6.0, 1.8), Virginica),
    ((5.8, 2.7, 4.1, 1.0), Versicolor),
    ((6.5, 3.0, 5.8, 2.2), Virginica),
    ((6.9, 3.2, 5.7, 2.3), Virginica),
    ((5.8, 2.7, 5.1, 1.9), Virginica),
    ((5.2, 4.1, 1.5, 0.1), Setosa),
    ((4.6, 3.6, 1.0, 0.2), Setosa),
    ((4.7, 3.2, 1.3, 0.2), Setosa),
    ((6.9, 3.1, 5.4, 2.1), Virginica),
    ((6.1, 2.9, 4.7, 1.4), Versicolor),
    ((6.0, 3.4, 4.5, 1.6), Versicolor),
    ((5.6, 3.0, 4.5, 1.5), Versicolor),
    ((5.2, 3.4, 1.4, 0.2), Setosa),
    ((6.3, 3.3, 4.7, 1.6), Versicolor),
    ((7.2, 3.6, 6.1, 2.5), Virginica),
    ((6.5, 3.2, 5.1, 2.0), Virginica),
    ((6.3, 2.5, 4.9, 1.5), Versicolor),
    ((5.1, 3.8, 1.9, 0.4), Setosa),
    ((7.0, 3.2, 4.7, 1.4), Versicolor),
    ((4.9, 3.1, 1.5, 0.1), Setosa),
    ((4.9, 2.4, 3.3, 1.0), Versicolor),
    ((6.1, 3.0, 4.9, 1.8), Virginica),
    ((4.9, 3.1, 1.5, 0.1), Setosa),
    ((6.2, 2.9, 4.3, 1.3), Versicolor),
    ((5.7, 3.0, 4.2, 1.2), Versicolor),
    ((7.2, 3.0, 5.8, 1.6), Virginica),
    ((5.0, 2.0, 3.5, 1.0), Versicolor),
    ((4.3, 3.0, 1.1, 0.1), Setosa),
    ((6.7, 3.1, 4.7, 1.5), Versicolor),
    ((5.5, 2.4, 3.8, 1.1), Versicolor),
    ((5.7, 2.8, 4.5, 1.3), Versicolor),
    ((7.7, 2.8, 6.7, 2.0), Virginica),
    ((7.6, 3.0, 6.6, 2.1), Virginica),
    ((4.9, 2.5, 4.5, 1.7), Virginica),
    ((5.1, 2.5, 3.0, 1.1), Versicolor),
    ((6.4, 2.8, 5.6, 2.1), Virginica),
    ((6.4, 2.8, 5.6, 2.2), Virginica),
    ((5.9, 3.0, 5.1, 1.8), Virginica),
    ((4.4, 3.2, 1.3, 0.2), Setosa),
    ((6.3, 2.3, 4.4, 1.3), Versicolor),
    ((5.4, 3.4, 1.7, 0.2), Setosa),
    ((4.9, 3.0, 1.4, 0.2), Setosa),
    ((6.7, 3.0, 5.2, 2.3), Virginica),
    ((5.0, 3.5, 1.3, 0.3), Setosa),
    ((5.1, 3.3, 1.7, 0.5), Setosa),
    ((7.7, 2.6, 6.9, 2.3), Virginica),
    ((5.6, 2.9, 3.6, 1.3), Versicolor),
    ((7.3, 2.9, 6.3, 1.8), Virginica),
    ((6.7, 3.1, 5.6, 2.4), Virginica),
    ((6.3, 2.8, 5.1, 1.5), Virginica),
    ((5.6, 2.5, 3.9, 1.1), Versicolor),
    ((5.4, 3.9, 1.3, 0.4), Setosa),
    ((5.5, 2.3, 4.0, 1.3), Versicolor),
    ((6.4, 2.7, 5.3, 1.9), Virginica),
    ((5.1, 3.5, 1.4, 0.3), Setosa),
    ((5.5, 3.5, 1.3, 0.2), Setosa),
    ((5.0, 3.2, 1.2, 0.2), Setosa),
    ((5.1, 3.4, 1.5, 0.2), Setosa),
    ((5.4, 3.9, 1.7, 0.4), Setosa),
    ((4.5, 2.3, 1.3, 0.3), Setosa),
    ((6.7, 3.0, 5.0, 1.7), Versicolor),
    ((5.0, 3.3, 1.4, 0.2), Setosa),
    ((7.1, 3.0, 5.9, 2.1), Virginica),
    ((5.8, 2.6, 4.0, 1.2), Versicolor),
    ((6.3, 2.7, 4.9, 1.8), Virginica),
    ((6.8, 3.2, 5.9, 2.3), Virginica),
    ((6.6, 3.0, 4.4, 1.4), Versicolor),
    ((5.4, 3.4, 1.5, 0.4), Setosa),
    ((5.0, 3.6, 1.4, 0.2), Setosa),
    ((5.9, 3.2, 4.8, 1.8), Versicolor),
    ((6.3, 2.5, 5.0, 1.9), Virginica),
    ((6.0, 3.0, 4.8, 1.8), Virginica),
    ((7.9, 3.8, 6.4, 2.0), Virginica),
    ((5.9, 3.0, 4.2, 1.5), Versicolor),
    ((4.8, 3.0, 1.4, 0.1), Setosa),
    ((5.7, 2.8, 4.1, 1.3), Versicolor),
    ((6.7, 2.5, 5.8, 1.8), Virginica),
    ((5.7, 2.6, 3.5, 1.0), Versicolor),
    ((4.4, 3.0, 1.3, 0.2), Setosa),
    ((4.8, 3.4, 1.9, 0.2), Setosa),
    ((6.3, 3.4, 5.6, 2.4), Virginica),
    ((5.5, 4.2, 1.4, 0.2), Setosa),
    ((5.0, 3.0, 1.6, 0.2), Setosa),
    ((5.7, 2.9, 4.2, 1.3), Versicolor),
    ((6.2, 2.8, 4.8, 1.8), Virginica),
    ((6.2, 3.4, 5.4, 2.3), Virginica),
    ((6.5, 3.0, 5.2, 2.0), Virginica),
    ((4.9, 3.1, 1.5, 0.1), Setosa),
    ((5.8, 2.7, 5.1, 1.9), Virginica),
    ((5.1, 3.5, 1.4, 0.2), Setosa),
    ((5.6, 2.8, 4.9, 2.0), Virginica),
    ((5.5, 2.4, 3.7, 1.0), Versicolor),
    ((6.1, 2.8, 4.0, 1.3), Versicolor),
    ((5.7, 4.4, 1.5, 0.4), Setosa),
    ((6.9, 3.1, 4.9, 1.5), Versicolor),
    ((5.8, 2.8, 5.1, 2.4), Virginica),
    ((5.7, 2.5, 5.0, 2.0), Virginica),
    ((6.8, 2.8, 4.8, 1.4), Versicolor),
    ((6.3, 2.9, 5.6, 1.8), Virginica),
    ((6.0, 2.2, 4.0, 1.0), Versicolor),
    ((5.0, 3.5, 1.6, 0.6), Setosa),
    ((4.6, 3.1, 1.5, 0.2), Setosa),
    ((4.8, 3.4, 1.6, 0.2), Setosa),
    ((4.8, 3.0, 1.4, 0.3), Setosa),
    ((6.4, 2.9, 4.3, 1.3), Versicolor),
    ((5.5, 2.6, 4.4, 1.2), Versicolor),
    ((5.2, 2.7, 3.9, 1.4), Versicolor),
    ((6.0, 2.9, 4.5, 1.5), Versicolor),
    ((5.3, 3.7, 1.5, 0.2), Setosa),
    ((6.4, 3.2, 5.3, 2.3), Virginica),
    ((6.4, 3.1, 5.5, 1.8), Virginica),
    ((5.1, 3.8, 1.6, 0.2), Setosa),
    ((5.1, 3.7, 1.5, 0.4), Setosa),
    ((4.6, 3.4, 1.4, 0.3), Setosa),
    ((5.6, 3.0, 4.1, 1.3), Versicolor),
    ((6.1, 3.0, 4.6, 1.4), Versicolor),
    ((5.2, 3.5, 1.5, 0.2), Setosa),
    ((7.4, 2.8, 6.1, 1.9), Virginica),
    ((6.5, 2.8, 4.6, 1.5), Versicolor),
    ((6.3, 3.3, 6.0, 2.5), Virginica),
    ((4.8, 3.1, 1.6, 0.2), Setosa),
    ((7.7, 3.0, 6.1, 2.3), Virginica),
    ((6.0, 2.2, 5.0, 1.5), Virginica),
    ((5.5, 2.5, 4.0, 1.3), Versicolor),
    ((6.5, 3.0, 5.5, 1.8), Virginica),
    ((4.4, 2.9, 1.4, 0.2), Setosa),
    ((6.4, 3.2, 4.5, 1.5), Versicolor),
    ((5.0, 3.4, 1.6, 0.4), Setosa),
    ((6.1, 2.6, 5.6, 1.4), Virginica),
    ((6.6, 2.9, 4.6, 1.3), Versicolor)
  ]

