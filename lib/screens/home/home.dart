import "package:flutter/material.dart";
import "package:ssp_extreme/screens/cheatsheet/cheatsheet.dart";
import "package:ssp_extreme/screens/game/data/game_data.dart";
import "package:ssp_extreme/screens/game/game.dart";

import "package:ssp_extreme/screens/inventory/inventory.dart";
import "package:ssp_extreme/screens/options/options.dart";
import "package:ssp_extreme/shared/data/data.dart";
import "package:ssp_extreme/shared/theme/styled_text.dart";
import "package:ssp_extreme/shared/theme/theme.dart";
import "widgets/column_buttons.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle("Gesture Game")),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/img/background.png", fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: EdgeInsetsGeometry.symmetric(vertical: 5),
                  margin: EdgeInsetsGeometry.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(color: AppColor.primaryAccent),
                  child: Column(
                    children: [
                      StyledHeading("Stone Paper Scissors"),
                      StyledHeading("but bigger"),
                    ],
                  ),
                ),
                ColumnButtonBig(
                  text: "Play",
                  onPressed: () {
                    if (inventoryList.length == 4) {
                      //TODO: Else (Error), when Player Inventory is not full
                      isGame = true;
                      GameData gamedata = GameData(gameId: 1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => GameScreen(gamedata: gamedata),
                        ),
                      );
                    }
                  },
                  icon: Icons.play_arrow,
                ),
                ColumnButton(
                  text: "Inventory",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => InventoryScreen()),
                    );
                  },
                  icon: Icons.backpack_outlined,
                ),
                ColumnButton(
                  text: "Cheatsheet",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => CheatsheetScreen()),
                    );
                  },
                  icon: Icons.copy,
                ),
                ColumnButton(
                  text: "Options",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => OptionsScreen()),
                    );
                  },
                  icon: Icons.settings,
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
