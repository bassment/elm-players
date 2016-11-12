module Players.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Html.Events exposing (onClick)
import Players.State exposing (..)
import Players.Actions exposing (..)


view : Player -> Html Action
view state =
  div []
    [
      nav state,
      form state
    ]


nav : Player -> Html Action
nav state =
  div [ class "clearfix mb2 white bg-black p1" ]
    [ listBtn ]


listBtn : Html Action
listBtn =
  button
    [ class "btn regular", onClick ShowPlayers ]
      [
        i [ class "fa fa-chevron-left mr1" ] [],
        text "List"
      ]


form : Player -> Html Action
form player =
  div [ class "m3" ]
    [
      h1 [] [ text player.name ],
      formLevel player
    ]


formLevel : Player -> Html Action
formLevel player =
  div [ class "clearfix py1" ]
    [
      div [ class "col col-5" ] [ text "Level" ],
      div [ class "col col-7" ]
        [
          span [ class "h2 bold" ] [ text (toString player.level) ],
          btnLevelDecrease player,
          btnLevelIncrease player
        ]
    ]


btnLevelDecrease : Player -> Html Action
btnLevelDecrease player =
  a [ class "btn ml1 h1" ]
    [ i [ class "fa fa-minus-circle" ] [] ]



btnLevelIncrease : Player -> Html Action
btnLevelIncrease player =
  a [ class "btn ml1 h1" ]
    [ i [ class "fa fa-plus-circle" ] [] ]
