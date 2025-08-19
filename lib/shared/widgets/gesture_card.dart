import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import 'package:ssp_extreme/shared/widgets/gesture_card_style.dart';

class GestureCard extends StatelessWidget {
  //fields init
  //required
  final GestureCardStyle state;
  //optional
  final Gesture? gesture;
  final void Function(Gesture)? onPressed;
  final double height;

  const GestureCard({
    required this.state,
    this.gesture,
    this.onPressed,
    this.height = 75,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //optional onPressed argument. Gesture detector only triggers, when is
      //function passed in
      onTap: onPressed != null ? () => onPressed!(gesture!) : null,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          //changes the color, when Card gets selected by the player in Game
          color: state.cardColor,
          border: Border.all(width: 1.2, color: AppColor.primaryAccent),
        ),
        child: state.isEmpty
            ? null
            : Stack(
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
                              "assets/img/gestures/${gesture?.name}.png",
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
                            "assets/img/gestures/${gesture?.name}.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 10,
                    child: StyledText(gesture!.name),
                  ),
                  //red colse Icon: only apears in Inventory Screen
                  if (state.isCloseIcon)
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Icon(Icons.close, color: AppColor.highlightColor),
                    ),
                ],
              ),
      ),
    );
  }
}
