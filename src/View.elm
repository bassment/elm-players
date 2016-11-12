module View exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Actions exposing (Action(..))
import State exposing (State)
import Players.List
import Players.Edit
import Players.State exposing (PlayerId)
import Routing exposing (Route(..))

-- VIEW

view : State -> Html Action
view state =
  div []
    [ page state ]


page : State -> Html Action
page state =
  case state.route of
    PlayersRoute ->
      Html.App.map PlayerAction (Players.List.view state.players)

    PlayerRoute id ->
      playerEditPage state id

    NotFoundRoute ->
      notFoundView


playerEditPage : State -> PlayerId -> Html Action
playerEditPage state playerId =
  let
    maybePlayer =
      state.players
        |> List.filter (\player -> player.id == playerId)
        |> List.head

  in
    case maybePlayer of
      Just player ->
        Html.App.map PlayerAction (Players.Edit.view player)

      Nothing ->
        notFoundView


notFoundView : Html action
notFoundView =
  div []
    [ text "Not found" ]
