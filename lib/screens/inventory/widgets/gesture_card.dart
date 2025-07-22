import 'package:flutter/material.dart';

import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import '../../../shared/data/gesture_class.dart';

class GestureCard extends StatelessWidget {
   const GestureCard(this.gesture,{required this.onPressed, this.alpha = 200, super.key});
  
  final Gesture gesture;
  final void Function(Gesture) onPressed;
  // visibility, when selected in Inventory
  final int alpha;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          onPressed(gesture);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: Row(children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/img/gestures/${gesture.name}.png"),
                  //image gets greyed out, when selected
                  colorFilter: gesture.isInventory
                      ? ColorFilter.mode(AppColor.primaryAccentTwo.withAlpha(alpha + 20), BlendMode.color)
                      : null
                ),
              ),
            ),
            SizedBox(width: 10,),
            StyledHeading("${gesture.index + 1}. ${gesture.name}"),
            Expanded(child: SizedBox(),),
            IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.info,
                  //icon with lower transparency, when selected
                  color:gesture.isInventory
                      ? AppColor.textColor.withAlpha(100)
                      : AppColor.gestureColor[gesture.name]![0],
                  size: 30,
                ),
            ),
            SizedBox(width: 10,),
            Icon(Icons.arrow_forward_ios_outlined,
              //icon with lower transparency, when selected
              color: gesture.isInventory
                  ? AppColor.gestureColor[gesture.name]![0].withAlpha(0)
                  : AppColor.gestureColor[gesture.name]![0],
            ),
          ],),
        ),
      ),
    );
  }
}


