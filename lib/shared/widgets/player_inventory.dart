import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import 'package:ssp_extreme/shared/widgets/gesture_card.dart';
import 'package:ssp_extreme/shared/widgets/gesture_card_style.dart';

//
enum PlayerInventoryStyle { inventory, gameboard }

class PlayerInventory extends StatelessWidget {
  //required
  final PlayerInventoryStyle style;
  final List<Gesture> inventoryList;
  //optional
  final void Function(Gesture)? onPressedButton;
  final Gesture? selected;

  const PlayerInventory({
    required this.style,
    required this.inventoryList,
    this.onPressedButton,
    this.selected,
    super.key,
  });

  List<GestureCardStyle> get gestureCards {
    //sets the Style of the Gesturecards in the Invenotry
    switch (style) {
      case PlayerInventoryStyle.gameboard:
        return inventoryList.map((gesture) {
          if (gesture == selected) {
            return GestureCardStyle.selected;
          } else {
            return GestureCardStyle.normal;
          }
        }).toList();
      case PlayerInventoryStyle.inventory:
        // Always return a list of 4 styles
        return List.generate(4, (index) {
          if (index < inventoryList.length) {
            return GestureCardStyle.withCloseIcon;
          } else {
            return GestureCardStyle.empty;
          }
        });
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
                    child: GestureCard(
                      gesture: inventoryList.isNotEmpty
                          ? inventoryList[0]
                          : null,
                      state: gestureCards[0],
                      onPressed: onPressedButton,
                    ),
                  ),
                  TableCell(
                    child: GestureCard(
                      gesture: inventoryList.length > 1
                          ? inventoryList[1]
                          : null,
                      state: gestureCards[1],
                      onPressed: onPressedButton,
                    ),
                  ),
                ],
              ),

              TableRow(
                children: [
                  TableCell(
                    child: GestureCard(
                      gesture: inventoryList.length > 2
                          ? inventoryList[2]
                          : null,
                      state: gestureCards[2],
                      onPressed: onPressedButton,
                    ),
                  ),
                  TableCell(
                    child: GestureCard(
                      gesture: inventoryList.length > 3
                          ? inventoryList[3]
                          : null,
                      state: gestureCards[3],
                      onPressed: onPressedButton,
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
