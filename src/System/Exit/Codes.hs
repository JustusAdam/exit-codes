{-|
Module      : $Header$
Description : BSD exit codes exposed to Haskell
Copyright   : (c) Justus Adam, 2015 - 2018
License     : BSD-3
Maintainer  : dev@justus.science
Stability   : experimental
Portability : POSIX

These are Haskell values generated by the C pre processor which expose exit
codes as defined by the BSD project in "sysexits.h".

Please note that the values shown in the documentation are also inserted by the
preprocessor and thus technically only valid for the platform this documentation
was built on.

As may be evident from the structure here both the integer value for the exit
code as well as the 'ExitCode' value (to be used with 'exitWith') are exposed.

The format for a given code is:

[EX_ERRORNAME] Error code CPP macro as defined by the @sysexits.h@ header
[exErrorName] 'Int' value for the error
[codeErrorName] 'ExitCode' value for the error

The documentation snippets I copied from
<https://www.freebsd.org/cgi/man.cgi?query=sysexits&apropos=0&sektion=0&manpath=FreeBSD+4.3-RELEASE&format=html>.
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

  -- * Bounds
  , exBase, exMax
  ) where

import System.Exit

#include <sysexits.h>

-- | successful termination (EX_OK)
--
-- The successful exit is always indicated by a status of 0, or 'exOk'.
exOk :: Int
exOk = EX_OK

-- | successful termination (EX_OK)
codeOk :: ExitCode
codeOk = ExitSuccess

-- | base value for error messages (EX__BASE)
--
--  Error numbers begin at 'exBase' to reduce the possibility of clashing with
--  other exit statuses that random programs may already return.
exBase :: Int
exBase = EX__BASE

-- | command line usage error (EX_USAGE)
--
-- The command was used incorrectly, e.g., with the wrong number of arguments, a
-- bad flag, a bad syntax in a parameter, or whatever.
exUsage :: Int
exUsage = EX_USAGE

-- | command line usage error (EX_USAGE)
codeUsage :: ExitCode
codeUsage = ExitFailure exUsage

-- | data format error (EX_DATAERR)
--
-- The input data was incorrect in some way. This should only be used for user's
-- data and not system files.
exDataErr :: Int
exDataErr = EX_DATAERR

-- | data format error (EX_DATAERR)
codeDataErr :: ExitCode
codeDataErr = ExitFailure exDataErr

-- | cannot open input (EX_NOINPUT)
--
-- An input file (not a system file) did not exist or was not readable. This
-- could also include errors like "No message" to a mailer (if it cared to
-- catch it).
exNoInput :: Int
exNoInput = EX_NOINPUT

-- | cannot open input (EX_NOINPUT)
codeNoInput :: ExitCode
codeNoInput = ExitFailure exNoInput

-- | addressee unknown (EX_NOUSER)
--
-- The user specified did not exist. This might be used for mail addresses or
-- remote logins.
exNoUser :: Int
exNoUser = EX_NOUSER

-- | addressee unknown (EX_NOUSER)
codeNoUser :: ExitCode
codeNoUser = ExitFailure exNoUser

-- | host name unknown (EX_NOHOST)
--
-- The host specified did not exist. This is used in mail addresses or network
-- requests.
exNoHost :: Int
exNoHost = EX_NOHOST

-- | host name unknown (EX_NOHOST)
codeNoHost :: ExitCode
codeNoHost = ExitFailure exNoHost

-- | service unavailable (EX_UNAVAILABLE)
--
-- A service is unavailable. This can occur if a support program or file does
-- not exist. This can also be used as a catchall message when something you
-- wanted to do doesn't work, but you don't know why.
exUnavailable :: Int
exUnavailable = EX_UNAVAILABLE

-- | service unavailable (EX_UNAVAILABLE)
codeUnavaiable :: ExitCode
codeUnavaiable = ExitFailure exUnavailable

-- | internal software error (EX_SOFTWARE)
--
-- An internal software error has been detected. This should be limited to
-- non-operating system related errors as possible.
exSoftware :: Int
exSoftware = EX_SOFTWARE

-- | internal software error (EX_SOFTWARE)
codeSoftware :: ExitCode
codeSoftware = ExitFailure exSoftware

-- | system error
-- (EX_OSERR)
--
-- An operating system error has been detected. This is intended to be used for
-- such things as "cannot fork", "cannot create pipe", or the like. It includes
-- things like getuid returning a user that does not exist in the passwd file.
exOsErr :: Int
exOsErr =  EX_OSERR

-- | system error
-- (EX_OSERR)
codeOsErr :: ExitCode
codeOsErr = ExitFailure exOsErr

-- | critical OS file missing (EX_OSFILE)
--
-- Some system file (e.g., @/etc/passwd@, @/var/run/utmp@, etc.) does not exist,
-- cannot be opened, or has some sort of error (e.g., syntax error).
exOsFile :: Int
exOsFile = EX_OSFILE

-- | critical OS file missing (EX_OSFILE)
codeOsFile :: ExitCode
codeOsFile = ExitFailure exOsFile

-- | can't create (user) output file
-- (EX_CANTCREAT)
--
-- A (user specified) output file cannot be created.
exCantCreate :: Int
exCantCreate = EX_CANTCREAT

-- | can't create (user) output file
-- (EX_CANTCREAT)
codeCantCreate :: ExitCode
codeCantCreate = ExitFailure exCantCreate

-- | input/output error (EX_IOERR)
--
-- An error occurred while doing I/O on some file.
exIOErr :: Int
exIOErr =  EX_IOERR

-- | input/output error (EX_IOERR)
codeIOErr :: ExitCode
codeIOErr = ExitFailure exIOErr

-- | temp failure; user is invited to retry (EX_TEMPFAIL)
--
-- Temporary failure, indicating something that is not really an error. In
-- sendmail, this means that a mailer (e.g.) could not create a connection, and
-- the request should be reattempted later.
exTempFail :: Int
exTempFail = EX_TEMPFAIL

-- | temp failure; user is invited to retry (EX_TEMPFAIL)
codeTempFail :: ExitCode
codeTempFail = ExitFailure exTempFail

-- | remote error in protocol (EX_PROTOCOL)
--
-- The remote system returned something that was "not possible" during a protocol exchange.
exProtocol :: Int
exProtocol = EX_PROTOCOL

-- | remote error in protocol (EX_PROTOCOL)
codeProtocol :: ExitCode
codeProtocol = ExitFailure exProtocol

-- | permission denied (EX_NOPERM)
--
-- You did not have sufficient permission to perform the operation. This is not
-- intended for file system problems, which should use 'exNoInput' or
-- 'exNoPerm', but rather for higher level permissions.
exNoPerm :: Int
exNoPerm = EX_NOPERM

-- | permission denied (EX_NOPERM)
codeNoPerm :: ExitCode
codeNoPerm = ExitFailure exNoPerm

-- | configuration error (EX_CONFIG)
--
-- Something was found in an unconfigured or misconfigured state.
exConfig :: Int
exConfig = EX_CONFIG

-- | configuration error (EX_CONFIG)
codeConfig :: ExitCode
codeConfig = ExitFailure exConfig

-- | maximum listed value (EX__MAX)
exMax :: Int
exMax = EX__MAX
