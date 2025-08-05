import 'package:flutter/material.dart';
import 'package:ssp_extreme/screens/cheatsheet/cheatsheet.dart';
import 'package:ssp_extreme/shared/widgets/active_inventory.dart';
import 'package:ssp_extreme/screens/inventory/widgets/gesture_card.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import 'package:ssp_extreme/shared/data/data.dart';
import '../../shared/data/gesture_class.dart';

class InventoryScreen extends StatefulWidget {
  final VoidCallback onReturn;
  const InventoryScreen({required this.onReturn, super.key});
  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  late VoidCallback onReturn;
  @override
  void initState() {
    onReturn = widget.onReturn;
    super.initState();
  }

  void inventorySetState(Gesture gesture) {
    //Rebuild Screen by Inventory change
    if (gesture.isInventory == false && inventoryList.length < 4) {
      //add selected Gesture
      setState(() {
        gesture.isInventory = !gesture.isInventory;
        inventoryList.add(gesture);
      });
    } else if (gesture.isInventory == true) {
      //removes selected Gesture
      setState(() {
        gesture.isInventory = !gesture.isInventory;
        inventoryList.remove(gesture);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryAccent,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            onReturn();
            Navigator.pop(context);
          },
        ),
        title: StyledTitle("Inventory"),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_book_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => CheatsheetScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/img/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                ListView.builder(
                  itemCount: gestureList.length,
                  itemBuilder: (_, index) {
                    return GestureCard(
                      gestureList[index],
                      onPressed: inventorySetState,
                    );
                  },
                ),
              ],
            ),
          ),

          //Inventory
          ActiveInventory(
            inventoryList: inventoryList,
            onPressedButton: inventorySetState,
          ),
        ],
      ),
    );
  }
}
