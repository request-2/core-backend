{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Database.User where

import Config
import Crypto
import Database.General (withConfig)
import Database.SQLite.Simple
import Data.Maybe (mapMaybe)
import DateTime
import Model.User (Role, User (..))
import UserInfo (APIKey)
import WithID (ID)

verifyPassword :: ServerConfig -> ID -> String -> a -> (Connection -> IO a) -> IO a
verifyPassword c user password err f =
  withConfig c $ \db ->
    withTransaction db $ do
      res <- query db "SELECT pw_hash FROM Users WHERE user_id = ?" (Only user)
      case res of
        [[hash]] ->
          if checkHash password hash
            then f db
            else return err
        _ -> return err

login :: ServerConfig -> ID -> String -> IO (Maybe APIKey)
login c user password =
  verifyPassword c user password Nothing $ \db -> do
    apiKey <- newApiKey
    time <- now
    execute
      db
      "INSERT INTO ApiKeys (api_key, user_id, date_created) VALUES (?, ?, ?)"
      (apiKey, user, time)
    return $ Just apiKey

checkPassword :: ServerConfig -> ID -> String -> IO Bool
checkPassword c user password =
  verifyPassword c user password False (const $ pure True)

verify :: ServerConfig -> APIKey -> IO (Maybe ID)
verify c apiKey =
  withConfig c $ \db -> do
    res <-
      query
        db
        "SELECT Users.user_id FROM ApiKeys JOIN Users ON ApiKeys.user_id=Users.user_id WHERE api_key = ?"
        (Only apiKey)
    case res of
      [[user]] -> return $ Just user
      _ -> return Nothing

-- TODO Prevent leaks by setting a time limit on each API key
logout :: ServerConfig -> APIKey -> IO ()
logout c apiKey =
  withConfig c $ \db ->
    execute db "DELETE FROM ApiKeys WHERE api_key = ?" (Only apiKey)

logoutEverywhere :: ServerConfig -> ID -> IO ()
logoutEverywhere c user =
  withConfig c $ \db ->
    execute db "DELETE FROM ApiKeys WHERE user_id = ?" (Only user)

createUser :: ServerConfig -> User -> IO ()
createUser c User {..} =
  withConfig c $ \db -> do
    pwhash <- newHash password
    execute
      db
      "INSERT INTO Users (email, name, pw_hash, team_id, roles) VALUES (?, ?, ?, ?, ?)"
      (email, name, pwhash, team, rolesStr)
  where
    rolesStr = foldr (\a acc -> show a ++ acc) "" roles

deleteUser :: ServerConfig -> ID -> IO ()
deleteUser c user =
  withConfig c $ \db ->
    withTransaction db $ do
      execute db "DELETE FROM Users WHERE user_id = ?" (Only user)
      execute db "DELETE FROM ApiKeys WHERE user_id = ?" (Only user)

setPassword :: ServerConfig -> ID -> String -> IO ()
setPassword c user password =
  withConfig c $ \db -> do
    pwhash <- newHash password
    execute
      db
      "UPDATE Users SET pw_hash = ? WHERE user_id = ?"
      (pwhash, user)

getRoles :: ServerConfig -> ID -> IO (Maybe [Role])
getRoles c user = withConfig c $ \db ->
  withTransaction db $ do
    res <- query db "SELECT roles FROM Users WHERE user_id = ?" (Only user)
    case res of
      [[rolesStr]] -> return . Just . mapMaybe read . words $ rolesStr
      _ -> return Nothing
