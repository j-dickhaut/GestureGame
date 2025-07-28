import 'package:flutter/material.dart';
//game folder
import 'package:ssp_extreme/screens/game/data/game_data.dart';
import 'package:ssp_extreme/screens/game/widgets/opponent_inventory.dart';
import 'package:ssp_extreme/screens/game/widgets/score.dart';
import 'package:ssp_extreme/screens/game/widgets/textpanel.dart';
//shared folder
import 'package:ssp_extreme/shared/data/data.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import 'package:ssp_extreme/shared/widgets/active_inventory.dart';

class GameScreen extends StatefulWidget {
  final GameData gamedata;

  const GameScreen({required this.gamedata, super.key});

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

  void gameSetState(Gesture gesture) {
    setState(() {
      selected = gesture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            isGame = false;
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: Colors.red),
        ),
        title: StyledTitle('Gamescreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              OpponentInventory(gestureList: gamedata.computerInventory),
              SizedBox(
                height: 1.6,
                child: Container(color: AppColor.textColor),
              ),
            ],
          ),

          Column(
            children: [
              Score(score: 0),
              StyledHeading('Computer'),
              TextPanel(displayText: 'chose your fighter'),
              StyledHeading('Player'),
              Score(score: 2),
            ],
          ),

          ActiveInventory(
            inventoryList: gamedata.playerInventory,
            onPressedButton: gameSetState,
            selected: selected,
          ),
        ],
      ),
    );
  }
}
