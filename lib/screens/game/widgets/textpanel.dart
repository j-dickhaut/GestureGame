import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';

class TextPanel extends StatefulWidget {
  final String displayText;

  const TextPanel({this.displayText = 'debug Text', super.key});

  @override
  State<TextPanel> createState() => _TextPanelState();
}

class _TextPanelState extends State<TextPanel> {
  late String displayText;
  @override
  void initState() {
    super.initState();
    displayText = widget.displayText;
  }

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
            child: StyledText(displayText),
          ),
        ],
      ),
    );
  }
}
