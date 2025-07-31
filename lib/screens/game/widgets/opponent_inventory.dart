import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';

class OpponentInventory extends StatelessWidget {
  final List<Gesture> gestureList;
  const OpponentInventory({required this.gestureList, super.key});

  Widget tabelCell(int listIndex) {
    return Container(
      margin: const EdgeInsetsGeometry.all(4),
      padding: const EdgeInsetsGeometry.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.gestureColor[gestureList[listIndex].name]![0],
          width: 1.6,
        ),
      ),
      child: Row(
        children: [
          StyledText(gestureList[listIndex].name),
          Expanded(child: SizedBox()),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/img/gestures/${gestureList[listIndex].name}.png",
                ),
                //
                /*colorFilter: gesture.isInventory
                      ? ColorFilter.mode(AppColor.primaryAccentTwo.withAlpha(alpha + 20), BlendMode.color)
                      : null*/
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsGeometry.all(4),
      color: AppColor.primaryAccentTwo,
      child: Table(
        children: [
          TableRow(
            children: [
              TableCell(child: tabelCell(0)),
              TableCell(child: tabelCell(1)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: tabelCell(2)),
              TableCell(child: tabelCell(3)),
            ],
          ),
        ],
      ),
    );
  }
}
