import "package:flutter/material.dart";

import "package:ssp_extreme/screens/inventory/inventory.dart";
import "package:ssp_extreme/screens/options/options.dart";
import "package:ssp_extreme/shared/theme/styled_text.dart";
import "package:ssp_extreme/shared/theme/theme.dart";
import "widgets/column_buttons.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle("SPS - extreme"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset("assets/img/background.png", fit: BoxFit.cover)
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  padding: EdgeInsetsGeometry.symmetric(vertical: 5),
                  margin: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(color: AppColor.primaryAccent),
                  child: Column(
                    children: [
                      StyledHeading("Stone Paper Scissors"),
                      StyledHeading("- extreme"),
                    ],
                  ),
                ),
                ColumnButtonBig(
                    text: "Play",
                    onPressed: (){},
                    icon: Icons.play_arrow),
                ColumnButton(
                    text: "Inventory",
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx)=> InventoryScreen(),
                        ),
                      );
                    },
                    icon: Icons.backpack_outlined),
                ColumnButton(text: "Cheatsheet", onPressed: (){}, icon: Icons.copy),
                ColumnButton(
                    text: "Settings",
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (ctx) => OptionsScreen())
                      );
                    },
                    icon: Icons.settings),
                SizedBox(height: 60,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}