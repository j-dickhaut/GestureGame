import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';

class Panel extends StatelessWidget {
  final Widget displayOutput;
  const Panel({this.displayOutput = const Text('debug Text'), super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(height: 1.6, child: Container(color: AppColor.textColor)),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.primaryAccentTwo,
              border: Border.all(color: AppColor.textColor, width: 1.6),
            ),
            child: displayOutput,
          ),
        ],
      ),
    );
  }
}
