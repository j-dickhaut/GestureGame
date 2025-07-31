import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/data/data.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import 'package:ssp_extreme/shared/widgets/active_inventory_card.dart';

import '../data/gesture_class.dart';

class ActiveInventory extends StatelessWidget {
  final List<Gesture> inventoryList; //implemented for Reuseability
  final void Function(Gesture) onPressedButton;
  final Gesture? selected;
  final double rowHeight = 75;

  const ActiveInventory({
    required this.inventoryList,
    required this.onPressedButton,
    this.selected,
    super.key,
  });

  Widget inventoryCardSetting(int index) {
    //checks if Inventory is part of Game or InventoryScreen and returns the right Card
    //Inventory: when cell is empty give out a placeholder widget
    //Game: when cell is selected change color
    if (isGame) {
      // Game Screen Widgets
      if (selected == inventoryList[index]) {
        return ActiveInventoryCard(
          gesture: inventoryList[index],
          onPressed: onPressedButton,
          isGame: isGame,
          isSelected: true,
        );
      } else {
        return ActiveInventoryCard(
          gesture: inventoryList[index],
          onPressed: onPressedButton,
          isGame: isGame,
        );
      }
    } else {
      //Inventory Screen Widget
      if (inventoryList.asMap().containsKey(index)) {
        return ActiveInventoryCard(
          gesture: inventoryList[index],
          onPressed: onPressedButton,
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.2, color: AppColor.primaryAccent),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2, child: Container(color: AppColor.primaryColor)),
        SizedBox(height: 1.6, child: Container(color: AppColor.textColor)),
        SizedBox(height: 5, child: Container(color: AppColor.primaryAccent)),
        StyledHeading('Your inventory:'),
        Container(
          color: AppColor.primaryAccentTwo,
          margin: const EdgeInsets.fromLTRB(5, 5, 5, 30),
          child: Table(
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
          ),
        ),
      ],
    );
  }
}
