import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/data/data.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import 'package:ssp_extreme/shared/widgets/active_inventory_card.dart';

import '../data/gesture_class.dart';

class ActiveInventory extends StatelessWidget {
  const ActiveInventory({required this.onPressedButton, super.key});

  final void Function(Gesture) onPressedButton;
  final double tableHeight = 160;
  final double rowHeight = 75;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              TableCell(
                child: SizedBox(
                  height: rowHeight,
                  child: inventoryList.isNotEmpty
                      ? ActiveInventoryCard(
                          gesture: inventoryList[0],
                          onPressed: onPressedButton,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.2,
                              color: AppColor.primaryAccentTwo,
                            ),
                          ),
                        ),
                ),
              ),
              TableCell(
                child: SizedBox(
                  height: rowHeight,
                  child: inventoryList.length >= 2
                      ? ActiveInventoryCard(
                          gesture: inventoryList[1],
                          onPressed: onPressedButton,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.2,
                              color: AppColor.primaryAccentTwo,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),

          TableRow(
            children: [
              TableCell(
                child: SizedBox(
                  height: rowHeight,
                  child: inventoryList.length >= 3
                      ? ActiveInventoryCard(
                          gesture: inventoryList[2],
                          onPressed: onPressedButton,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.2,
                              color: AppColor.primaryAccentTwo,
                            ),
                          ),
                        ),
                ),
              ),
              TableCell(
                child: SizedBox(
                  height: rowHeight,
                  child: inventoryList.length == 4
                      ? ActiveInventoryCard(
                          gesture: inventoryList[3],
                          onPressed: onPressedButton,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.2,
                              color: AppColor.primaryAccentTwo,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
