{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedLabels #-}

module Api.Request where

import Data.Aeson hiding (json)
import Data.Environment
import Data.Model.Property (Property)
import Data.Model.Request (Request (_id))
import qualified Data.ReqWithProps as RWP
import qualified Data.ReqWithPropsWithoutId as RWPWI
import qualified Database.Common as Db
import Database.Selda
import qualified Database.Table as Table
import Network.HTTP.Types.Status (created201, notFound404)
import Utils.Id.AddId (addId)

getWithProps :: EnvAction ()
getWithProps = do
  reqId <- param "_id"
  res <- query $ select Table.requests `suchThat` (\req -> req ! #_id .== literal reqId)
  case res of
    [req] -> do
      props <-
        query $
          select Table.properties `suchThat` (\prop -> prop ! #requestId .== literal reqId)
      json $ object ["request" .= req, "properties" .= props]
    _ -> status notFound404 >> finish

updateWithProps :: EnvAction ()
updateWithProps = do
  RWP.RWP {RWP.req, RWP.props} <- jsonData
  let reqId = _id req
  -- Deactivate old props
  update_
    Table.properties
    (\p -> p ! #requestId .== literal reqId)
    (\p -> p `with` [#active := false])
  -- Add the new props
  insert_ Table.properties (addId def <$> props)
  -- Update the request
  Db.update Table.requests reqId req

createWithProps :: EnvAction ()
createWithProps = do
  RWPWI.RWP {RWPWI.req, RWPWI.props} <- jsonData
  newRequest <- Db.create Table.requests req
  insert_ Table.properties (addId def <$> props)
  json newRequest
  status created201
