import 'dart:math';

import 'package:ssp_extreme/shared/data/data.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';

class GameData {

  GameData ({required this.gameId});

  //field variables
  final int gameId;

  //inventorys
  final List<Gesture> playerInventory = inventoryList;
  final List<Gesture> computerInventory = _randomInventory(); //computer gets a random Gesturelist as Inventory
  late Gesture playerSelection;
  late Gesture computerSelection;

  //score
  int _playerScore = 0;
  int _computerScore = 0;
  get playerScore => _playerScore;
  get computerScore => _computerScore;

  void increasePlayerStore(){
    _playerScore++;
  }
  void increaseComputerStore(){
    _computerScore++;
  }

  static List<Gesture> _randomInventory({int amount = 4}){
    //return a random Inventory with "amount" entries as a computer inventory

    Random random = Random();
    List<int> choises = [];
    List<Gesture> inventory = [];
    
    for(int i = 0; i < amount; i++){

      int r = random.nextInt(gestureList.length); //random Number of this instance

      if(choises.contains(r)){
        //number is already chosen
        i--;
      }else{
        //number not chosen. Adding new number
        choises.add(r);
        inventory.add(gestureList[r]);
      }
    }
    return inventory;
  }
}