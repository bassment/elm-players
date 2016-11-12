module Main exposing (..)

import Navigation
import State exposing (State, initialState)
import Actions exposing (Action(..))
import Update exposing (update)
import View exposing (view)
import Players.Commands exposing (fetchAll)
import Routing exposing (Route)

-- MAIN

main : Program Never
main =
  Navigation.program Routing.parser {
    init = init,
    view = view,
    update = update,
    urlUpdate = urlUpdate,
    subscriptions = subscriptions
  }


init : Result String Route -> ( State, Cmd Action )
init result =
  let
    currentRoute =
      Routing.routeFromResult result
  in
    (initialState currentRoute, Cmd.map PlayerAction fetchAll)


-- SUBSCRIPTIONS

subscriptions : State -> Sub Action
subscriptions state =
  Sub.none


urlUpdate : Result String Route -> State -> (State, Cmd Action)
urlUpdate result state =
  let
    currentRoute =
      Routing.routeFromResult result
  in
    ({state | route = currentRoute}, Cmd.none)
