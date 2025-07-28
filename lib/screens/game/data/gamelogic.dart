import 'dart:math';

import 'package:ssp_extreme/screens/game/data/game_data.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';

checkWinner(
  List<String> playerOneWinning,
  List<String> playerOneLosing,
  String playerTwoName,
  GameData gamedata,
) {
  //this Funtion checks who won the Round. It uses the winningMatchup and
  //losingMatchup Lists for Player 1 and compares it with Player 2.

  if (playerOneWinning.contains(playerTwoName)) {
    gamedata.increasePlayerStore();
    //set Panel Text
  } else if (playerOneLosing.contains(playerTwoName)) {
    gamedata.increaseComputerStore();
  } else {
    gamedata.draw();
  }
}

Gesture computerPick(List<Gesture> computerInventory) {
  // this Function picks in Game a Random Gesture for a Computer Enemy
  // Input: The Computer Inventory out of Game Data
  // Output: the Chosen Gesture: Use it to check who won the Round

  Random random = Random();

  return computerInventory[random.nextInt(4)];
}
