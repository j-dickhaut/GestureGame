import 'package:flutter/material.dart';

import 'package:ssp_extreme/screens/game/data/game_data.dart';
import 'package:ssp_extreme/shared/data/data.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/widgets/active_inventory.dart';

class GameScreen extends StatefulWidget {
  GameScreen({required this.gamedata, super.key});

  GameData gamedata;
  Gesture? selected;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  void gameSetState(Gesture gesture){
    setState(() {
      widget.selected = gesture;
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
        inventoryList: widget.gamedata.playerInventory ,
        onPressedButton: gameSetState,
        selected: widget.selected,
        ),

    );
  }
}