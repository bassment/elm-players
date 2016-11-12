module State exposing (..)

import Players.State exposing (Player)
import Routing

-- STATE

type alias State = {
  players : List Player,
  route : Routing.Route
}


initialState : Routing.Route -> State
initialState route = { players = [], route = route }
