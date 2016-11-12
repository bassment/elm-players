module Players.Update exposing (..)

import Navigation
import Players.Actions exposing (Action(..))
import Players.State exposing (Player)

update : Action -> List Player -> (List Player, Cmd Action)
update action players =
  case action of
    FetchAllDone newPlayers ->
      (newPlayers, Cmd.none)

    FetchAllFail error ->
      (players, Cmd.none)

    ShowPlayers ->
      (players, Navigation.newUrl "#players")

    ShowPlayer id ->
      (players, Navigation.newUrl ("#players/" ++ (toString id)))
