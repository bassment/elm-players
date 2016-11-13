module Players.Update exposing (..)

import Navigation
import Players.Actions exposing (Action(..))
import Players.State exposing (Player, PlayerId)
import Players.Commands exposing (save)


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

    ChangeLevel id howMuch ->
      (players, changeLevelCommands id howMuch players |> Cmd.batch)

    SaveSuccess updatedPlayer ->
      (updatePlayer updatedPlayer players, Cmd.none)

    SaveFail error ->
      (players, Cmd.none)


changeLevelCommands : PlayerId -> Int -> List Player -> List (Cmd Action)
changeLevelCommands playerId howMuch players =
  let
    cmdForPlayer existingPlayer =
      if existingPlayer.id == playerId then
        save {existingPlayer | level = existingPlayer.level + howMuch}
      else
          Cmd.none
  in
    List.map cmdForPlayer players


updatePlayer : Player -> List Player -> List Player
updatePlayer updatedPlayer players =
  let
    select existingPlayer =
      if existingPlayer.id == updatedPlayer.id then
        updatedPlayer
      else
        existingPlayer
  in
    List.map select players
