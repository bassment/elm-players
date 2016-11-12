module Update exposing (..)

import State exposing (State)
import Actions exposing (Action(..))
import Players.Update


-- UPDATE

update : Action -> State -> ( State, Cmd Action )
update action state =
  case action of
    PlayerAction subAction ->
      let
        (updatedPlayers, cmd) =
          Players.Update.update subAction state.players
      in
        ( {state | players = updatedPlayers}, Cmd.map PlayerAction cmd )
