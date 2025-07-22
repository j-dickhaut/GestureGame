import 'package:ssp_extreme/shared/data/data.dart';

class Gesture {

  //Fields
  //init
  final String name;
  final int index;

  //Inventory
  bool isInventory;

  //Matchups
  final List<String> _winningMatchups = [];
  final List<String> _losingMatchups = [];
  List<String> gestureListString = Data.gestureList;
  int deltaIndex = 0;

  //constructor
  Gesture({
    required this.name,
    required this.index,
    this.isInventory = false,
  }){
    //initializer
    loadMatchups();
  }

  //getter
  List<String> get winningMatchups => _winningMatchups;
  List<String> get losingMatchups => _losingMatchups;

  void changeIsInventory(){
    //only way to change the private variable _isInventory and add gesture to inventory
    isInventory = !isInventory;
  }

  void loadMatchups(){
    //filling Lists _winningMatchups and _losing_matchups with values

     for(int i=0; i <gestureListString.length; i++){
       deltaIndex = index - i;

       if(deltaIndex < -7){
         _winningMatchups.add(gestureListString[i]);
       }
       else if(deltaIndex < 0){
         _losingMatchups.add(gestureListString[i]);
       }
       else if(deltaIndex == 0){
         continue;
       }
       else if(deltaIndex <=7){
         _winningMatchups.add(gestureListString[i]);
       }
       else{
         _losingMatchups.add(gestureListString[i]);
       }

     }
  }

}