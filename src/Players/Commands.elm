module Players.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode
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


saveUrl : PlayerId -> String
saveUrl playerId =
  "http://localhost:4000/players/" ++ (toString playerId)


saveTask : Player -> Task.Task Http.Error Player
saveTask player =
  let
    body =
      memberEncoded player
        |> Encode.encode 0
        |> Http.string

    config =
      {
        verb = "PATCH",
        headers = [("Content-Type", "application/json")],
        url = saveUrl player.id,
        body = body
      }
  in
    Http.send Http.defaultSettings config
      |> Http.fromJson memberDecoder


save : Player -> Cmd Action
save player =
  saveTask player
    |> Task.perform SaveFail SaveSuccess


memberEncoded : Player -> Encode.Value
memberEncoded player =
  let
    list =
      [
        ("id", Encode.int player.id),
        ("name", Encode.string player.name),
        ("level", Encode.int player.level) ]
  in
    list
      |> Encode.object
