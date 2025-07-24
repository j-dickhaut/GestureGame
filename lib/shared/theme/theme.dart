import 'package:flutter/material.dart';

class AppColor {
  //colors
  static Color primaryColor = const Color.fromRGBO(70, 175, 137, 1.0);
  static Color primaryAccent = const Color.fromRGBO(115, 200, 161, 1.0);
  static Color primaryAccentTwo = const Color.fromRGBO(139, 215, 185, 1.0);
  static Color secondaryColor = const Color.fromRGBO(229, 185, 63, 1.0);
  static Color secondaryAccent = const Color.fromRGBO(232, 201, 100, 1.0);
  static Color titleColor = const Color.fromRGBO(220, 220, 220, 1.0);
  static Color textColor = const Color.fromRGBO(0, 0, 0, 1.0);
  static Color selectedColor = const Color.fromARGB(255, 11, 255, 11);

  static Map<String,List<Color>> gestureColor = {
    //colors for Gestures as a list
    // [0] = color for circle ,[1] = color for text
    "Sponge": [const Color(0xfffa6965), const Color(0xff582F41)],
    "Wolf": [const Color(0xff8c6545), const Color(0xff635749)],
    "Tree": [const Color(0xff4ca81c), const Color(0xff59453B)],
    "Human": [const Color(0xfffe663d), const Color(0xff8B6C58)],
    "Snake": [const Color(0xfff3cc36), const Color(0xff476F40)],
    "Scissors": [const Color(0xfffe9a2a), const Color(0xff796655)],
    "Fire": [const Color(0xfffffe39), const Color(0xffCAB47B)],
    "Rock": [const Color(0xffc8c72e), const Color(0xff416646)],
    "Gun": [const Color(0xff999997), const Color(0xff3B3B3B)],
    "Lightning": [const Color(0xfffdc0fe), const Color(0xff9C9399)],
    "Devil": [const Color(0xffb637f5), const Color(0xff622E4C)],
    "Dragon": [const Color(0xffd34014), const Color(0xff2B2B2B)],
    "Water": [const Color(0xff4299fa), const Color(0xff36444D)],
    "Air": [const Color(0xffa2fcfc), const Color(0xff8CA0A0)],
    "Paper": [const Color(0xffff9dfd), const Color(0xff574B55)]
  };

}

ThemeData primaryTheme = ThemeData(

  //seed color
  colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      brightness: Brightness.light,
      surface: AppColor.primaryAccent),

  // scaffolding
  //scaffoldBackgroundColor: AppColor.primaryAccent,

  // app bar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primaryColor,
    foregroundColor: AppColor.titleColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
  ),

  textTheme: TextTheme(

    bodyMedium: TextStyle(
      color: AppColor.textColor,
      fontSize: 16,
      letterSpacing: 1
    ),

    headlineMedium: TextStyle(
        color: AppColor.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        letterSpacing: 1
    ),

    titleMedium: TextStyle(
        color: AppColor.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        letterSpacing: 2
    ),
  ),

  //Card Theme
  cardTheme: CardThemeData(
    color: AppColor.primaryAccentTwo,
    surfaceTintColor: Colors.transparent,
    shape: ContinuousRectangleBorder(),
  ),
);

