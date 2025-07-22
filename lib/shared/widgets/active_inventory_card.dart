import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';

class ActiveInventoryCard extends StatelessWidget {
  const ActiveInventoryCard({
    required this.gesture,
    required this.onPressed,
    super.key,
  });

  //fields init
  final void Function(Gesture) onPressed;
  final Gesture gesture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(gesture);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryAccentTwo,
          border: Border.all(width: 1.2, color: AppColor.primaryAccent),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/img/gestures/${gesture.name}.png",
                      ),
                      //image gets greyed out, when selected
                      colorFilter: ColorFilter.mode(
                        AppColor.primaryAccentTwo,
                        BlendMode.color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img/gestures/${gesture.name}.png",
                    ),
                  ),
                ),
              ),
            ),
            Positioned(right: 15, bottom: 10, child: StyledText(gesture.name)),
            Positioned(
              right: 5,
              top: 5,
              child: Icon(Icons.close, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
