{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

import Options.Applicative
import Pipes
import Protolude hiding (for)
import System.IO
import Seminar
import Szenario191

data Options = Options
  { iterations :: !N,
    populationSize :: !N
  }

options :: Parser Options
options =
  Options
    <$> option
      auto
      ( long "iterations"
          <> short 'i'
          <> metavar "N"
          <> value 1500
          <> help "Number of iterations"
      )
    <*> option
      auto
      ( long "population-size"
          <> short 'p'
          <> metavar "N"
          <> value 400
          <> help "Population size"
      )

optionsWithHelp :: ParserInfo Options
optionsWithHelp =
  info
    (helper <*> options)
    ( fullDesc
        <> progDesc "Run a GA"
        <> header "haga - Haskell implementations of EAs"
    )

main :: IO ()
main =
  execParser optionsWithHelp >>= \opts -> do
    hSetBuffering stdout NoBuffering
    let cfg = GaRunConfig {
      enviroment = AssignmentEnviroment (students prios, topics prios),
      initialEvaluator = prios,
      selectionType = Tournament 3,
      termination = (steps (iterations opts)),
      poulationSize = (populationSize opts),
      stepSize = 120,
      elitismRatio = 5/100
    }
    pop' <- runEffect (for (run cfg) logCsv)
    prios' <- calc prios  pop'
    let (res, _) = bests prios' 5 pop'
    prios' <- calc prios' res
    mapM_ (format prios') res
  where
    format seminarL s = do
      let f = fitness' seminarL s
      putErrText $ show f <> "\n" <> output (AssignmentEnviroment (students prios, topics prios)) s
    logCsv = putText . csv
    csv (t, f) = show t <> " " <> show f
