module Players.Actions exposing (..)

import Http
import Players.State exposing (PlayerId, Player)

-- ACTION TYPES

type Action
  = FetchAllDone (List Player)
  | FetchAllFail Http.Error
  | ShowPlayers
  | ShowPlayer PlayerId
  | ChangeLevel PlayerId Int
  | SaveSuccess Player
  | SaveFail Http.Error
