import 'package:flutter/material.dart';
//game folder
import 'package:ssp_extreme/screens/game/data/game_data.dart';
import 'package:ssp_extreme/screens/game/data/gamelogic.dart';
import 'package:ssp_extreme/screens/game/widgets/opponent_inventory.dart';
import 'package:ssp_extreme/screens/game/widgets/score.dart';
import 'package:ssp_extreme/screens/game/widgets/panel.dart';
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
  /*Gamecircle  - Step one
  Set up/back the Gameboard.
  - Textpanel asks Player to chose Gesture
  - active Inventory re-/build without selected Gesture
  > Step two by Gesture Detector in active Inventorycard
*/
  Widget displayOutput = const StyledText('Choose your fighter');
  late Function(Gesture) playerInventoryFunction = gameStateTwo;

  @override
  void initState() {
    super.initState();
    gamedata = widget.gamedata;
  }

  void gameStateTwo(Gesture gesture) {
    //Gamecircle - Step two
    //Process User Input. After the active Inventoryard was pressed
    setState(() {
      //rebuild active Inventory with the Userinput highlighted
      selected = gesture;
      //rebuilds Textpanel with Button to lock Unserinput
      //> Step three by pressing Panel Button
      displayOutput = FilledButton(
        onPressed: () {
          gameStateThree();
        },
        child: StyledTitle('Lock in ${selected?.name}'),
      );
    });
  }

  void gameStateThree() async {
    /*Gamestate Three:
  -chose Opponent Gesture
  -rebuild Panel opponent pick
  -decide who won the Game
  >sleep
  -rebuild Panel who won 
  -rebuild score  
  >sleep*/
    //pick computer Gesture
    Gesture comPick = computerPick(gamedata.computerInventory);
    //delare a round winner
    String diplayOutputText = checkWinner(selected!, comPick, gamedata);
    setState(() {
      //lock Playerinventory
      playerInventoryFunction = (gesture) {};
      // display computer Pick
      displayOutput = StyledText('the computer picked ${comPick.name}');
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      //display Winner
      displayOutput = StyledText(diplayOutputText);
      gamedata.computerScore;
      gamedata.playerScore;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      //reset Gameboard
      selected = null;
      displayOutput = const StyledText('Choose your fighter!');
      playerInventoryFunction = gameStateTwo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            isGame = false;
            //TODO: Delete gamedata for Performance
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
            //Top Part: Opponent Inventory
            children: [
              OpponentInventory(gestureList: gamedata.computerInventory),
              SizedBox(
                height: 1.6,
                child: Container(color: AppColor.textColor),
              ),
            ],
          ),

          Column(
            // Middle Part: Scores and Panel
            children: [
              Score(score: gamedata.computerScore),
              StyledHeading('Computer'),
              Panel(displayOutput: displayOutput),
              StyledHeading('Player'),
              Score(score: gamedata.playerScore),
            ],
          ),
          //lower Part: Player Inventory
          ActiveInventory(
            inventoryList: gamedata.playerInventory,
            onPressedButton: playerInventoryFunction,
            selected: selected,
          ),
        ],
      ),
    );
  }
}
