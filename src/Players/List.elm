module Players.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Players.Actions exposing (..)
import Players.State exposing (Player)


view : List Player -> Html Action
view players =
  div []
    [
      nav players,
      list players
    ]


nav : List Player -> Html Action
nav players =
  div [class "clearfix mb2 white bg-black"]
    [ div [class "left p2"] [text "Players"] ]


list : List Player -> Html Action
list players =
  div [class "p2"]
    [table []
      [thead []
        [tr []
          [ th [] [text "Id"],
            th [] [text "Name"],
            th [] [text "Level"],
            th [] [text "Actions"]
          ]
        ],
        tbody [] (List.map playerRow players)
      ]
    ]


playerRow : Player -> Html Action
playerRow player =
  tr []
    [
      td [] [text (toString player.id)],
      td [] [text player.name],
      td [] [text (toString player.level)],
      td [] [ editBtn player ]
    ]


editBtn : Player -> Html Action
editBtn player =
  button
    [ class "btn regular", onClick (ShowPlayer player.id) ]
      [
        i [ class "fa fa-pencil mr1" ] [],
        text "Edit"
      ]
