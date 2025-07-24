import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/data/data.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import 'package:ssp_extreme/shared/widgets/active_inventory_card.dart';

import '../data/gesture_class.dart';

class ActiveInventory extends StatelessWidget {
  const ActiveInventory({required this.inventoryList, required this.onPressedButton, this.selected, super.key});
  //add isGameVar

  final List<Gesture> inventoryList; //implemented for Reuseability
  final void Function(Gesture) onPressedButton;
  final  Gesture? selected; 
  final double rowHeight = 75;

  Widget inventoryCardSetting (int index){
    //checks if Inventory is part of Game or InventoryScreen and returns the right Card
    //Inventory: when cell is empty give out a placeholder widget
    //Game: when cell is selected change color
    if(isGame){
      if(selected == inventoryList[index]){
        return ActiveInventoryCard(
          gesture: inventoryList[index],
          onPressed: onPressedButton,
          isGame: isGame,
          isSelected: true,
        );    
      }else{
        return ActiveInventoryCard(
          gesture: inventoryList[index],
          onPressed: onPressedButton,
          isGame: isGame,
        );
      }
    }else{
      if (inventoryList.asMap().containsKey(index)) {
        return ActiveInventoryCard(
          gesture: inventoryList[index],
          onPressed: onPressedButton,
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.2, color: AppColor.primaryAccentTwo),
          ),
        );
      }
    }
  }    
  @override
  Widget build(BuildContext context) {
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              TableCell(
                child: SizedBox(
                  height: rowHeight,
                  child: inventoryCardSetting(0),
                ),
              ),  
              TableCell(
                child: SizedBox(
                  height: rowHeight,
                  child: inventoryCardSetting(1),
                ),
              ),  
            ],
          ),

          TableRow(
            children: [
              TableCell(
                child: SizedBox(
                  height: rowHeight,
                  child: inventoryCardSetting(2),
                ),
              ),
              TableCell(
                child: SizedBox(
                  height: rowHeight,
                  child: inventoryCardSetting(3),
                ),
              ),
            ],
          ),
        ],
      );    
  }
}
