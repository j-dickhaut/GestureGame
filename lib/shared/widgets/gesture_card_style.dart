import 'dart:ui';
import 'package:ssp_extreme/shared/theme/theme.dart';

enum GestureCardStyle {
  normal(
    cardColor: AppColor.primaryAccentTwo,
    isCloseIcon: false,
    isEmpty: false,
  ),
  selected(
    cardColor: AppColor.highlightColor,
    isCloseIcon: false,
    isEmpty: false,
  ),
  withCloseIcon(
    cardColor: AppColor.primaryAccentTwo,
    isCloseIcon: true,
    isEmpty: false,
  ),
  empty(
    cardColor: AppColor.primaryAccentTwo,
    isCloseIcon: false,
    isEmpty: true,
  );

  final Color cardColor;
  final bool isCloseIcon;
  final bool isEmpty;

  const GestureCardStyle({
    required this.cardColor,
    required this.isCloseIcon,
    required this.isEmpty,
  });
}
