import 'package:flutter/material.dart';

import 'package:ssp_extreme/screens/game/data/game_data.dart';
import 'package:ssp_extreme/shared/data/data.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/widgets/active_inventory.dart';

class GameScreen extends StatefulWidget {

  final GameData gamedata;

  GameScreen({required this.gamedata, super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late GameData gamedata;
  Gesture? selected;

  @override
  void initState() {
    super.initState();
    gamedata = widget.gamedata;
  }

  void gameSetState(Gesture gesture){
    setState(() {
      selected = gesture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            isGame = false;
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.close, color: Colors.red)
          ),
        title: StyledTitle('Gamescreen'),
      ),
      body: ActiveInventory(
        inventoryList: gamedata.playerInventory ,
        onPressedButton: gameSetState,
        selected: selected,
        ),

    );
  }
}