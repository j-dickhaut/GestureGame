import "package:flutter/material.dart";
import "package:ssp_extreme/shared/data/data.dart";
import "package:ssp_extreme/shared/theme/styled_text.dart";

class ColumnButtonBig extends StatelessWidget {
  const ColumnButtonBig({
    required this.text,
    required this.onPressed,
    this.icon,
    super.key,
  });

  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 500,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 5),
      child: FilledButton.icon(
        onPressed: onPressed,
        label: StyledTitle(text),
        icon: Icon(icon),
        style: FilledButton.styleFrom(
          backgroundColor: inventoryList.length == 4 ? null : Colors.grey,
          iconSize: 35,
          shape: ContinuousRectangleBorder(),
        ),
      ),
    );
  }
}

class ColumnButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  const ColumnButton({
    required this.text,
    required this.onPressed,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 5),
      child: FilledButton.icon(
        onPressed: onPressed,
        label: StyledTitle(text),
        icon: Icon(icon),
        style: FilledButton.styleFrom(shape: ContinuousRectangleBorder()),
      ),
    );
  }
}
