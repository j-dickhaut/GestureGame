import 'package:flutter/material.dart';
import "package:ssp_extreme/screens/home/home.dart";
import 'package:ssp_extreme/shared/theme/theme.dart';

void main() {
  runApp(
    MaterialApp(
      theme: primaryTheme,
      home: HomeScreen(),
    ),
  );
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
