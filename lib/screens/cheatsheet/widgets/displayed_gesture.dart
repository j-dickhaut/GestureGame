import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/data/gesture_class.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';

class DisplayedGesture extends StatelessWidget {
  final Gesture gesture;
  const DisplayedGesture({required this.gesture, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsetsGeometry.all(14),
          padding: const EdgeInsetsGeometry.all(14),
          color: AppColor.primaryAccentTwo,
          child: StyledHeading(gesture.name),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 150,
              padding: EdgeInsetsGeometry.all(10),
              color: AppColor.primaryAccentTwo,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: gesture.winningMatchups.length,
                itemBuilder: (_, index) {
                  return StyledText(gesture.winningMatchups[index]);
                },
              ),
            ),
            Container(
              width: 150,
              padding: EdgeInsetsGeometry.all(10),
              color: AppColor.primaryAccentTwo,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: gesture.losingMatchups.length,
                itemBuilder: (_, index) {
                  return StyledText(gesture.losingMatchups[index]);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DebugColumn extends StatelessWidget {
  const DebugColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColor.primaryAccentTwo, child: Text('debug'));
  }
}
