module Players.Update exposing (..)

import Players.Actions exposing (Action(..))
import Players.State exposing (Player)

update : Action -> List Player -> (List Player, Cmd Action)
update action players =
  case action of
    FetchAllDone newPlayers ->
      (newPlayers, Cmd.none)

    FetchAllFail error ->
      (players, Cmd.none)
