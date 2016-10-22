import Html exposing (Html, div, text)
import Html.App as App


-- MAIN

main : Program Never
main =
  App.program {
    init = init,
    view = view,
    update = update,
    subscriptions = subscriptions
  }

-- STATE

type alias State = String

init : ( State, Cmd Action )
init =
  ( "Hello", Cmd.none )


-- ACTION TYPES

type Action = NoOp


-- UPDATE

update : Action -> State -> ( State, Cmd Action )
update action state =
  case action of
    NoOp ->
      ( state, Cmd.none )


-- VIEW

view : State -> Html Action
view state =
  div []
    [ text state ]


-- SUBSCRIPTIONS

subscriptions : State -> Sub Action
subscriptions state =
  Sub.none
