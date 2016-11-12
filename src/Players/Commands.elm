module Players.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Task
import Players.State exposing (PlayerId, Player)
import Players.Actions exposing (..)


fetchAll : Cmd Action
fetchAll = Http.get collectionDecoder fetchAllUrl
  |> Task.perform FetchAllFail FetchAllDone


fetchAllUrl : String
fetchAllUrl =
  "http://localhost:4000/players"


collectionDecoder : Decode.Decoder (List Player)
collectionDecoder =
  Decode.list memberDecoder


memberDecoder : Decode.Decoder Player
memberDecoder =
  Decode.object3 Player
    ("id" := Decode.int)
    ("name" := Decode.string)
    ("level" := Decode.int)
