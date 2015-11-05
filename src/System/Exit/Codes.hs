{-|
Module      : $Header$
Description : BSD exit codes exposed to Haskell
Copyright   : (c) Justus Adam, 2015
License     : BSD-3
Maintainer  : dev@justus.science
Stability   : experimental
Portability : POSIX
-}
{-# LANGUAGE CPP #-}
module System.Exit.Codes
  ( exOk          , codeOk
  , exUsage       , codeUsage
  , exDataErr     , codeDataErr
  , exNoInput     , codeNoInput
  , exNoUser      , codeNoUser
  , exNoHost      , codeNoHost
  , exUnavailable , codeUnavaiable
  , exSoftware    , codeSoftware
  , exOsErr       , codeOsErr
  , exOsFile      , codeOsFile
  , exCantCreate  , codeCantCreate
  , exIOErr       , codeIOErr
  , exTempFail    , codeTempFail
  , exProtocol    , codeProtocol
  , exNoPerm      , codeNoPerm
  , exConfig      , codeConfig
  ) where

import System.Exit

#include <sysexits.h>

-- | successful termination
exOk :: Int
exOk = EX_OK

-- | successful termination
codeOk :: ExitCode
codeOk = ExitSuccess

-- | base value for error messages
exBase :: Int
exBase = EX__BASE

-- | command line usage error
exUsage :: Int
exUsage = EX_USAGE

-- | command line usage error
codeUsage :: ExitCode
codeUsage = ExitFailure exUsage

-- | data format error
exDataErr :: Int
exDataErr = EX_DATAERR

-- | data format error
codeDataErr :: ExitCode
codeDataErr = ExitFailure exDataErr

-- | cannot open input
exNoInput :: Int
exNoInput = EX_NOINPUT

-- | cannot open input
codeNoInput :: ExitCode
codeNoInput = ExitFailure exNoInput

-- | addressee unknown
exNoUser :: Int
exNoUser = EX_NOUSER

-- | addressee unknown
codeNoUser :: ExitCode
codeNoUser = ExitFailure exNoUser

-- | host name unknown
exNoHost :: Int
exNoHost = EX_NOHOST

-- | host name unknown
codeNoHost :: ExitCode
codeNoHost = ExitFailure exNoHost

-- | service unavailable
exUnavailable :: Int
exUnavailable = EX_UNAVAILABLE

-- | service unavailable
codeUnavaiable :: ExitCode
codeUnavaiable = ExitFailure exUnavailable

-- | internal software error
exSoftware :: Int
exSoftware = EX_SOFTWARE

-- | internal software error
codeSoftware :: ExitCode
codeSoftware = ExitFailure exSoftware

-- | system error (e.g., can't fork)
exOsErr :: Int
exOsErr =  EX_OSERR

-- | system error (e.g., can't fork)
codeOsErr :: ExitCode
codeOsErr = ExitFailure exOsErr

-- | critical OS file missing
exOsFile :: Int
exOsFile = EX_OSFILE

-- | critical OS file missing
codeOsFile :: ExitCode
codeOsFile = ExitFailure exOsFile

-- | can't create (user) output file
exCantCreate :: Int
exCantCreate = EX_CANTCREAT

-- | can't create (user) output file
codeCantCreate :: ExitCode
codeCantCreate = ExitFailure exCantCreate

-- | input/output error
exIOErr :: Int
exIOErr =  EX_IOERR

-- | input/output error
codeIOErr :: ExitCode
codeIOErr = ExitFailure exIOErr

-- | temp failure; user is invited to retry
exTempFail :: Int
exTempFail = EX_TEMPFAIL

-- | temp failure; user is invited to retry
codeTempFail :: ExitCode
codeTempFail = ExitFailure exTempFail

-- | remote error in protocol
exProtocol :: Int
exProtocol = EX_PROTOCOL

-- | remote error in protocol
codeProtocol :: ExitCode
codeProtocol = ExitFailure exProtocol

-- | permission denied
exNoPerm :: Int
exNoPerm = EX_NOPERM

-- | permission denied
codeNoPerm :: ExitCode
codeNoPerm = ExitFailure exNoPerm

-- | configuration error
exConfig :: Int
exConfig = EX_CONFIG

-- | configuration error
codeConfig :: ExitCode
codeConfig = ExitFailure exConfig

-- | maximum listed value
exMax :: Int
exMax = EX__MAX
